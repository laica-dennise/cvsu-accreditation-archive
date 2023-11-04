// TODO: Set the below credentials
const CLIENT_ID = '75132863473-h6i0tqj5tuc7jbm6ptjgrlb7snvv8im6.apps.googleusercontent.com';
const CLIENT_SECRET = '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';

// Discovery URL for APIs used by the quickstart
const DISCOVERY_DOC = 'https://www.googleapis.com/discovery/v1/apis/drive/v3/rest';

const KEYFILEPATH = 'C:\\xampp\\htdocs\\cvsu_accrsystem\\cvsu-accreditation-37a00b400711.json';

// Set API access scope before proceeding authorization request
const SCOPES = 'https://www.googleapis.com/auth/drive';
let tokenClient;
let gapiInited = false;
let gisInited = false;

/*const auth = new google.auth.GoogleAuth( {
    keyFile: KEYFILEPATH,
    scopes: SCOPES
})

const driveService = google.drive( {
    version: 'v3',
    auth
})*/

//document.getElementById('authorize_button').style.visibility = 'hidden';
//document.getElementById('signout_button').style.visibility = 'hidden';
//document.getElementById('fileInput').style.visibility = 'hidden';
//document.getElementById('uploadButton').style.visibility = 'hidden';

/**
 * Callback after api.js is loaded.
 */
function gapiLoaded() {
	gapi.load('client', initializeGapiClient);
}

/**
 * Callback after the API client is loaded. Loads the
 * discovery doc to initialize the API.
 */
async function initializeGapiClient() {
	await gapi.client.init({
		client_secret: CLIENT_SECRET,
		discoveryDocs: [DISCOVERY_DOC],
	});
	gapiInited = true;
	maybeEnableButtons();
}

/**
 * Callback after Google Identity Services are loaded.
 */
function gisLoaded() {
	tokenClient = google.accounts.oauth2.initTokenClient({
		client_id: CLIENT_ID,
		scope: SCOPES, 
		callback: '', // defined later
	});
	gisInited = true;
	maybeEnableButtons();
}

/**
 * Enables user interaction after all libraries are loaded.
 */
function maybeEnableButtons() {
	if (gapiInited && gisInited) {
		//document.getElementById('authorize_button').style.visibility = 'visible';
	}
}

/**
 *  Sign in the user upon button click.
 */
function handleAuthClick() {
	tokenClient.callback = async (resp) => {
		if (resp.error !== undefined) {
			throw (resp);
		}
		document.getElementById('signout_button').style.visibility = 'visible';
        document.getElementById('authorize_button').style.visibility = 'hidden';
        document.getElementById('fileInput').style.visibility = 'visible';
		document.getElementById('uploadButton').style.visibility = 'visible';
		//await uploadFile();

	};

	if (gapi.client.getToken() === null) {
		// Prompt the user to select a Google Account and ask for consent to share their data
		// when establishing a new session.
		tokenClient.requestAccessToken({ prompt: 'consent' });
	} else {
		// Skip display of account chooser and consent dialog for an existing session.
		tokenClient.requestAccessToken({ prompt: '' });
	}
}

/**
 *  Sign out the user upon button click.
 */
function handleSignoutClick() {
	const token = gapi.client.getToken();
	if (token !== null) {
		google.accounts.oauth2.revoke(token.access_token);
		gapi.client.setToken('');
		document.getElementById('content').style.display = 'none';
		document.getElementById('content').innerHTML = '';
		document.getElementById('authorize_button').value = 'Authorize';
		document.getElementById('signout_button').style.visibility = 'hidden';
        document.getElementById('fileInput').style.visibility = 'hidden';
        document.getElementById('uploadButton').style.visibility = 'hidden';
	}
}

function uploadFile() {
            
    const fileInput = document.getElementById('fileInput');
    const selectedFile = fileInput.files[0];

    if (!selectedFile) {
        alert('Please select a file to upload.');
        return;
    }

    // Check if the selected file type is allowed
    const allowedTypes = ['application/pdf', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'image/png', 'image/jpeg', 'image/jpg'];
    if (!allowedTypes.includes(selectedFile.type)) {
        alert('Only PDF, DOCX, PNG, JPG, and JPEG files are allowed.');
        return;
    }

    var file = new Blob([fileInput], {type: selectedFile.type});

    var metadata = {
		'name': selectedFile.name, // Filename at Google Drive
		'mimeType': selectedFile.type, // mimeType at Google Drive
        'body': selectedFile,
		'parents': ['1cS_xmX5ct0FV4bP9LZfDlc_vd72ZYpPZ'] // Folder ID at Google Drive which is optional
    };

    /*var metadata = {
        name: selectedFile.name,
        parents: ['1cS_xmX5ct0FV4bP9LZfDlc_vd72ZYpPZ']
    };

    var media = {
        mimeType: selectedFile.type,
        body: selectedFile,
	};

	var response = driveService.files.create( {
        resource: metadata,
        media: media
    });

    switch(response.status) {
        case 200:
			const result = driveService.files.get({
				fileId: response.data.fileId,
				fields: 'webViewLink, webContentLink'
			})
			var data = {
				fileName: selectedFile.name,
				fileId: response.data.fileId,
				viewLink: result.data.webViewLink,
				downloadLink: result.data.webContentLink
			};

			/*var xhr = new XMLHttpRequest();

			xhr.open("POST", "upload.php", true);
			xhr.setRequestHeader("Content-Type", "application/json");
			
			xhr.onreadystatechange = function () {
				if (xhr.readyState == XMLHttpRequest.DONE) {
					alert(xhr.responseText);
				}
			};

			xhr.send(JSON.stringify(data));*/

			//document.getElementById("fileId").value = data.fileId;
			//document.getElementById("viewLink").value = data.viewLink;
			//document.getElementById("downloadLink").value = data.downloadLink;

			//document.cookie = "file_id=" + data.fileId;
			//document.cookie = "file_name=" + data.fileName;
			//document.cookie = "view_link=" + data.viewLink;
			//document.cookie = "download_link=" + data.downloadLink;

			/*document.getElementById('content').innerHTML = "File uploaded successfully. The Google Drive file ID is <b>" + data.fileId + data.viewLink + data.downloadLink;

            console.log(response.data.fileId)
            break;

        default:
            console.error('Error uploading file, ' + response.errors)
            break;
    }*/
            
	var accessToken = gapi.auth.getToken().access_token; // Here gapi is used for retrieving the access token.
	var form = new FormData();
	form.append('metadata', new Blob([JSON.stringify(metadata)], { type: 'application/json' }));
	form.append('file', fileInput);

	var xhr = new XMLHttpRequest();
	xhr.open('post', 'https://www.googleapis.com/upload/drive/v3/files?uploadType=multipart&fields=id,webViewLink,webContentLink');
	xhr.setRequestHeader('Authorization', 'Bearer ' + accessToken);
	xhr.responseType = 'json';

	
	xhr.onload = () => {
		document.getElementById('content').innerHTML = "File uploaded successfully. The Google Drive file ID is <b>" + xhr.response.id + xhr.response.webViewLink + xhr.response.webContentLink;
		document.getElementById('content').style.display = 'block';
		localStorage.setItem('file_details', xhr.response.id);
		localStorage.setItem('file_viewLink', xhr.response.webViewLink);
		localStorage.setItem('file_downloadLink', xhr.response.webContentLink);
	};
	xhr.send(form);
		/*$.ajax({
			type: 'POST',
			url: 'upload_success.php',
			data: {
				file_name: selectedFile.name,
				file_id: xhr.response.id,
				view_link: xhr.response.webViewLink,
				download_link: xhr.response.webContentLink
			},
			success: function(response) {
				alert(response);
			}
		});
	};

	/*var request = gapi.client.request({
		'path': 'drive/v2/files',
		'method': 'POST',
		'headers': {
			'Content-Type': 'application/json',
			'Authorization': 'Bearer ' + access_token,
		},
		'body': {
			'title': selectedFile.name,
			'mimeType': selectedFile.type
		}
	});

	request.execute(function (xhr) {
		localStorage.setItem('file_id', xhr.response.id);
		localStorage.setItem('file_viewLink', xhr.response.webViewLink);
		localStorage.setItem('file_downloadLink', xhr.response.webContentLink);
	});*/

	//xhr.send(form);

	/*var object = {};
	object.fileId = document.getElementById(xhr.response.id);
	object.viewLink = document.getElementById(xhr.response.webViewLink);
	object.downloadLink = document.getElementById(xhr.response.webContentLink);

	var jsonString = JSON.stringify(object);*/
}

function getDetails() {
	var accessToken = gapi.auth.getToken().access_token;
	var xhr = new XMLHttpRequest();
        xhr.open('post', 'https://www.googleapis.com/upload/drive/v3/files?uploadType=multipart&fields=id,webViewLink,webContentLink');
        xhr.setRequestHeader('Authorization', 'Bearer ' + accessToken);
        xhr.responseType = 'json';

	document.getElementById('content').innerHTML = "File ID is: " + xhr.response.id + " , view link is: " + xhr.response.webviewLink + " , download link is: " + xhr.response.webContentLink;
}