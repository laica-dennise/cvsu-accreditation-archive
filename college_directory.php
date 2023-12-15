<?php
session_start();

if (!isset($_SESSION['token'])) {
    header('Location: login.php');
    exit;
}

require('./config.php');

$client->setAccessToken($_SESSION['token']);

if ($client->isAccessTokenExpired()) {
    header('Location: logout.php');
    exit;
}

$google_oauth = new Google_Service_Oauth2($client);
$user_info = $google_oauth->userinfo->get();

require('./dbConfig.php');

if ($user_info['user_level'] == 'faculty') {

    $conn = mysqli_connect($db_host, $db_user, $db_pass, $db_name);

    // Check connection
    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }

    $college = $user_info['college'];
    $college = mysqli_real_escape_string($conn, $college); // to prevent SQL injection

    // Assuming your 'users' table has a column named 'college'
    $sql = "SELECT * FROM users WHERE college = '$college'";
    $result = mysqli_query($conn, $sql);

    if ($result && mysqli_num_rows($result) > 0) {
        // User found in the database
        $row = mysqli_fetch_assoc($result);
        $college = $row['college'];

        switch ($college) {
            case 'CAFENR':
                header('Location: cafenr.php');
                exit;
            case 'CAS':
                header('Location: cas.php');
                exit;
            case 'CCJ':
                header('Location: ccj.php');
                exit;
            case 'CED':
                header('Location: ced.php');
                exit;
            case 'CEMDS':
                header('Location: cemds.php');
                exit;
            case 'CEIT':
                header('Location: ceit.php');
                exit;
            case 'CON':
                header('Location: nursing.php');
                exit;
            case 'CSPEAR':
                header('Location: cspear.php');
                exit;
            case 'CVMBS':
                header('Location: cvmbs.php');
                exit;
            case 'Colege of Medicine':
                header('Location: com.php');
                exit;
            case 'Graduate School':
                header('Location: graduate_school.php');
                exit;
            // Add cases for other colleges as needed
            default:
                echo "<script>
                        alert('Error: This account is not assigned to a specific college.');
                        window.location.href = 'login.php';
                      </script>";
                exit;
        }
    } else {
        echo "<script>
                alert('Error: College information not found in the database.');
                window.location.href = 'login.php';
              </script>";
        exit;
    }

    mysqli_close($conn); // Close the database connection
} else {
    echo "<script>
            alert('Error: This account is not authorized to access the directory.');
            window.location.href = 'login.php';
          </script>";
    exit;
}
?>