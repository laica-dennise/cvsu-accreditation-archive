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
  header('Location: login.php');
}

// getting user info for uploaded files
$first_name = $user_info['given_name'];
$last_name = $user_info['family_name'];
$file_owner = $first_name . " " . $last_name;


// Fetch user_level from the database for the current user
$email = $user_info['email'];
$query = "SELECT user_level FROM users WHERE email = '$email'";
$result = $mysqli->query($query);

if ($result) {
    $row = $result->fetch_assoc();
    $user_level = $row['user_level'];

    if ($user_level == 0 || $user_level == 1 || $user_level == 3) {
        // Redirect to login.php with an alert message
        echo "<script>
                alert('You are not authorized.');
                window.location.href = 'login.php';
              </script>";
        exit;
    }
} else {
    // Handle the error, such as setting a default user_level
    $user_level = 0; // Default user_level
}

function getUserCollege() {
    global $user_info, $mysqli;
  
    // Assuming your users table has a 'user_level' column
    $email = $user_info['email'];
    $result = $mysqli->query("SELECT college FROM users WHERE email = '$email'");
  
    if ($result && $result->num_rows > 0) {
        $row = $result->fetch_assoc();
        return $row['user_level'];
    } else {
        // Default user level if not found
        return 0;
    }
  }

// Pagination
$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
$limit = 5; // Number of rows per page set to 5
$offset = ($page - 1) * $limit; // Corrected offset calculation
$totalRecords = $mysqli->query("SELECT COUNT(*) as total FROM users")->fetch_assoc()['total'];
$totalPages = ceil($totalRecords / $limit);

// Pagination Access Required
$page1 = isset($_GET['page']) ? intval($_GET['page']) : 1;
$limit1 = 3; // Number of rows per page set to 3
$offset1 = ($page1 - 1) * $limit1; // Corrected offset calculation
$totalRecords1 = $mysqli->query("SELECT COUNT(*) as total FROM access_request")->fetch_assoc()['total'];
$totalPages1 = ceil($totalRecords1 / $limit1);
 
// SQL query to select data from database
$query = "SELECT college FROM users WHERE email = '$email'";
$result = $mysqli->query($query);

if ($result) {
    $row = $result->fetch_assoc();
    $college = $row['college'];

    $sql = " SELECT * FROM users WHERE user_level = 3 && college = '$college' ORDER BY id ASC ";
    $result = $mysqli->query($sql);

    $sql2 = "SELECT * FROM access_request WHERE user_level = 3 && college = '$college' ORDER BY id ASC";
    $result2 = $mysqli->query($sql2);

    $sql3 = "SELECT college FROM users WHERE email = '$email'";
    $result3 = $mysqli->query($sql3);
    $mysqli->close();
}

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>CvSU Accreditation Archive System</title>
    <link rel="stylesheet" type="text/css" href="styles/style8.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

    <style>
      fieldset {
      border: medium none !important;
      margin: 0 0 10px;
      padding: 0;
      -moz-box-sizing: border-box;
      -webkit-box-sizing: border-box;
      box-sizing: border-box;
    }

    .info {
      float: left;
      margin-right: 20px;
    }

    .request {
        cursor: default;
    }
 
    textarea {
      height: 100px;
      max-width: 100%;
      resize: none;
      width: 100%;
    }

    legend {
        margin:-10px 0;
        font-family: "Roboto", arial, sans-serif;
        font-size: 13px;
        margin-bottom: 0px;
    }
    select {
        width: 20vw;
        height: 3vh;
    }
    option {
        width: 100%
    }

    .pagination {
      margin-left: 15px;
    }

    .pagination2 {
      margin-left: 15px;
    }
    </style>
</head>
<body>

<div class="container-fluid">
    <div id="main" class="main">
        <div class="box">
            <div class="profile-box">
                <div id="sidenav" style="margin-top:40px;">
                </div>
                <div class="profile-boxx">
                    <div class="col-md-8">
		            <div class="alert alert-info" style="margin-top:10px;width:450px;"> User List </div>
                <a href="#" id="register-box" class="btn btn-success btn-sm" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-plus"></span> Add User </a>
            </div>

            <div id="nav-bar" class="nav-bar">
          <img src="images/cvsu-logo.png" class="logo">
            <p class="title">CvSU Accreditation Archive System</p>
        <div class="navv">
          <div class="menu">
            <button class="menu-button">
              <img src="<?=$user_info['picture'];?>" referrerpolicy="no-referrer" class="menu-icon">
            </button>
            <div class="content">
              <div class="menu-content">
              <a href="faculty_dashboard.php">Profile</a>
              <a href="uploaded_files.php">Uploaded Files</a>
              <a href="outdated_files.php">Outdated Files</a>
              <a href="college_directory.php">College Directory</a>
              <a href="#" data-toggle="modal" data-target="#logout">Sign Out</a>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div id="search-box">
            <input type="text" id="searchInput" placeholder="Search" size="50" oninput="search()">
      </div>

      <div id="user-list">
      <section>
      <table class="file-query table table-bordered table-hover table-striped">
        <thead>
            <tr>
                <th class="text-center">ACTIVE STATUS</th>
                <th class="text-center">FIRST NAME</th>
                <th class="text-center">LAST NAME</th>
                <th class="text-center">EMAIL</th>
                <th class="text-center">USER LEVEL</th>
                <th class="text-center">PROGRAM</th>
                <th class="text-center" colspan="2">ACTION</th>
            </tr>
        </thead>
        <tbody>
            <?php
            while ($rows = $result->fetch_assoc()) {
            ?>
                <tr class="results">
                <td class="text-center">
                        <!-- Add a span with a specific class for styling -->
                        <span class="status <?php echo ($rows['active_status'] == 'Online') ? 'online' : 'offline'; ?>"></span>
                        <?php echo $rows['active_status']; ?>
                    <td class="text-center"><?php echo $rows['first_name']; ?></td>
                    <td class="text-center"><?php echo $rows['last_name']; ?></td>
                    <td class="text-center"><?php echo $rows['email']; ?></td>
                    <td class="text-center">
                        <?php
                            $userLevel = $rows['user_level'];
                            if ($userLevel == 3) {
                                    echo 'College Accreditation Taskforce';
                            } else {
                                    echo 'Unknown Role'; 
                            }
                         ?>
                    </td>
                    <td class="text-center"><?php echo $rows['course']; ?></td>
                    <td class="text-center">
                    <?php
                        if ($rows['email'] != $email) {
                      ?>
                        <button class="btn btn-primary btn-sm" title="Edit" data-toggle="modal" data-target="#editModal" onclick="openEditModal('<?php echo $rows['first_name'];?>','<?php echo $rows['last_name'];?>','<?php echo $rows['email'];?>','<?php echo $rows['user_level'];?>','<?php echo $rows['college'];?>','<?php echo $rows['course'];?>')"><span class="glyphicon glyphicon-edit"></span></button>
                        <button class="btn btn-danger btn-delete" title="Delete" style="height:30px;font-size:12px;" type="button" onclick="removeUser(<?php echo $rows['id']; ?>)"><span class="glyphicon glyphicon-trash"></span></button>
                      <?php
                        }
                      ?>
                    </td>
                </tr>
            <?php
            }
            ?>
          </tbody>
        </table>
        <!-- Modified Pagination -->
        <div class="pagination-container">
          <?php if ($page > 1): ?>
              <a href="?page=<?php echo $page - 1; ?>" class="pagination-link">Previous</a>
          <?php endif; ?>

          <div class="pagination-info">
              <span>Page <?php echo $page; ?> of <?php echo $totalPages; ?></span>
          </div>

          <?php if ($page < $totalPages): ?>
              <a href="?page=<?php echo $page + 1; ?>" class="pagination-link">Next</a>
          <?php endif; ?>

          <!-- Page input field -->
          <form action="" method="GET" class="pagination-form">
              <label for="pageInput" class="pagination-label">Go to Page:</label>
              <input type="number" id="pageInput" name="page" min="1" max="<?php echo $totalPages; ?>" value="<?php echo $page; ?>" class="pagination-input">
              <button type="submit" class="pagination-button">Go</button>
          </form>
        </div>
      </section>
      </div>
      
      <div id="require-access">
      <div class="alert alert-info" style="margin-top:10px; width:450px; margin-left: 15px; background: #f5dfc1;"> Requires Approval </div>
      <section>
      <table class="file-query2 table table-bordered table-hover table-striped">
        <thead>
            <tr>
                <th class="text-center">FIRST NAME</th>
                <th class="text-center">LAST NAME</th>
                <th class="text-center">EMAIL</th>
                <th class="text-center">USER LEVEL</th>
                <th class="text-center">PROGRAM</th>
                <th class="text-center">ACTION</th>
            </tr>
        </thead>
        <tbody>
            <?php
            while ($rows = $result2->fetch_assoc()) {
            ?>
                <tr class="results">
                    <td class="text-center"><?php echo $rows['first_name']; ?></td>
                    <td class="text-center"><?php echo $rows['last_name']; ?></td>
                    <td class="text-center"><?php echo $rows['email']; ?></td>
                    <td class="text-center">
                        <?php
                            $userLevel = $rows['user_level'];
                            if ($userLevel == 3) {
                                    echo 'College Accreditation Taskforce';
                            } else {
                                    echo 'Unknown Role'; 
                            }
                         ?>
                    </td>
                    <td class="text-center"><?php echo $rows['course']; ?></td>
                    <td class="text-center">
                      <button class="btn btn-danger btn-delete" title="Delete" style="height:30px;font-size:12px;" type="button" onclick="removeUserRequest(<?php echo $rows['id']; ?>)"><span class="glyphicon glyphicon-trash"></span></button>
                    </td>
                </tr>
            <?php
            }
            ?>
          </tbody>
       </table>
        <!-- Modified Pagination -->
        <div class="pagination-container2" style="<?php echo $totalRecords1 == 0 ? 'display:none' : ''; ?>">
          <?php if ($page1 > 1): ?>
              <a href="?page=<?php echo $page1 - 1; ?>" class="pagination-link2">Previous</a>
          <?php endif; ?>

          <div class="pagination-info2">
              <span>Page <?php echo $page1; ?> of <?php echo $totalPages1; ?></span>
          </div>

          <?php if ($page1 < $totalPages1): ?>
              <a href="?page=<?php echo $page1 + 1; ?>" class="pagination-link2">Next</a>
          <?php endif; ?>

          <!-- Page input field -->
          <form action="" method="GET" class="pagination-form2">
              <label for="pageInput" class="pagination-label2">Go to Page:</label>
              <input type="number" id="pageInput" name="page" min="1" max="<?php echo $totalPages1; ?>" value="<?php echo $page1; ?>" class="pagination-input2">
              <button type="submit" class="pagination-button2">Go</button>
          </form>
        </div>
      </section>
      </div>
    </div>
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

<!-- Modal add user -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Add User</h4>
        </div>
        <div class="modal-body">
        <form action="add_user.php" method="POST" enctype="multipart/form-data" id="register">
        <fieldset class="info">
        <input placeholder="First Name" name="first_name" id="first_name" type="text" tabindex="1" autofocus required>
      </fieldset>
      <fieldset class="info">
        <input placeholder="Last Name" name="last_name" id="last_name" type="text" autofocus required>
      </fieldset>
      <fieldset>
        <input placeholder="Email Address" name="email" id="email" type="email" tabindex="2" style="width:250px"required>
      </fieldset>
      <fieldset class="info">
        <legend class="user-level">Access as</legend>
          <select name="user_level" id="user_level">
            <option value="3">College Accreditation Taskforce</option>
          </select>
      </fieldset>
      <fieldset class="info">
        <legend class="college">College</legend>
            <select name="college" id="directories" onchange="updateCourseOptions();showCourse();">
                <?php
                    while ($rows = $result3->fetch_assoc()) {
                ?>
                <option value=""></option>
                <option value="<?php echo $rows['college']; ?>"><?php echo $rows['college']; ?></option>
                <?php
                    }
                ?>
            </select>
        </fieldset>
        <div class="courses" id="courses">
            <fieldset class="info">
            <legend class="course">Course</legend>
              <select name="course" id="course" style="width: 450px;">
                <option value=""></option>
              </select>
            </fieldset>
        </div>
        <br><br><br><br>
          </form>
          </div>
          <div class="modal-footer">
          <a href="#" id="register" value="Register" type="submit" class="btn btn-success btn-sm" onclick="register()"><span class="glyphicon glyphicon-plus"></span> Add User </a>
          <a href="#"  class="btn btn-danger btn-sm" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-remove"></span> Cancel </a>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- The Edit User Info Modal -->
  <div class="modal fade" id="editModal" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Edit User Information</h4>
        </div>
        <div class="modal-body">
        <form action="update_user.php" method="POST" enctype="multipart/form-data" id="updateForm">
        <fieldset class="info">
        <input placeholder="First Name" name="firstName" id="firstName" type="text" tabindex="1" style="cursor:default" autofocus readonly>
      </fieldset>
      <fieldset class="info">
        <input placeholder="Last Name" name="lastName" id="lastName" type="text" style="cursor:default" autofocus readonly>
      </fieldset>
      <fieldset>
        <input placeholder="Email Address" name="userEmail" id="userEmail" type="email" tabindex="2" style="width:250px;cursor:default" readonly>
      </fieldset>
      <fieldset class="info">
        <legend class="user-level">User Level</legend>
          <select name="userLevel" id="userLevel" onchange="showUserCollege()">
            <option value="3">College Accreditation Taskforce</option>
          </select>
      </fieldset>
      <div id="college-selectionn" class="college-selectionn">
      <fieldset>
      <legend class="college">College</legend>
            <select name="userCollege" id="userCollege" onchange="updateCourseOptionss();showCourse();">
                <option value=""></option>
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
        </fieldset>
        <div class="courses" id="courses">
            <fieldset class="info">
            <legend class="course">Course</legend>
              <select name="userCourse" id="userCourse" style="width: 450px;">
                <option value=""></option>
              </select>
            </fieldset>
        </div>
        <br><br><br><br>
          </form>
          </div>
          <div class="modal-footer">
          <a href="#" id="update" name="update" value="Update" class="btn btn-success btn-sm" onclick="update()"><span class="glyphicon glyphicon-pencil"></span> Update </a>
          <a href="#"  class="btn btn-danger btn-sm" data-toggle="modal" data-target="#editModal"><span class="glyphicon glyphicon-remove"></span> Cancel </a>
          </div>
        </div>
      </div>
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


  <script>
    // search function for search box
    function search() {
        // Get input value and convert to lowercase for case-insensitive search
        var input = document.getElementById('searchInput').value.toLowerCase();

        // Get the table rows
        var rows = document.querySelectorAll('.file-query tbody tr.results');

        // Loop through each row
        rows.forEach(function (row) {
            var rowText = row.innerText.toLowerCase();
            var displayStyle = 'none';

            // If the search input is empty, show all results
            if (input === '') {
                displayStyle = '';
            } else {
                // Check if the row text includes the search input
                if (rowText.includes(input)) {
                    displayStyle = '';
                }
            }

            // Set the display style for the row
            row.style.display = displayStyle;
        });
    }

    function updateCourseOptions() {
      var selectedCollege = document.getElementById('directories').value;
      var courseDropdown = document.getElementById('course');
      courseDropdown.innerHTML = ''; // Clear existing options

      if (selectedCollege !== '') {
        var courses = getCourseOptions(selectedCollege);

        // Populate "Course" dropdown with options
        for (var i = 0; i < courses.length; i++) {
          var option = document.createElement('option');
          option.value = courses[i];
          option.text = courses[i];
          courseDropdown.add(option);
        }
      }
    }

    function updateCourseOptionss() {
      var selectedCollege = document.getElementById('userCollege').value;
      var courseDropdown = document.getElementById('userCourse');
      courseDropdown.innerHTML = ''; // Clear existing options

      if (selectedCollege !== '') {
        var courses = getCourseOptions(selectedCollege);

        // Populate "Course" dropdown with options
        for (var i = 0; i < courses.length; i++) {
          var option = document.createElement('option');
          option.value = courses[i];
          option.text = courses[i];
          courseDropdown.add(option);
        }
      }
    }

    // Function to get course options based on selected college
    function getCourseOptions(college) {
      var courseOptions = {
        'CAFENR': ['Bachelor of Science in Agriculture', 'Bachelor of Science in Environmental Science', 'Bachelor of Science in Food Technology', 'Bachelor of Science in Land Use Design and Management', 'Bachelor in Agricultural Entrepreneurship', 'Certificate in Agricultural Science'],
        'CAS': ['Bachelor of Science in Biology', 'Bachelor of Arts in Journalism', 'Bachelor of Arts in English', 'Bachelor of Science in Psychology', 'Bachelor of Arts in Political Science', 'Bachelor of Science in Social Work', 'Bachelor of Science in Applied Mathematics (Major in Statistics)'], 
        'CCJ': ['Bachelor of Science in Criminology', 'Bachelor of Science in Industrial Security Administration'], 
        'CED': ['Bachelor of Secondary Education', 'Bachelor of Elementary Education', 'Bachelor of Hotel and Restaurant Management', 'Bachelor of Tourism Management'], 
        'CEMDS': ['Bachelor of Science in Office Administration', 'Bachelor of Science in Accountancy', 'Bachelor of Science in Business Administration', 'Bachelor of Science in Economics', 'Bachelor of Science in Development Management', 'Bachelor of Science in International Studies'], 
        'CEIT': ['Bachelor of Science in Agricultural and Biosystems Engineering', 'Bachelor of Science in Architecture', 'Bachelor of Science in Civil Engineering', 'Bachelor of Science in Computer Engineering', 'Bachelor of Science in Computer Science', 'Bachelor of Science in Electrical Engineering', 'Bachelor of Science in Electronics Engineering', 'Bachelor of Science in Industrial Engineering', 'Bachelor of Science in Industrial Technology', 'Bachelor of Science in Information Technology', 'Bachelor of Science in Office Administration'], 
        'CON': ['Bachelor of Science in Nursing', 'Bachelor of Science in Medical Technology', 'Bachelor of Science in Midwifery'], 
        'CSPEAR': ['Bachelor of Physical Education', 'Bachelor in Sports and Recreational Management'], 
        'CVMBS': ['Doctor of Veterinary Medicine', 'Bachelor of Science in Veterinary Technology', 'Bachelor of Science in Animal Health and Management', 'Bachelor of Science in Biomedical Science'], 
        'Graduate School and Open Learning College': ['Doctor of Philosophy in Agricultural', 'Doctor of Philosophy in Education', 'Doctor of Philosophy in Management', 'Master of Arts in Education', 'Master of Agriculture', 'Master of Engineering', 'Master in Information Technology', 'Master of Management', 'Master of Business Administration', 'Master of Professional Studies', 'Master of Science in Agriculture', 'Master of Science in Biology', 'Master of Science in Food Science'], 
        // Add options for other colleges
      };

      return courseOptions[college] || [];
    }

    function register() {
        document.getElementById('register').submit();
      }
</script>

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

      function openEditModal(firstName, lastName, userEmail, userLevel, userCollege, userCourse) {
    // Populate modal fields with current user information
    document.getElementById('firstName').value = firstName;
    document.getElementById('lastName').value = lastName;
    document.getElementById('userEmail').value = userEmail;
    document.getElementById('userLevel').value = userLevel;
    document.getElementById('userCollege').value = userCollege;
    document.getElementById('userCourse').value = userCourse;

    // Display the modal
    document.getElementById('editModal').style.display = 'block';
  }

  function closeEditModal() {
    // Clear modal fields
    document.getElementById('firstName').value = '';
    document.getElementById('lastName').value = '';
    document.getElementById('userEmail').value = '';
    document.getElementById('userLevel').value = '';
    document.getElementById('userCollege').value = '';

    // Hide the modal
    document.getElementById('editModal').style.display = 'none';
  }

  function update() {
    document.getElementById("updateForm").submit();
  }

  function showCollege() {
      var userLevel = document.getElementById("userLevel").value;

      if (userLevel === "3") {
        document.getElementById("college-selection").style.display = "block";
      }
      else {
        document.getElementById("college-selection").style.display = "block";
      }
    }

  function showUserCollege() {
      var userLevel = document.getElementById("userLevel").value;

      if (userLevel === "2") {
        document.getElementById("college-selectionn").style.display = "block";
      }
      else if (userLevel === "3") {
        document.getElementById("college-selectionn").style.display = "block";
      }
      else {
        document.getElementById("college-selectionn").style.display = "none";
      }
    }
    </script>

    <script type="text/javascript" src="./js/gapi-upload.js"></script>
    <script async defer src="https://apis.google.com/js/api.js" onload="gapiLoaded()"></script>
    <script async defer src="https://accounts.google.com/gsi/client" onload="gisLoaded()"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script type="text/javascript" src="//code.jquery.com/jquery-2.1.0.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

  </body>
</html>