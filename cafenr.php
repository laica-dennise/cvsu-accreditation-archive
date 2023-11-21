<?php
session_start();
if(!isset($_SESSION['token'])){
  header('Location: login.php');
  exit;
}
require('./config.php');

$client->setAccessToken($_SESSION['token']);

if($client->isAccessTokenExpired()){
  header('Location: logout.php');
  exit;
}
$google_oauth = new Google_Service_Oauth2($client);
$user_info = $google_oauth->userinfo->get();

$user = 'root';
$password = '';
 
$database = 'cvsuaccr_db';
 
$servername='127.0.0.1';
$mysqli = new mysqli($servername, $user,
                $password, $database);
 
// Checking for connections
if ($mysqli->connect_error) {
    die('Connect Error (' .
    $mysqli->connect_errno . ') '.
    $mysqli->connect_error);
}
 
// SQL query to select data from database
$sql = " SELECT * FROM files WHERE file_directory = 'CAFENR' ORDER BY id ASC ";
$result = $mysqli->query($sql);
$mysqli->close();
?>
<<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>CvSU Accreditation Archive System</title>
        <link rel="stylesheet" type="text/css" href="styles/style4.css" />

        <style>
            .file-query {
                background: linear-gradient(rgba(255, 255, 255, .7), rgba(255, 255, 255, .7));
                border-collapse: collapse;
            }
            th, td {
                padding: 8px;
                border-bottom: 1px solid #000;
                text-align: left;
            }

            .results:hover {
                background: linear-gradient(rgba(0, 0, 0, .1), rgba(0, 0, 0, .1));
            }
        </style>
    </head>
  <body>

    <div class="container">

      <div class="nav-bar">
        <img src="images/cvsu-logo.png" class="logo">
          <p class="title">CvSU Accreditation Archive System</p>
        <div class="menu" style=>
          <button class="menu-button">
            <img src="<?=$user_info['picture'];?>" referrerpolicy="no-referrer" class="menu-icon">
          </button>
          <div class="menu-content">
            <a href="profile.php">Profile</a>
            <a href="#">Uploaded Files</a>
            <a href="./logout.php">Sign out</a>
          </div>
        </div>
      </div>

      <div class="side-navigation">
        <div id="mySidenav" class="side-nav-content">
          <a href="javascript:void(0)" class="close-button" onclick="closeNav()">&times;</a>
          <a href="cafenr.php">CAFENR</a>
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
            <li><img src="<?=$user_info['picture'];?>" referrerpolicy="no-referrer"></li>
            <li><strong>ID:</strong> <?=$user_info['id'];?></li>
            <li><strong>Full Name:</strong> <?=$user_info['givenName'];?> <?=$user_info['familyName'];?></li>
            <li><strong>Email:</strong> <?=$user_info['email'];?></li>
          </ul>
        </div>
      </div>
      <div class="upload-file">
        <button id="authorizationButton" onclick="handleAuthClick()">Authorize</button>
        <form action="upload.php" method="POST" enctype="multipart/form-data" id="upload" onsubmit="return false;">
        <input type="file" name="file" id="fileInput" accept=".pdf, .docx, .png, .jpg, .jpeg">
        <label for="directories">File Directory:</label>
        <select name="directories" id="directories">
          <option value="CAFENR">CAFENR</option>
          <option value="CAS">CAS</option>
          <option value="CCJ">CCJ</option>
          <option value="CED">CED</option>
          <option value="CEMDS">CEMDS</option>
          <option value="CEIT">CEIT</option>
          <option value="CON">CON</option>
          <option value="CSPEAR">CSPEAR</option>
          <option value="CVMBS">CVMBS</option>
          <option value="College of Medicine">College of Medicine</option>
          <option value="Graduate School and Open Learning College">Graduate School and Open Learning College</option>
        </select>
        <input id="uploadButton" onclick="uploadFile();dbUpload();" type="submit" value="Upload File">
        </form>
      </div>
      <section>
            <table class="file-query">
                <tr>
                    <th>ID</th>
                    <th>NAME</th>
                    <th>OWNER</th>
                    <th>TYPE</th>
                    <th>SIZE</th>
                    <th>DATE UPLOADED</th>
                    <th colspan="3">ACTIONS</th>
                </tr>

                <?php
                    while($rows=$result->fetch_assoc())
                    {
                ?>
                <tr class="results">
                    <td><?php echo $rows['id'];?></td>
                    <td><?php echo $rows['file_name'];?></td>
                    <td><?php echo $rows['file_owner'];?></td>
                    <td><?php echo $rows['file_type'];?></td>
                    <td><?php echo $rows['file_size'];?></td>
                    <td><?php echo $rows['upload_date'];?></td>
                    <td>
                        <button class="view" onclick="window.location.href='<?php echo $rows['file_viewLink'];?>'">View</button>
                        <button class="download" onclick="window.location.href='<?php echo $rows['file_downloadLink'];?>'">Download</button>
                        <button class="delete" onclick="deleteFile('<?php echo $rows['file_id']?>')">Delete</button>
                    </td>
                </tr>
                <?php
                    }
                ?>
            </table>
        </section>
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

    <script>
      function delayDb() {
        document.getElementById('upload').submit();
      }

      function dbUpload() {
        setTimeout("delayDb()", 10000);
      }
    </script>

    <script type="text/javascript" src="./js/gapi-upload.js"></script>
    <script async defer src="https://apis.google.com/js/api.js" onload="gapiLoaded()"></script>
    <script async defer src="https://accounts.google.com/gsi/client" onload="gisLoaded()"></script>
      <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script type="text/javascript" src="//code.jquery.com/jquery-2.1.0.min.js"></script>
  </body>
</html>