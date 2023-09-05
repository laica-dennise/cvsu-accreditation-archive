<!DOCTYPE html>
<html>
<head>
<title>Upload File to GDrive</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/form.css" />
<style>
#content {
    display: none;
}
</style>
</head>
<body>
    <!--Add HTML buttons to sign in and sign out-->
    <div class="container">

        <h1>Upload a file to GDrive</h1>
        <div>
            <div class="row">
                <input type="button" id="authorize_button"
                    onclick="handleAuthClick()" value="Authorize">
                <input type="button" id="signout_button"
                    onclick="handleSignoutClick()" value="Sign Out">
                <input type="file" id="fileInput" accept=".pdf, .docx, .png, .jpg">
                    <button id="uploadButton" onclick="uploadFile()">Upload File</button>

            </div>
        </div>
        <div id="content" class="success message"><?php if(isset($message)) { echo $message; } ?></div>
    </div>
    <script type="text/javascript" src="./js/gapi-upload.js"></script>
    <script async defer src="https://apis.google.com/js/api.js"
        onload="gapiLoaded()"></script>
    <script async defer src="https://accounts.google.com/gsi/client"
        onload="gisLoaded()"></script>
</body>
</html>