// TODO: Set the below credentials
const {google} = require('googleapis');
const path = require('path')
const fs = require('fs')
const targetFolderId = '1cS_xmX5ct0FV4bP9LZfDlc_vd72ZYpPZ'

const CLIENT_ID = '75132863473-h6i0tqj5tuc7jbm6ptjgrlb7snvv8im6.apps.googleusercontent.com';
const CLIENT_SECRET = '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';

const KEYFILEPATH = 'C:\\xampp\\htdocs\\cvsu_accrsystem\\cvsu-accreditation-37a00b400711.json';

// Discovery URL for APIs used by the quickstart
const DISCOVERY_DOC = 'https://www.googleapis.com/discovery/v1/apis/drive/v3/rest';

// Set API access scope before proceeding authorization request
const SCOPES = 'https://www.googleapis.com/auth/drive';
let tokenClient;
let gapiInited = false;
let gisInited = false;

const auth = new google.auth.GoogleAuth( {
    keyFile: KEYFILEPATH,
    scopes: SCOPES
})

const driveService = google.drive( {
    version: 'v3',
    auth
})

//document.getElementById('authorize_button').style.visibility = 'hidden';
document.getElementById('signout_button').style.visibility = 'hidden';
document.getElementById('fileInput').style.visibility = 'hidden';
document.getElementById('uploadButton').style.visibility = 'hidden';

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
}

/**
 * Enables user interaction after all libraries are loaded.
 */
function maybeEnableButtons() {
	if (gapiInited && gisInited) {
		document.getElementById('authorize_button').style.visibility = 'visible';
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
		/*document.getElementById('signout_button').style.visibility = 'visible';
        document.getElementById('authorize_button').style.visibility = 'hidden';
        document.getElementById('fileInput').style.visibility = 'visible';
		document.getElementById('uploadButton').style.visibility = 'visible';
		await uploadFile();*/

	};

	if (gapi.client.getToken() !== null) {
		// Prompt the user to select a Google Account and ask for consent to share their data
		// when establishing a new session.
		tokenClient.requestAccessToken({ prompt: 'consent' });
	} else {
		// Skip display of account chooser and consent dialog for an existing session.
		tokenClient.requestAccessToken({ prompt: '' });
	}

}

/*
 *  Sign out the user upon button click.

function handleSignoutClick() {
	const token = gapi.client.getToken();
	if (token !== null) {
		google.accounts.oauth2.revoke(token.access_token);
		gapi.client.setToken('');
		document.getElementById('content').style.display = 'none';
		document.getElementById('content').innerHTML = '';
		document.getElementById('authorize_button').style.visibility = 'visible';
		document.getElementById('signout_button').style.visibility = 'hidden';
        document.getElementById('fileInput').style.visibility = 'hidden';
        document.getElementById('uploadButton').style.visibility = 'hidden';
	}
}*/

async function uploadFile(auth) {
            
    const fileInput = document.getElementById('fileInput');
    const selectedFile = fileInput.files[0];

    if (!selectedFile) {
        alert('Please select a file to upload.');
        return;
    }

    // Check if the selected file type is allowed
    const allowedTypes = ['application/pdf', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'image/png', 'image/jpeg', 'image/jpg'];
    if (!allowedTypes.includes(selectedFile.type)) {
        alert('Only .PDF, .DOCX, .PNG, .JPEG, and .JPG files are allowed.');
        return;
    }

    var file = new Blob([fileInput], {type: selectedFile.type});

    var fileMetaData = {
		'name': selectedFile.name, // Filename at Google Drive
		'mimeType': selectedFile.type, // mimeType at Google Drive
        'body': selectedFile,
		'parents': ['1cS_xmX5ct0FV4bP9LZfDlc_vd72ZYpPZ'] // Folder ID at Google Drive which is optional
    };

	let response = await driveService.files.create( {
        resource: fileMetaData,
        media: media
    })

	switch(response.status) {
        case 200:
            document.getElementById('content').innerHTML = "File uploaded successfully. The Google Drive file ID is <b>" + response.data.fileId + "</b>";
            break;

        default:
            console.error('Error uploading file, ' + response.errors)
            break;
    }
            
	/*var accessToken = gapi.auth.getToken().access_token; // Here gapi is used for retrieving the access token.
	var form = new FormData();
	form.append('metadata', new Blob([JSON.stringify(metadata)], { type: 'application/json' }));
	form.append('file', fileInput);

	var xhr = new XMLHttpRequest();
	xhr.open('post', 'https://www.googleapis.com/upload/drive/v3/files?uploadType=multipart&fields=id');
	xhr.setRequestHeader('Authorization', 'Bearer ' + accessToken);
	xhr.responseType = 'json';
	xhr.onload = () => {
		document.getElementById('content').innerHTML = "File uploaded successfully. The Google Drive file ID is <b>" + xhr.response.id + "</b>";
	};
	xhr.send(form);*/
}

async function generatePublicUrl (auth) {
	try {
        const fileId = '1sMMYwhcixUvIbQWlvNO4MaVgiBeRxA8m';
        await driveService.permissions.create({
            fileId: fileId,
            requestBody: {
                role: 'reader',
                type: 'anyone'
            }
        })

        //webContentLink is download link, webViewLink is for view link
        const result = await driveService.files.get({
            fileId: fileId,
            fields: 'webViewLink, webContentLink'
        })

        window("The file view link is " + result.data.webViewLink + "." );

    } catch (error) {
        window.alert(error.message);
    }
}