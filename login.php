<?php
require('./config.php');
# the createAuthUrl() method generates the login URL.
$login_url = $client->createAuthUrl();
/* 
 * After obtaining permission from the user,
 * Google will redirect to the login.php with the "code" query parameter.
*/
if (isset($_GET['code'])):

  session_start();
  $token = $client->fetchAccessTokenWithAuthCode($_GET['code']);
  if(isset($token['error'])){
    header('Location: login.php');
    exit;
  }
  $_SESSION['token'] = $token;

  /* -- Inserting the user data into the database -- */

  # Fetching the user data from the google account
  $client->setAccessToken($token);
  $google_oauth = new Google_Service_Oauth2($client);
  $user_info = $google_oauth->userinfo->get();

  $google_id = trim($user_info['id']);
  $f_name = trim($user_info['given_name']);
  $l_name = trim($user_info['family_name']);
  $email = trim($user_info['email']);
  $gender = trim($user_info['gender']);
  $local = trim($user_info['local']);
  $picture = trim($user_info['picture']);

  # Database connection
  require('./dbConfig.php');

  # Checking whether the email already exists in our database.
  $check_email = $db_connection->prepare("SELECT `email` FROM `users` WHERE `email`=?");
  $check_email->bind_param("s", $email);
  $check_email->execute();
  $check_email->store_result();

  if($check_email->num_rows === 0){
    # Inserting the new user into the database
    $query_template = "INSERT INTO `users` (`oauth_uid`, `first_name`, `last_name`,`email`,`profile_pic`,`gender`,`local`) VALUES (?,?,?,?,?,?,?)";
    $insert_stmt = $db_connection->prepare($query_template);
    $insert_stmt->bind_param("sssssss", $google_id, $f_name, $l_name, $email, $gender, $local, $picture);
    if(!$insert_stmt->execute()){
      echo "Failed to insert user.";
      exit;
    }
  }

  header('Location: profile.php');
  exit;

endif;
?>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>CvSU Accreditation Archive System</title>
        <link rel="stylesheet" type="text/css" href="styles/style2.css" />

    </head>
    <body>

        <div class="container">
            <div class="nav-bar">
                <img src="images/cvsu-logo.png" class="logo">
                    <p class="title"><a></a>CvSU Accreditation Archive System</p>

                <nav>
                    <ul>
                        <li><a href="index.php">HOME</a></li>
                        <li><a href="aboutus.php">ABOUT US</a></li>
                        <li><a href="login.php">LOGIN</a></li>
                    </ul>
                </nav>
                <img src="images/menu.png" class="menu-icon">
            </div>

            <div class="sign-in-box">
                <div class="sign-in-message">
                    <p>Log in using your CvSU/Google account to continue.</p>
                </div>

                <div class="authorize-button" id="authorize_button"
                    value="Authorize">
                    <div class="content-wrapper">
                        <div class="logo-wrapper">
                            <img src="https://developers.google.com/identity/images/g-logo.png">
                        </div>
                        <span class="text-container">
                            <span><a href="<?= $login_url ?>" class="login-url">Sign in with CvSU account</a></span>
                        </span>
                    </div>
                </div>
            </div>
        </div>

        <div id="content" class="success message"><?php if(isset($message)) { echo $message; } ?>
        </div>

        <script type="text/javascript" src="./js/gapi-upload.js"></script>
        <script async defer src="https://apis.google.com/js/api.js"
            onload="gapiLoaded()"></script>
        <script async defer src="https://accounts.google.com/gsi/client"
            onload="gisLoaded()"></script>
    </body>
</html>