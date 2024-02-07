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

$email = $user_info['email'];

$result2 = $mysqli->query("SELECT user_level FROM users WHERE email = '$email'");
$row2 = $result2->fetch_assoc();

if ($row2['user_level'] != '2') {
  echo '<script>alert("The user is not authorized to access this page!");</script>';
  echo '<script>window.location.href = "login.php";</script>';
}

// getting user info for uploaded files
$email = $user_info['email'];
$first_name = $user_info['givenName'];
$last_name = $user_info['familyName'];
$file_owner = $first_name . " " . $last_name;
$owner_email = $user_info['email'];

/// Function to get user level
function getUserLevel() {
    global $user_info, $mysqli;
  
    // Assuming your users table has a 'user_level' column
    $email = $user_info['email'];
    $result = $mysqli->query("SELECT user_level FROM users WHERE email = '$email'");
  
    if ($result && $result->num_rows > 0) {
        $row = $result->fetch_assoc();
        return $row['user_level'];
    } else {
        // Default user level if not found
        return 0;
    }
  }
 
// SQL query to select data from database
$sql = " SELECT * FROM users WHERE email = '$email' && first_name = '$first_name' && last_name = '$last_name' ";
$sql1 = " SELECT * FROM files WHERE file_owner = '$file_owner' && owner_email = '$owner_email' && CURDATE() > valid_until ORDER BY id ASC ";
$result = $mysqli->query($sql);
$result1 = $mysqli->query($sql1);
$mysqli->close();
?>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>CvSU Accreditation Archive System</title>
        <link rel="stylesheet" type="text/css" href="styles/style4.css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

        <style>
          .file-query {
            background: linear-gradient(rgba(255, 255, 255, .7), rgba(255, 255, 255, .7));
            border-collapse: collapse;
            z-index: 0;
            width: 765px;
          }
          th, td {
            padding: 8px;
            border: 1px solid #ddd;
            cursor: default;
            text-align: center;
          }

          th {
            background-color: #af514c;
            color: white;
          }

          td {
            color: red;
          }

          .results:hover {
            background: linear-gradient(rgba(0, 0, 0, .1), rgba(0, 0, 0, .1));
          }
        </style>

    </head>
  <body>

    <div class="container-fluid">

      <div id="main" class="main">
        <div class="profile-box">
          <div id="sidenav" class="sidenav" hidden>
            <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776;</span>
          </div>
          <div class="profile-boxx">
          <div class="profile-info">
            <p class="profile-label" style="margin-left:12px;font-size:40px;color:#174a21;cursor:default;margin-top:10px;"><b>PROFILE</b></p>
          <?php
            while($rows=$result->fetch_assoc())
            {
          ?>
            <ul>
              <li class="profile-pic" style="text-align:center;margin-right:40px;margin-bottom:20px;"><img class="pic" src="<?=$user_info['picture'];?>" referrerpolicy="no-referrer" width="150px" height="150px"></li>
              <li style="cursor:default;font-size:15px;text-align:center;margin-right:40px;margin-bottom:20px;"><strong>Full Name:</strong> <?=$user_info['givenName'];?> <?=$user_info['familyName'];?></li>
              <li style="cursor:default;font-size:15px;text-align:center;margin-right:40px;margin-bottom:20px;"><strong>Email:</strong> <?=$user_info['email'];?></li>
              <li style="cursor:default;font-size:15px;text-align:center;margin-right:40px;margin-bottom:20px;"><strong>User Level:</strong> College Accreditation Officer</li>
              <li style="cursor:default;font-size:15px;text-align:center;margin-right:40px;margin-bottom:20px;"><strong>College:</strong> <?=$rows['college'];?></li>
            </ul>
          <?php
            }
          ?>
          </div>
        </div>
      </div>

      <div class="outdated-part">
        <div class="outdated-box">
          <div class="outdated-boxx">
		      <div class="alert alert-info" style="margin-top:10px;width:300px;margin-left:10px;background:linear-gradient(rgba(255, 0, 0, 0.7), rgba(255, 0, 0, 0.7));color: #fff;cursor:default;">
            <b>OUTDATED FILES</b>
          </div>
          <section>
            <table class="file-query">
                <tr>
                    <th style="width:300px;">NAME</th>
                    <th style="width:200px;">DATE UPLOADED</th>
                    <th style="width:100px;">COLLEGE</th>
                    <th style="width:150px;">TAGS</th>
                </tr>

                <?php
                    while($rows=$result1->fetch_assoc())
                    {
                ?>
                <tr class="results">
                    <td><?php echo substr($rows['file_name'], 0, 40); ?></td>
                    <td><?php echo $rows['upload_date'];?></td>
                    <td><?php echo $rows['file_directory'];?></td>
                    <td class="text-center">
                      <?php
                      $tags = explode(',', $rows['file_tags']);
                      $cleanedTags = [];

                      foreach ($tags as $tag) {
                          $tag = trim($tag);
                          if (!empty($tag)) {
                              // Remove "×" marks and extra commas
                              $tag = str_replace('×', '', $tag);
                              $cleanedTags[] = '' . htmlspecialchars($tag);
                          }
                      }

                      $formattedTags = implode(', ', $cleanedTags);
                      echo rtrim($formattedTags, ' ');
                      ?>
                    </td>
                </tr>
                <?php
                    }
                ?>
            </table>
        </section>
          </div>
        </div>
      </div>
    </div>

    <div class="nav-bar">
        <img src="images/cvsu-logo.png" class="logo">
          <p class="title">CvSU Accreditation Archive System</p>
        <div class="menu">
          <button class="menu-button">
            <img src="<?=$user_info['picture'];?>" referrerpolicy="no-referrer" class="menu-icon">
          </button>
          <div class="menu-content">
            <a href="uploaded_files.php">Uploaded Files</a>
            <a href="outdated_files.php">Outdated Files</a>
            <a href="college_users.php">User List</a>
            <a href="college_directory.php">College Directory</a>
            <a href="#" data-toggle="modal" data-target="#logout">Sign Out</a>
          </div>
        </div>
      </div>

      <div class="side-navigation">
        <div id="mySidenav" class="side-nav-content">
          <a href="javascript:void(0)" class="close-button" onclick="closeNav()">&times;</a>
          <a href="cafenr.php">CAFENR</a>
          <a href="cas.php">CAS</a>
          <a href="ccj.php">CCJ</a>
          <a href="ced.php">CED</a>
          <a href="cemds.php">CEMDS</a>
          <a href="ceit.php">CEIT</a>
          <a href="nursing.php">CON</a>
          <a href="cspear.php">CSPEAR</a>
          <a href="cvmbs.php">CVMBS</a>
          <a href="com.php">College of Medicine</a>
          <a href="graduate_school.php">Graduate School and Open Learning College</a>
        </div>
      </div>

 <!-- Modal logout -->
 <div class="modal fade" id="logout" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"> System </h4>
        </div>
        <div class="modal-body">
          <p> Are you sure you want to sign out? </p>
        </div>
        <div class="modal-footer">
          <a href="./logout.php" class="btn btn-danger" >Sign out</a>
          <button type="button" class="btn btn-success" data-dismiss="modal"> Close </button>
        </div>
      </div>
    </div>
  </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <div id="content" class="success message"><?php if(isset($message)) { echo $message; } ?>
    </div>

    <script>
      function openNav() {
        document.getElementById("mySidenav").style.width = "250px";
        document.getElementById("sidenav").style.visibility = "hidden";
        document.getElementById("main").style.marginLeft = "250px";
      }
    
      function closeNav() {	
        document.getElementById("mySidenav").style.width = "0";
        document.getElementById("sidenav").style.visibility = "visible";
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