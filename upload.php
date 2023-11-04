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

/*function clean_data($data){   // sanitizes inputs
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}

// need to decode JSON, if you don't use JSON just pass the $_POST to clean_data()
$fileid_dirty = json_decode($_POST['file_id']);
$viewLink_dirty = json_decode($_POST['file_viewLink']);
$downloadLink_dirty = json_decode($_POST['file_downloadLink']);

// takes parameters from AJAX call and passes them to clean_data() for sanitization
$file_id = clean_data($_POST['file_id']);
$file_viewLink = clean_data($_POST['view_link']);
$file_downloadLink = clean_data($_POST['download_link']);*/

//$file_viewLink = $_COOKIE['object.viewLink'];
//$file_downloadLink = $_COOKIE['object.downloadLink'];

//$data = json_decode(file_get_contents("php://input"), true);

$file_id = json_decode($_POST["fileId"]);
$file_viewLink = json_decode($_POST["viewLink"]);
$file_downloadLink = json_decode($_POST["downloadLink"]);

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

                //if (isset($_POST['fileId']) && isset($_POST['viewLink']) && isset($_POST['downloadLink'])) {

                    // CHECK DATABASE CONNECTION
                    if($db_connection->error){
                        die ("Connection Failed - ".$db_connection->connect_error);
                    }

                    $sql = "INSERT INTO files (file_name, file_size, file_type, file_owner, file_id, file_viewLink, file_downloadLink) VALUES ('$file_name', '$file_size', '$file_type', '$file_owner', '$file_id', '$file_viewLink', '$file_downloadLink')";

                    if ($db_connection->query($sql) === TRUE) {
                        echo "The file " . basename($_FILES["file"]["name"]) . " has been uploaded in the database.";
                    } else {
                        echo "Sorry, there was an error uploading your file: " . $db_connection->error;
                    }
                }
            //} else {
            //    echo "No file was uploaded.";
            //}
        }
    } else {
        echo "No file was uploaded.";
    }
}
header("Location: upload_success.php");

/*$db_host = 'localhost';
$db_user = 'root';
$db_password = '';
$db_name = 'cvsuaccr_db';

$db_connection = new mysqli($db_host, $db_user, $db_password, $db_name);

$file_name = $_POST['file_name'];
$file_id = $_POST['file_id'];
$file_viewLink = $_POST['view_link'];
$file_downloadLink = $_POST['download_link'];

// CHECK DATABASE CONNECTION
if($db_connection->error){
    die ("Connection Failed - ".$db_connection->connect_error);
}

$sql = "UPDATE files (file_id, file_viewLink, file_downloadLink) SET ('$file_id', '$file_viewLink', '$file_downloadLink') WHERE file_name = '$file_name'";

if ($db_connection->query($sql) === TRUE) {
    echo "The file " . basename($_FILES["file"]["name"]) . " has been uploaded in the database.";
} else {
    echo "Sorry, there was an error uploading your file: " . $db_connection->error;
}*/
?>