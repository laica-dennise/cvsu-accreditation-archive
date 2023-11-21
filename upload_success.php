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

$db_host = 'localhost';
$db_user = 'root';
$db_password = '';
$db_name = 'cvsuaccr_db';

$db_connection = new mysqli($db_host, $db_user, $db_password, $db_name);

/*if (isset($_GET['file_name']) && isset($_GET['file_id']) && isset($_GET['view_link']) && isset($_GET['download_link'])) {
    echo $file_name = $_GET['file_name'];
    echo $file_id = $_GET['file_id'];
    echo $file_viewLink = $_GET['view_link'];
    echo $file_downloadLink = $_GET['download_link'];*/

    /*$data = json_decode(file_get_contents("php://input"), true);

    $file_name = $data["fileName"];
    $file_id = $data["fileId"];
    $file_viewLink = $data["viewLink"];
    $file_downloadLink = $data["downloadLink"];*/

    $file_id = $_COOKIE['file_id'];
    $file_name = $_COOKIE['file_name'];
    $file_viewLink = $_COOKIE['view_link'];
    $file_downloadLink = $_COOKIE['download_link'];

    // CHECK DATABASE CONNECTION
    if($db_connection->error){
        die ("Connection Failed - ".$db_connection->connect_error);
    }

    $sql = "UPDATE files SET file_id = '$file_id', file_viewLink = '$file_viewLink', file_downloadLink = '$file_downloadLink' WHERE file_name = '$file_name'";

    if ($db_connection->query($sql) === TRUE) {
        echo "";
    } else {
        echo "Sorry, there was an error uploading your file: " . $db_connection->error;
    }
//}
?>
<<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>CvSU Accreditation Archive System</title>
        <link rel="stylesheet" type="text/css" href="styles/style4.css" />

    </head>
  <body>

    <div class="container">

      <div class="nav-bar">
        <img src="images/cvsu-logo.png" class="logo">
          <p class="title">CvSU Accreditation Archive System</p>
        <div class="menu" style=>
          <button class="menu-button">
            <img src="<?=$user_info['picture'];?>" class="menu-icon">
          </button>
          <div class="menu-content">
            <a href="profile.php">Profile</a>
            <a href="#">File Directories</a>
            <a href="./logout.php">Sign out</a>
          </div>
        </div>
      </div>

      <div class="side-navigation">
        <div id="mySidenav" class="side-nav-content">
          <a href="javascript:void(0)" class="close-button" onclick="closeNav()">&times;</a>
          <a href="#">CAFENR</a>
          <a href="#">CAS</a>
          <a href="#">CCJ</a>
          <a href="#">CED</a>
          <a href="#">CEMDS</a>
          <a href="#">CEIT</a>
          <a href="#">CON</a>
          <a href="#">CSPEAR</a>
          <a href="#">CVMBS</a>
          <a href="#">College of Medicine</a>
          <a href="#">Graduate School and Open Learning College</a>
        </div>

        <div id="sidenav">
          <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776;</span>
        </div>
      </div>

      <div id="main" class="main">
        <div class="profile-box">
          <div class="profile-info">
          <ul>
            <li><img src="<?=$user_info['picture'];?>"></li>
            <li><strong>ID:</strong> <?=$user_info['id'];?></li>
            <li><strong>Full Name:</strong> <?=$user_info['givenName'];?> <?=$user_info['familyName'];?></li>
            <li><strong>Email:</strong> <?=$user_info['email'];?></li>
          </ul>
        </div>
      </div>
      <div class="redirect">
        <button id="details" onclick="getDetails()">File Details</button>
        <a href="profile.php">Okay</a>
      </div>
    </div>

    <div id="content" class="success message"><?php if(isset($message)) { echo $message; } ?>
    </div>

    <script>
      function openNav() {
        document.getElementById("mySidenav").style.width = "250px";
        document.getElementById("sidenav").style.marginLeft = "250px";
        document.getElementById("main").style.marginLeft = "250px";
      }
    
      function closeNav() {	
        document.getElementById("mySidenav").style.width = "0";
        document.getElementById("sidenav").style.marginLeft= "0";
        document.getElementById("main").style.marginLeft = "0";
      }
    </script>

    <script type="text/javascript" src="./js/gapi-upload.js"></script>
    <script async defer src="https://apis.google.com/js/api.js"
      onload="gapiLoaded()"></script>
    <script async defer src="https://accounts.google.com/gsi/client"
      onload="gisLoaded()"></script>
      <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
  </body>
</html>