<?php
session_start();
require('./config.php');

$client->setAccessToken($_SESSION['token']);

if($client->isAccessTokenExpired()){
  header('Location: logout.php');
  exit;
}
$google_oauth = new Google_Service_Oauth2($client);
$user_info = $google_oauth->userinfo->get();

$first_name = $user_info['given_name'];
$last_name = $user_info['family_name'];

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_FILES["file"]) && $_FILES["file"]["error"] == 0) {
        $target_dir = "files/";
        $target_file = $target_dir . basename($_FILES["file"]["name"]);
        $file_type = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

        $allowed_types = array("jpg", "jpeg", "png", "pdf", "docx");
        if (!in_array($file_type, $allowed_types)) {
            echo "Sorry, only PDF, DOCX, JPG, JPEG, PNG files are allowed.";
        } else {
            if (move_uploaded_file($_FILES["file"]["tmp_name"], $target_file)) {
                $file_name = $_FILES["file"]["name"];
                $file_size = $_FILES["file"]["size"];
                $file_type = $_FILES["file"]["type"];
                $file_owner = $first_name . " " . $last_name;

                $db_host = 'localhost';
                $db_user = 'root';
                $db_password = '';
                $db_name = 'cvsuaccr_db';

                $db_connection = new mysqli($db_host, $db_user, $db_password, $db_name);

                // CHECK DATABASE CONNECTION
                if($db_connection->error){
                    die ("Connection Failed - ".$db_connection->connect_error);
                }

                $sql = "INSERT INTO files (file_name, file_size, file_type, file_owner, file_id) VALUES ('$file_name', '$file_size', '$file_type', '$file_owner', '')";

                if ($db_connection->query($sql) === TRUE) {
                    echo "The file " . basename($_FILES["file"]["name"]) . " has been uploaded in the database.";
                } else {
                    echo "Sorry, there was an error uploading your file: " . $db_connection->error;
                }
            }
        }
    } else {
        echo "No file was uploaded.";
    }
}
header("Location: profile.php");
?>