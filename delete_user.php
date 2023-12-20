<?php   
session_start();
require('./config.php');

 include './dbconfig.php';  

 $db_host = 'localhost';
 $db_user = 'root';
 $db_password = '';
 $db_name = 'cvsuaccr_db';

 $db_connection = new mysqli($db_host, $db_user, $db_password, $db_name);

 if($db_connection->error){
    die ("Connection Failed - ".$db_connection->connect_error);
}

// Check if the fileId is provided
if (isset($_POST['id'])) {
    // Get the fileId from the POST request
    $id = $_POST['id'];

    // Your database connection code goes here
    // ...

    // Perform the deletion query
    $sql = "DELETE FROM users WHERE id = '$id'";

    if($db_connection->query($sql) === TRUE){
        echo "User deleted successfully.";
    } else{
        echo "Could not delete file.";
    }

} else {
    // fileId is not provided, handle the error
    echo "User id not provided";
}
?>