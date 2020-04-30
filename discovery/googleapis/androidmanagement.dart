{
"auth": {
"oauth2": {
"scopes": {
"https://www.googleapis.com/auth/androidmanagement": {
"description": "Manage Android devices and apps for your customers"
}
}
}
},
"basePath": "",
"baseUrl": "https://androidmanagement.googleapis.com/",
"batchPath": "batch",
"canonicalName": "Android Management",
"description": "The Android Management API provides remote enterprise management of Android devices and apps.",
"discoveryVersion": "v1",
"documentationLink": "https://developers.google.com/android/management",
"icons": {
"x16": "http://www.google.com/images/icons/product/search-16.gif",
"x32": "http://www.google.com/images/icons/product/search-32.gif"
},
"id": "androidmanagement:v1",
"kind": "discovery#restDescription",
"name": "androidmanagement",
"ownerDomain": "google.com",
"ownerName": "Google",
"parameters": {
"upload_protocol": {
"description": "Upload protocol for media (e.g. \"raw\", \"multipart\").",
"location": "query",
"type": "string"
},
"prettyPrint": {
"default": "true",
"description": "Returns response with indentations and line breaks.",
"location": "query",
"type": "boolean"
},
"quotaUser": {
"description": "Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.",
"location": "query",
"type": "string"
},
"uploadType": {
"description": "Legacy upload protocol for media (e.g. \"media\", \"multipart\").",
"location": "query",
"type": "string"
},
"fields": {
"description": "Selector specifying which fields to include in a partial response.",
"location": "query",
"type": "string"
},
"$.xgafv": {
"description": "V1 error format.",
"enum": [
"1",
"2"
],
"enumDescriptions": [
"v1 error format",
"v2 error format"
],
"location": "query",
"type": "string"
},
"oauth_token": {
"description": "OAuth 2.0 token for the current user.",
"location": "query",
"type": "string"
},
"callback": {
"description": "JSONP",
"location": "query",
"type": "string"
},
"alt": {
"default": "json",
"description": "Data format for response.",
"enum": [
"json",
"media",
"proto"
],
"enumDescriptions": [
"Responses with Content-Type of application/json",
"Media download with context-dependent Content-Type",
"Responses with Content-Type of application/x-protobuf"
],
"location": "query",
"type": "string"
},
"key": {
"description": "API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.",
"location": "query",
"type": "string"
},
"access_token": {
"description": "OAuth access token.",
"location": "query",
"type": "string"
}
},
"protocol": "rest",
"resources": {
"enterprises": {
"methods": {
"get": {
"description": "Gets an enterprise.",
"httpMethod": "GET",
"id": "androidmanagement.enterprises.get",
"parameterOrder": [
"name"
],
"parameters": {
"name": {
"description": "The name of the enterprise in the form enterprises/{enterpriseId}.",
"location": "path",
"pattern": "^enterprises/[^/]+$",
"required": true,
"type": "string"
}
},
"path": "v1/{+name}",
"response": {
"$ref": "Enterprise"
},
"scopes": [
"https://www.googleapis.com/auth/androidmanagement"
]
},
"patch": {
"description": "Updates an enterprise.",
"httpMethod": "PATCH",
"id": "androidmanagement.enterprises.patch",
"parameterOrder": [
"name"
],
"parameters": {
"updateMask": {
"description": "The field mask indicating the fields to update. If not set, all modifiable fields will be modified.",
"format": "google-fieldmask",
"location": "query",
"type": "string"
},
"name": {
"description": "The name of the enterprise in the form enterprises/{enterpriseId}.",
"location": "path",
"pattern": "^enterprises/[^/]+$",
"required": true,
"type": "string"
}
},
"path": "v1/{+name}",
"request": {
"$ref": "Enterprise"
},
"response": {
"$ref": "Enterprise"
},
"scopes": [
"https://www.googleapis.com/auth/androidmanagement"
]
},
"create": {
"description": "Creates an enterprise. This is the last step in the enterprise signup flow.",
"httpMethod": "POST",
"id": "androidmanagement.enterprises.create",
"parameterOrder": [],
"parameters": {
"enterpriseToken": {
"description": "The enterprise token appended to the callback URL.",
"location": "query",
"type": "string"
},
"signupUrlName": {
"description": "The name of the SignupUrl used to sign up for the enterprise.",
"location": "query",
"type": "string"
},
"projectId": {
"description": "The ID of the Google Cloud Platform project which will own the enterprise.",
"location": "query",
"type": "string"
}
},
"path": "v1/enterprises",
"request": {
"$ref": "Enterprise"
},
"response": {
"$ref": "Enterprise"
},
"scopes": [
"https://www.googleapis.com/auth/androidmanagement"
]
}
},
"resources": {
"webApps": {
"methods": {
"get": {
"description": "Gets a web app.",
"httpMethod": "GET",
"id": "androidmanagement.enterprises.webApps.get",
"parameterOrder": [
"name"
],
"parameters": {
"name": {
"description": "The name of the web app in the form enterprises/{enterpriseId}/webApp/{packageName}.",
"location": "path",
"pattern": "^enterprises/[^/]+/webApps/[^/]+$",
"required": true,
"type": "string"
}
},
"path": "v1/{+name}",
"response": {
"$ref": "WebApp"
},
"scopes": [
"https://www.googleapis.com/auth/androidmanagement"
]
},
"list": {
"description": "Lists web apps for a given enterprise.",
"httpMethod": "GET",
"id": "androidmanagement.enterprises.webApps.list",
"parameterOrder": [
"parent"
],
"parameters": {
"parent": {
"description": "The name of the enterprise in the form enterprises/{enterpriseId}.",
"location": "path",
"pattern": "^enterprises/[^/]+$",
"required": true,
"type": "string"
},
"pageToken": {
"description": "A token identifying a page of results returned by the server.",
"location": "query",
"type": "string"
},
"pageSize": {
"description": "The requested page size. The actual page size may be fixed to a min or max value.",
"format": "int32",
"location": "query",
"type": "integer"
}
},
"path": "v1/{+parent}/webApps",
"response": {
"$ref": "ListWebAppsResponse"
},
"scopes": [
"https://www.googleapis.com/auth/androidmanagement"
]
},
"patch": {
"description": "Updates a web app.",
"httpMethod": "PATCH",
"id": "androidmanagement.enterprises.webApps.patch",
"parameterOrder": [
"name"
],
"parameters": {
"updateMask": {
"description": "The field mask indicating the fields to update. If not set, all modifiable fields will be modified.",
"format": "google-fieldmask",
"location": "query",
"type": "string"
},
"name": {
"description": "The name of the web app in the form enterprises/{enterpriseId}/webApps/{packageName}.",
"location": "path",
"pattern": "^enterprises/[^/]+/webApps/[^/]+$",
"required": true,
"type": "string"
}
},
"path": "v1/{+name}",
"request": {
"$ref": "WebApp"
},
"response": {
"$ref": "WebApp"
},
"scopes": [
"https://www.googleapis.com/auth/androidmanagement"
]
},
"create": {
"description": "Creates a web app.",
"httpMethod": "POST",
"id": "androidmanagement.enterprises.webApps.create",
"parameterOrder": [
"parent"
],
"parameters": {
"parent": {
"description": "The name of the enterprise in the form enterprises/{enterpriseId}.",
"location": "path",
"pattern": "^enterprises/[^/]+$",
"required": true,
"type": "string"
}
},
"path": "v1/{+parent}/webApps",
"request": {
"$ref": "WebApp"
},
"response": {
"$ref": "WebApp"
},
"scopes": [
"https://www.googleapis.com/auth/androidmanagement"
]
},
"delete": {
"description": "Deletes a web app.",
"httpMethod": "DELETE",
"id": "androidmanagement.enterprises.webApps.delete",
"parameterOrder": [
"name"
],
"parameters": {
"name": {
"description": "The name of the web app in the form enterprises/{enterpriseId}/webApps/{packageName}.",
"location": "path",
"pattern": "^enterprises/[^/]+/webApps/[^/]+$",
"required": true,
"type": "string"
}
},
"path": "v1/{+name}",
"response": {
"$ref": "Empty"
},
"scopes": [
"https://www.googleapis.com/auth/androidmanagement"
]
}
}
},
"enrollmentTokens": {
"methods": {
"create": {
"description": "Creates an enrollment token for a given enterprise.",
"httpMethod": "POST",
"id": "androidmanagement.enterprises.enrollmentTokens.create",
"parameterOrder": [
"parent"
],
"parameters": {
"parent": {
"description": "The name of the enterprise in the form enterprises/{enterpriseId}.",
"location": "path",
"pattern": "^enterprises/[^/]+$",
"required": true,
"type": "string"
}
},
"path": "v1/{+parent}/enrollmentTokens",
"request": {
"$ref": "EnrollmentToken"
},
"response": {
"$ref": "EnrollmentToken"
},
"scopes": [
"https://www.googleapis.com/auth/androidmanagement"
]
},
"delete": {
"description": "Deletes an enrollment token. This operation invalidates the token, preventing its future use.",
"httpMethod": "DELETE",
"id": "androidmanagement.enterprises.enrollmentTokens.delete",
"parameterOrder": [
"name"
],
"parameters": {
"name": {
"description": "The name of the enrollment token in the form enterprises/{enterpriseId}/enrollmentTokens/{enrollmentTokenId}.",
"location": "path",
"pattern": "^enterprises/[^/]+/enrollmentTokens/[^/]+$",
"required": true,
"type": "string"
}
},
"path": "v1/{+name}",
"response": {
"$ref": "Empty"
},
"scopes": [
"https://www.googleapis.com/auth/androidmanagement"
]
}
}
},
"applications": {
"methods": {
"get": {
"description": "Gets info about an application.",
"httpMethod": "GET",
"id": "androidmanagement.enterprises.applications.get",
"parameterOrder": [
"name"
],
"parameters": {
"languageCode": {
"description": "The preferred language for localized application info, as a BCP47 tag (e.g. \"en-US\", \"de\"). If not specified the default language of the application will be used.",
"location": "query",
"type": "string"
},
"name": {
"description": "The name of the application in the form enterprises/{enterpriseId}/applications/{package_name}.",
"location": "path",
"pattern": "^enterprises/[^/]+/applications/[^/]+$",
"required": true,
"type": "string"
}
},
"path": "v1/{+name}",
"response": {
"$ref": "Application"
},
"scopes": [
"https://www.googleapis.com/auth/androidmanagement"
]
}
}
},
"devices": {
"methods": {
"delete": {
"description": "Deletes a device. This operation wipes the device.",
"httpMethod": "DELETE",
"id": "androidmanagement.enterprises.devices.delete",
"parameterOrder": [
"name"
],
"parameters": {
"name": {
"description": "The name of the device in the form enterprises/{enterpriseId}/devices/{deviceId}.",
"location": "path",
"pattern": "^enterprises/[^/]+/devices/[^/]+$",
"required": true,
"type": "string"
},
"wipeDataFlags": {
"description": "Optional flags that control the device wiping behavior.",
"enum": [
"WIPE_DATA_FLAG_UNSPECIFIED",
"PRESERVE_RESET_PROTECTION_DATA",
"WIPE_EXTERNAL_STORAGE"
],
"location": "query",
"repeated": true,
"type": "string"
}
},
"path": "v1/{+name}",
"response": {
"$ref": "Empty"
},
"scopes": [
"https://www.googleapis.com/auth/androidmanagement"
]
},
"get": {
"description": "Gets a device.",
"httpMethod": "GET",
"id": "androidmanagement.enterprises.devices.get",
"parameterOrder": [
"name"
],
"parameters": {
"name": {
"description": "The name of the device in the form enterprises/{enterpriseId}/devices/{deviceId}.",
"location": "path",
"pattern": "^enterprises/[^/]+/devices/[^/]+$",
"required": true,
"type": "string"
}
},
"path": "v1/{+name}",
"response": {
"$ref": "Device"
},
"scopes": [
"https://www.googleapis.com/auth/androidmanagement"
]
},
"list": {
"description": "Lists devices for a given enterprise.",
"httpMethod": "GET",
"id": "androidmanagement.enterprises.devices.list",
"parameterOrder": [
"parent"
],
"parameters": {
"pageToken": {
"description": "A token identifying a page of results returned by the server.",
"location": "query",
"type": "string"
},
"pageSize": {
"description": "The requested page size. The actual page size may be fixed to a min or max value.",
"format": "int32",
"location": "query",
"type": "integer"
},
"parent": {
"description": "The name of the enterprise in the form enterprises/{enterpriseId}.",
"location": "path",
"pattern": "^enterprises/[^/]+$",
"required": true,
"type": "string"
}
},
"path": "v1/{+parent}/devices",
"response": {
"$ref": "ListDevicesResponse"
},
"scopes": [
"https://www.googleapis.com/auth/androidmanagement"
]
},
"patch": {
"description": "Updates a device.",
"httpMethod": "PATCH",
"id": "androidmanagement.enterprises.devices.patch",
"parameterOrder": [
"name"
],
"parameters": {
"name": {
"description": "The name of the device in the form enterprises/{enterpriseId}/devices/{deviceId}.",
"location": "path",
"pattern": "^enterprises/[^/]+/devices/[^/]+$",
"required": true,
"type": "string"
},
"updateMask": {
"description": "The field mask indicating the fields to update. If not set, all modifiable fields will be modified.",
"format": "google-fieldmask",
"location": "query",
"type": "string"
}
},
"path": "v1/{+name}",
"request": {
"$ref": "Device"
},
"response": {
"$ref": "Device"
},
"scopes": [
"https://www.googleapis.com/auth/androidmanagement"
]
},
"issueCommand": {
"description": "Issues a command to a device. The Operation resource returned contains a Command in its metadata field. Use the get operation method to get the status of the command.",
"httpMethod": "POST",
"id": "androidmanagement.enterprises.devices.issueCommand",
"parameterOrder": [
"name"
],
"parameters": {
"name": {
"description": "The name of the device in the form enterprises/{enterpriseId}/devices/{deviceId}.",
"location": "path",
"pattern": "^enterprises/[^/]+/devices/[^/]+$",
"required": true,
"type": "string"
}
},
"path": "v1/{+name}:issueCommand",
"request": {
"$ref": "Command"
},
"response": {
"$ref": "Operation"
},
"scopes": [
"https://www.googleapis.com/auth/androidmanagement"
]
}
},
"resources": {
"operations": {
"methods": {
"cancel": {
"description": "Starts asynchronous cancellation on a long-running operation. The server makes a best effort to cancel the operation, but success is not guaranteed. If the server doesn't support this method, it returns google.rpc.Code.UNIMPLEMENTED. Clients can use Operations.GetOperation or other methods to check whether the cancellation succeeded or whether the operation completed despite cancellation. On successful cancellation, the operation is not deleted; instead, it becomes an operation with an Operation.error value with a google.rpc.Status.code of 1, corresponding to Code.CANCELLED.",
"httpMethod": "POST",
"id": "androidmanagement.enterprises.devices.operations.cancel",
"parameterOrder": [
"name"
],
"parameters": {
"name": {
"description": "The name of the operation resource to be cancelled.",
"location": "path",
"pattern": "^enterprises/[^/]+/devices/[^/]+/operations/[^/]+$",
"required": true,
"type": "string"
}
},
"path": "v1/{+name}:cancel",
"response": {
"$ref": "Empty"
},
"scopes": [
"https://www.googleapis.com/auth/androidmanagement"
]
},
"delete": {
"description": "Deletes a long-running operation. This method indicates that the client is no longer interested in the operation result. It does not cancel the operation. If the server doesn't support this method, it returns google.rpc.Code.UNIMPLEMENTED.",
"httpMethod": "DELETE",
"id": "androidmanagement.enterprises.devices.operations.delete",
"parameterOrder": [
"name"
],
"parameters": {
"name": {
"description": "The name of the operation resource to be deleted.",
"location": "path",
"pattern": "^enterprises/[^/]+/devices/[^/]+/operations/[^/]+$",
"required": true,
"type": "string"
}
},
"path": "v1/{+name}",
"response": {
"$ref": "Empty"
},
"scopes": [
"https://www.googleapis.com/auth/androidmanagement"
]
},
"list": {
"description": "Lists operations that match the specified filter in the request. If the server doesn't support this method, it returns UNIMPLEMENTED.NOTE: the name binding allows API services to override the binding to use different resource name schemes, such as users/*/operations. To override the binding, API services can add a binding such as \"/v1/{name=users/*}/operations\" to their service configuration. For backwards compatibility, the default name includes the operations collection id, however overriding users must ensure the name binding is the parent resource, without the operations collection id.",
"httpMethod": "GET",
"id": "androidmanagement.enterprises.devices.operations.list",
"parameterOrder": [
"name"
],
"parameters": {
"pageSize": {
"description": "The standard list page size.",
"format": "int32",
"location": "query",
"type": "integer"
},
"filter": {
"description": "The standard list filter.",
"location": "query",
"type": "string"
},
"name": {
"description": "The name of the operation's parent resource.",
"location": "path",
"pattern": "^enterprises/[^/]+/devices/[^/]+/operations$",
"required": true,
"type": "string"
},
"pageToken": {
"description": "The standard list page token.",
"location": "query",
"type": "string"
}
},
"path": "v1/{+name}",
"response": {
"$ref": "ListOperationsResponse"
},
"scopes": [
"https://www.googleapis.com/auth/androidmanagement"
]
},
"get": {
"description": "Gets the latest state of a long-running operation. Clients can use this method to poll the operation result at intervals as recommended by the API service.",
"httpMethod": "GET",
"id": "androidmanagement.enterprises.devices.operations.get",
"parameterOrder": [
"name"
],
"parameters": {
"name": {
"description": "The name of the operation resource.",
"location": "path",
"pattern": "^enterprises/[^/]+/devices/[^/]+/operations/[^/]+$",
"required": true,
"type": "string"
}
},
"path": "v1/{+name}",
"response": {
"$ref": "Operation"
},
"scopes": [
"https://www.googleapis.com/auth/androidmanagement"
]
}
}
}
}
},
"webTokens": {
"methods": {
"create": {
"description": "Creates a web token to access an embeddable managed Google Play web UI for a given enterprise.",
"httpMethod": "POST",
"id": "androidmanagement.enterprises.webTokens.create",
"parameterOrder": [
"parent"
],
"parameters": {
"parent": {
"description": "The name of the enterprise in the form enterprises/{enterpriseId}.",
"location": "path",
"pattern": "^enterprises/[^/]+$",
"required": true,
"type": "string"
}
},
"path": "v1/{+parent}/webTokens",
"request": {
"$ref": "WebToken"
},
"response": {
"$ref": "WebToken"
},
"scopes": [
"https://www.googleapis.com/auth/androidmanagement"
]
}
}
},
"policies": {
"methods": {
"delete": {
"description": "Deletes a policy. This operation is only permitted if no devices are currently referencing the policy.",
"httpMethod": "DELETE",
"id": "androidmanagement.enterprises.policies.delete",
"parameterOrder": [
"name"
],
"parameters": {
"name": {
"description": "The name of the policy in the form enterprises/{enterpriseId}/policies/{policyId}.",
"location": "path",
"pattern": "^enterprises/[^/]+/policies/[^/]+$",
"required": true,
"type": "string"
}
},
"path": "v1/{+name}",
"response": {
"$ref": "Empty"
},
"scopes": [
"https://www.googleapis.com/auth/androidmanagement"
]
},
"get": {
"description": "Gets a policy.",
"httpMethod": "GET",
"id": "androidmanagement.enterprises.policies.get",
"parameterOrder": [
"name"
],
"parameters": {
"name": {
"description": "The name of the policy in the form enterprises/{enterpriseId}/policies/{policyId}.",
"location": "path",
"pattern": "^enterprises/[^/]+/policies/[^/]+$",
"required": true,
"type": "string"
}
},
"path": "v1/{+name}",
"response": {
"$ref": "Policy"
},
"scopes": [
"https://www.googleapis.com/auth/androidmanagement"
]
},
"list": {
"description": "Lists policies for a given enterprise.",
"httpMethod": "GET",
"id": "androidmanagement.enterprises.policies.list",
"parameterOrder": [
"parent"
],
"parameters": {
"pageToken": {
"description": "A token identifying a page of results returned by the server.",
"location": "query",
"type": "string"
},
"pageSize": {
"description": "The requested page size. The actual page size may be fixed to a min or max value.",
"format": "int32",
"location": "query",
"type": "integer"
},
"parent": {
"description": "The name of the enterprise in the form enterprises/{enterpriseId}.",
"location": "path",
"pattern": "^enterprises/[^/]+$",
"required": true,
"type": "string"
}
},
"path": "v1/{+parent}/policies",
"response": {
"$ref": "ListPoliciesResponse"
},
"scopes": [
"https://www.googleapis.com/auth/androidmanagement"
]
},
"patch": {
"description": "Updates or creates a policy.",
"httpMethod": "PATCH",
"id": "androidmanagement.enterprises.policies.patch",
"parameterOrder": [
"name"
],
"parameters": {
"name": {
"description": "The name of the policy in the form enterprises/{enterpriseId}/policies/{policyId}.",
"location": "path",
"pattern": "^enterprises/[^/]+/policies/[^/]+$",
"required": true,
"type": "string"
},
"updateMask": {
"description": "The field mask indicating the fields to update. If not set, all modifiable fields will be modified.",
"format": "google-fieldmask",
"location": "query",
"type": "string"
}
},
"path": "v1/{+name}",
"request": {
"$ref": "Policy"
},
"response": {
"$ref": "Policy"
},
"scopes": [
"https://www.googleapis.com/auth/androidmanagement"
]
}
}
}
}
},
"signupUrls": {
"methods": {
"create": {
"description": "Creates an enterprise signup URL.",
"httpMethod": "POST",
"id": "androidmanagement.signupUrls.create",
"parameterOrder": [],
"parameters": {
"callbackUrl": {
"description": "The callback URL that the admin will be redirected to after successfully creating an enterprise. Before redirecting there the system will add a query parameter to this URL named enterpriseToken which will contain an opaque token to be used for the create enterprise request. The URL will be parsed then reformatted in order to add the enterpriseToken parameter, so there may be some minor formatting changes.",
"location": "query",
"type": "string"
},
"projectId": {
"description": "The ID of the Google Cloud Platform project which will own the enterprise.",
"location": "query",
"type": "string"
}
},
"path": "v1/signupUrls",
"response": {
"$ref": "SignupUrl"
},
"scopes": [
"https://www.googleapis.com/auth/androidmanagement"
]
}
}
}
},
"revision": "20190624",
"rootUrl": "https://androidmanagement.googleapis.com/",
"schemas": {
"PermissionGrant": {
"description": "Configuration for an Android permission and its grant state.",
"id": "PermissionGrant",
"properties": {
"permission": {
"description": "The Android permission or group, e.g. android.permission.READ_CALENDAR or android.permission_group.CALENDAR.",
"type": "string"
},
"policy": {
"description": "The policy for granting the permission.",
"enum": [
"PERMISSION_POLICY_UNSPECIFIED",
"PROMPT",
"GRANT",
"DENY"
],
"enumDescriptions": [
"Policy not specified. If no policy is specified for a permission at any level, then the PROMPT behavior is used by default.",
"Prompt the user to grant a permission.",
"Automatically grant a permission.",
"Automatically deny a permission."
],
"type": "string"
}
},
"type": "object"
},
"ApplicationReport": {
"description": "Information reported about an installed app.",
"id": "ApplicationReport",
"properties": {
"state": {
"description": "Application state.",
"enum": [
"INSTALLED",
"REMOVED"
],
"enumDescriptions": [
"App is installed on the device",
"App was removed from the device"
],
"type": "string"
},
"applicationSource": {
"description": "The source of the package.",
"enum": [
"APPLICATION_SOURCE_UNSPECIFIED",
"SYSTEM_APP_FACTORY_VERSION",
"SYSTEM_APP_UPDATED_VERSION",
"INSTALLED_FROM_PLAY_STORE"
],
"enumDescriptions": [
"The app was sideloaded from an unspecified source.",
"This is a system app from the device's factory image.",
"This is an updated system app.",
"The app was installed from the Google Play Store."
],
"type": "string"
},
"versionName": {
"description": "The app version as displayed to the user.",
"type": "string"
},
"keyedAppStates": {
"description": "List of keyed app states reported by the app.",
"items": {
"$ref": "KeyedAppState"
},
"type": "array"
},
"packageName": {
"description": "Package name of the app.",
"type": "string"
},
"versionCode": {
"description": "The app version code, which can be used to determine whether one version is more recent than another.",
"format": "int32",
"type": "integer"
},
"packageSha256Hash": {
"description": "The SHA-256 hash of the app's APK file, which can be used to verify the app hasn't been modified. Each byte of the hash value is represented as a two-digit hexadecimal number.",
"type": "string"
},
"events": {
"description": "List of app events. The most recent 20 events are stored in the list.",
"items": {
"$ref": "ApplicationEvent"
},
"type": "array"
},
"displayName": {
"description": "The display name of the app.",
"type": "string"
},
"installerPackageName": {
"description": "The package name of the app that installed this app.",
"type": "string"
},
"signingKeyCertFingerprints": {
"description": "The SHA-1 hash of each android.content.pm.Signature (https://developer.android.com/reference/android/content/pm/Signature.html) associated with the app package. Each byte of each hash value is represented as a two-digit hexadecimal number.",
"items": {
"type": "string"
},
"type": "array"
}
},
"type": "object"
},
"WebToken": {
"description": "A web token used to access the managed Google Play iframe.",
"id": "WebToken",
"properties": {
"value": {
"description": "The token value which is used in the hosting page to generate the iframe with the embedded UI. This is a read-only field generated by the server.",
"type": "string"
},
"parentFrameUrl": {
"description": "The URL of the parent frame hosting the iframe with the embedded UI. To prevent XSS, the iframe may not be hosted at other URLs. The URL must use the https scheme.",
"type": "string"
},
"permissions": {
"description": "Permissions available to an admin in the embedded UI. An admin must have all of these permissions in order to view the UI.",
"enumDescriptions": [
"This value is ignored.",
"The permission to approve apps for the enterprise."
],
"items": {
"enum": [
"WEB_TOKEN_PERMISSION_UNSPECIFIED",
"APPROVE_APPS"
],
"type": "string"
},
"type": "array"
},
"name": {
"description": "The name of the web token, which is generated by the server during creation in the form enterprises/{enterpriseId}/webTokens/{webTokenId}.",
"type": "string"
}
},
"type": "object"
},
"SystemUpdate": {
"description": "Configuration for managing system updates",
"id": "SystemUpdate",
"properties": {
"endMinutes": {
"description": "If the type is WINDOWED, the end of the maintenance window, measured as the number of minutes after midnight in device's local time. This value must be between 0 and 1439, inclusive. If this value is less than start_minutes, then the maintenance window spans midnight. If the maintenance window specified is smaller than 30 minutes, the actual window is extended to 30 minutes beyond the start time.",
"format": "int32",
"type": "integer"
},
"type": {
"description": "The type of system update to configure.",
"enum": [
"SYSTEM_UPDATE_TYPE_UNSPECIFIED",
"AUTOMATIC",
"WINDOWED",
"POSTPONE"
],
"enumDescriptions": [
"Follow the default update behavior for the device, which typically requires the user to accept system updates.",
"Install automatically as soon as an update is available.",
"Install automatically within a daily maintenance window. This also configures Play apps to be updated within the window. This is strongly recommended for kiosk devices because this is the only way apps persistently pinned to the foreground can be updated by Play.",
"Postpone automatic install up to a maximum of 30 days."
],
"type": "string"
},
"startMinutes": {
"description": "If the type is WINDOWED, the start of the maintenance window, measured as the number of minutes after midnight in the device's local time. This value must be between 0 and 1439, inclusive.",
"format": "int32",
"type": "integer"
}
},
"type": "object"
},
"NonComplianceDetailCondition": {
"description": "A compliance rule condition which is satisfied if there exists any matching NonComplianceDetail for the device. A NonComplianceDetail matches a NonComplianceDetailCondition if all the fields which are set within the NonComplianceDetailCondition match the corresponding NonComplianceDetail fields.",
"id": "NonComplianceDetailCondition",
"properties": {
"packageName": {
"description": "The package name of the app that's out of compliance. If not set, then this condition matches any package name.",
"type": "string"
},
"settingName": {
"description": "The name of the policy setting. This is the JSON field name of a top-level Policy field. If not set, then this condition matches any setting name.",
"type": "string"
},
"nonComplianceReason": {
"description": "The reason the device is not in compliance with the setting. If not set, then this condition matches any reason.",
"enum": [
"NON_COMPLIANCE_REASON_UNSPECIFIED",
"API_LEVEL",
"MANAGEMENT_MODE",
"USER_ACTION",
"INVALID_VALUE",
"APP_NOT_INSTALLED",
"UNSUPPORTED",
"APP_INSTALLED",
"PENDING",
"APP_INCOMPATIBLE",
"APP_NOT_UPDATED"
],
"enumDescriptions": [
"This value is disallowed.",
"The setting is not supported in the API level of the Android version running on the device.",
"The management mode (profile owner, device owner, etc.) doesn't support the setting.",
"The user has not taken required action to comply with the setting.",
"The setting has an invalid value.",
"The app required to implement the policy is not installed.",
"The policy is not supported by the version of Android Device Policy on the device.",
"A blocked app is installed.",
"The setting hasn't been applied at the time of the report, but is expected to be applied shortly.",
"The setting can't be applied to the app because the app doesn't support it, for example because its target SDK version is not high enough.",
"The app is installed, but it hasn't been updated to the minimum version code specified by policy."
],
"type": "string"
}
},
"type": "object"
},
"ManagedPropertyEntry": {
"description": "An entry of a managed property.",
"id": "ManagedPropertyEntry",
"properties": {
"value": {
"description": "The machine-readable value of the entry, which should be used in the configuration. Not localized.",
"type": "string"
},
"name": {
"description": "The human-readable name of the value. Localized.",
"type": "string"
}
},
"type": "object"
},
"ApplicationReportingSettings": {
"description": "Settings controlling the behavior of application reports.",
"id": "ApplicationReportingSettings",
"properties": {
"includeRemovedApps": {
"description": "Whether removed apps are included in application reports.",
"type": "boolean"
}
},
"type": "object"
},
"ApplicationPolicy": {
"description": "Policy for an individual app.",
"id": "ApplicationPolicy",
"properties": {
"defaultPermissionPolicy": {
"description": "The default policy for all permissions requested by the app. If specified, this overrides the policy-level default_permission_policy which applies to all apps. It does not override the permission_grants which applies to all apps.",
"enum": [
"PERMISSION_POLICY_UNSPECIFIED",
"PROMPT",
"GRANT",
"DENY"
],
"enumDescriptions": [
"Policy not specified. If no policy is specified for a permission at any level, then the PROMPT behavior is used by default.",
"Prompt the user to grant a permission.",
"Automatically grant a permission.",
"Automatically deny a permission."
],
"type": "string"
},
"disabled": {
"description": "Whether the app is disabled. When disabled, the app data is still preserved.",
"type": "boolean"
},
"delegatedScopes": {
"description": "The scopes delegated to the app from Android Device Policy.",
"enumDescriptions": [
"No delegation scope specified.",
"Grants access to certificate installation and management.",
"Grants access to managed configurations management.",
"Grants access to blocking uninstallation.",
"Grants access to permission policy and permission grant state.",
"Grants access to package access state.",
"Grants access for enabling system apps."
],
"items": {
"enum": [
"DELEGATED_SCOPE_UNSPECIFIED",
"CERT_INSTALL",
"MANAGED_CONFIGURATIONS",
"BLOCK_UNINSTALL",
"PERMISSION_GRANT",
"PACKAGE_ACCESS",
"ENABLE_SYSTEM_APP"
],
"type": "string"
},
"type": "array"
},
"packageName": {
"description": "The package name of the app. For example, com.google.android.youtube for the YouTube app.",
"type": "string"
},
"installType": {
"description": "The type of installation to perform.",
"enum": [
"INSTALL_TYPE_UNSPECIFIED",
"PREINSTALLED",
"FORCE_INSTALLED",
"BLOCKED",
"AVAILABLE",
"REQUIRED_FOR_SETUP"
],
"enumDescriptions": [
"Unspecified. Defaults to AVAILABLE.",
"The app is automatically installed and can be removed by the user.",
"The app is automatically installed and can't be removed by the user.",
"The app is blocked and can't be installed. If the app was installed under a previous policy, it will be uninstalled.",
"The app is available to install.",
"The app is automatically installed and can't be removed by the user and will prevent setup from completion until installation is complete."
],
"type": "string"
},
"minimumVersionCode": {
"description": "The minimum version of the app that runs on the device. If set, the device attempts to update the app to at least this version code. If the app is not up-to-date, the device will contain a NonComplianceDetail with non_compliance_reason set to APP_NOT_UPDATED. The app must already be published to Google Play with a version code greater than or equal to this value. At most 20 apps may specify a minimum version code per policy.",
"format": "int32",
"type": "integer"
},
"permissionGrants": {
"description": "Explicit permission grants or denials for the app. These values override the default_permission_policy and permission_grants which apply to all apps.",
"items": {
"$ref": "PermissionGrant"
},
"type": "array"
},
"lockTaskAllowed": {
"description": "Whether the app is allowed to lock itself in full-screen mode.",
"type": "boolean"
},
"managedConfiguration": {
"additionalProperties": {
"description": "Properties of the object.",
"type": "any"
},
"description": "Managed configuration applied to the app. The format for the configuration is dictated by the ManagedProperty values supported by the app. Each field name in the managed configuration must match the key field of the ManagedProperty. The field value must be compatible with the type of the ManagedProperty: <table> <tr><td><i>type</i></td><td><i>JSON value</i></td></tr> <tr><td>BOOL</td><td>true or false</td></tr> <tr><td>STRING</td><td>string</td></tr> <tr><td>INTEGER</td><td>number</td></tr> <tr><td>CHOICE</td><td>string</td></tr> <tr><td>MULTISELECT</td><td>array of strings</td></tr> <tr><td>HIDDEN</td><td>string</td></tr> <tr><td>BUNDLE_ARRAY</td><td>array of objects</td></tr> </table>",
"type": "object"
},
"managedConfigurationTemplate": {
"$ref": "ManagedConfigurationTemplate",
"description": "The managed configurations template for the app, saved from the managed configurations iframe. This field is ignored if managed_configuration is set."
}
},
"type": "object"
},
"MemoryEvent": {
"description": "An event related to memory and storage measurements.",
"id": "MemoryEvent",
"properties": {
"eventType": {
"description": "Event type.",
"enum": [
"MEMORY_EVENT_TYPE_UNSPECIFIED",
"RAM_MEASURED",
"INTERNAL_STORAGE_MEASURED",
"EXTERNAL_STORAGE_DETECTED",
"EXTERNAL_STORAGE_REMOVED",
"EXTERNAL_STORAGE_MEASURED"
],
"enumDescriptions": [
"Unspecified. No events have this type.",
"Free space in RAM was measured.",
"Free space in internal storage was measured.",
"A new external storage medium was detected. The reported byte count is the total capacity of the storage medium.",
"An external storage medium was removed. The reported byte count is zero.",
"Free space in an external storage medium was measured."
],
"type": "string"
},
"createTime": {
"description": "The creation time of the event.",
"format": "google-datetime",
"type": "string"
},
"byteCount": {
"description": "The number of free bytes in the medium, or for EXTERNAL_STORAGE_DETECTED, the total capacity in bytes of the storage medium.",
"format": "int64",
"type": "string"
}
},
"type": "object"
},
"Empty": {
"description": "A generic empty message that you can re-use to avoid defining duplicated empty messages in your APIs. A typical example is to use it as the request or the response type of an API method. For instance:\nservice Foo {\n  rpc Bar(google.protobuf.Empty) returns (google.protobuf.Empty);\n}\nThe JSON representation for Empty is empty JSON object {}.",
"id": "Empty",
"properties": {},
"type": "object"
},
"PolicyEnforcementRule": {
"description": "A rule that defines the actions to take if a device or work profile is not compliant with the policy specified in settingName.",
"id": "PolicyEnforcementRule",
"properties": {
"settingName": {
"description": "The top-level policy to enforce. For example, applications or passwordPolicies.",
"type": "string"
},
"blockAction": {
"$ref": "BlockAction",
"description": "An action to block access to apps and data on a fully managed device or in a work profile. This action also triggers a user-facing notification with information (where possible) on how to correct the compliance issue. Note: wipeAction must also be specified."
},
"wipeAction": {
"$ref": "WipeAction",
"description": "An action to reset a fully managed device or delete a work profile. Note: blockAction must also be specified."
}
},
"type": "object"
},
"NetworkInfo": {
"description": "Device network info.",
"id": "NetworkInfo",
"properties": {
"imei": {
"description": "IMEI number of the GSM device. For example, A1000031212.",
"type": "string"
},
"meid": {
"description": "MEID number of the CDMA device. For example, A00000292788E1.",
"type": "string"
},
"wifiMacAddress": {
"description": "Wi-Fi MAC address of the device. For example, 7c:11:11:11:11:11.",
"type": "string"
},
"networkOperatorName": {
"description": "Alphabetic name of current registered operator. For example, Vodafone.",
"type": "string"
}
},
"type": "object"
},
"ListWebAppsResponse": {
"description": "Response to a request to list web apps for a given enterprise.",
"id": "ListWebAppsResponse",
"properties": {
"webApps": {
"description": "The list of web apps.",
"items": {
"$ref": "WebApp"
},
"type": "array"
},
"nextPageToken": {
"description": "If there are more results, a token to retrieve next page of results.",
"type": "string"
}
},
"type": "object"
},
"SetupAction": {
"description": "An action executed during setup.",
"id": "SetupAction",
"properties": {
"title": {
"$ref": "UserFacingMessage",
"description": "Title of this action."
},
"launchApp": {
"$ref": "LaunchAppAction",
"description": "An action to launch an app."
},
"description": {
"$ref": "UserFacingMessage",
"description": "Description of this action."
}
},
"type": "object"
},
"DeviceSettings": {
"description": "Information about security related device settings on device.",
"id": "DeviceSettings",
"properties": {
"developmentSettingsEnabled": {
"description": "Whether developer mode is enabled on the device.",
"type": "boolean"
},
"adbEnabled": {
"description": "Whether ADB (https://developer.android.com/studio/command-line/adb.html) is enabled on the device.",
"type": "boolean"
},
"isEncrypted": {
"description": "Whether the storage encryption is enabled.",
"type": "boolean"
},
"encryptionStatus": {
"description": "Encryption status from DevicePolicyManager.",
"enum": [
"ENCRYPTION_STATUS_UNSPECIFIED",
"UNSUPPORTED",
"INACTIVE",
"ACTIVATING",
"ACTIVE",
"ACTIVE_DEFAULT_KEY",
"ACTIVE_PER_USER"
],
"enumDescriptions": [
"Unspecified. No device should have this type.",
"Encryption is not supported by the device.",
"Encryption is supported by the device, but is not currently active.",
"Encryption is not currently active, but is currently being activated.",
"Encryption is active.",
"Encryption is active, but an encryption key is not set by the user.",
"Encryption is active, and the encryption key is tied to the user profile."
],
"type": "string"
},
"isDeviceSecure": {
"description": "Whether the device is secured with PIN/password.",
"type": "boolean"
},
"unknownSourcesEnabled": {
"description": "Whether installing apps from unknown sources is enabled.",
"type": "boolean"
},
"verifyAppsEnabled": {
"description": "Whether Verify Apps (Google Play Protect (https://support.google.com/googleplay/answer/2812853)) is enabled on the device.",
"type": "boolean"
}
},
"type": "object"
},
"WebApp": {
"description": "A web app.",
"id": "WebApp",
"properties": {
"name": {
"description": "The name of the web app, which is generated by the server during creation in the form enterprises/{enterpriseId}/webApps/{packageName}.",
"type": "string"
},
"versionCode": {
"description": "The current version of the app.<p>Note that the version can automatically increase during the lifetime of the web app, while Google does internal housekeeping to keep the web app up-to-date.",
"format": "int64",
"type": "string"
},
"icons": {
"description": "A list of icons for the web app. Must have at least one element.",
"items": {
"$ref": "WebAppIcon"
},
"type": "array"
},
"startUrl": {
"description": "The start URL, i.e. the URL that should load when the user opens the application.",
"type": "string"
},
"displayMode": {
"description": "The display mode of the web app.",
"enum": [
"DISPLAY_MODE_UNSPECIFIED",
"MINIMAL_UI",
"STANDALONE",
"FULL_SCREEN"
],
"enumDescriptions": [
"Not used.",
"Opens the web app with a minimal set of browser UI elements for controlling navigation and viewing the page URL.",
"Opens the web app to look and feel like a standalone native application. The browser UI elements and page URL are not visible, however the system status bar and back button are visible.",
"Opens the web app in full screen without any visible controls. The browser UI elements, page URL, system status bar and back button are not visible, and the web app takes up the entirety of the available display area."
],
"type": "string"
},
"title": {
"description": "The title of the web app as displayed to the user (e.g., amongst a list of other applications, or as a label for an icon).",
"type": "string"
}
},
"type": "object"
},
"StatusReportingSettings": {
"description": "Settings controlling the behavior of status reports.",
"id": "StatusReportingSettings",
"properties": {
"memoryInfoEnabled": {
"description": "Whether memory reporting is enabled.",
"type": "boolean"
},
"displayInfoEnabled": {
"description": "Whether displays reporting is enabled.",
"type": "boolean"
},
"powerManagementEventsEnabled": {
"description": "Whether power management event reporting is enabled.",
"type": "boolean"
},
"deviceSettingsEnabled": {
"description": "Whether device settings reporting is enabled.",
"type": "boolean"
},
"networkInfoEnabled": {
"description": "Whether network info reporting is enabled.",
"type": "boolean"
},
"applicationReportingSettings": {
"$ref": "ApplicationReportingSettings",
"description": "Application reporting settings. Only applicable if application_reports_enabled is true."
},
"softwareInfoEnabled": {
"description": "Whether software info reporting is enabled.",
"type": "boolean"
},
"applicationReportsEnabled": {
"description": "Whether app reports are enabled.",
"type": "boolean"
},
"hardwareStatusEnabled": {
"description": "Whether hardware status reporting is enabled.",
"type": "boolean"
}
},
"type": "object"
},
"ExternalData": {
"description": "Data hosted at an external location. The data is to be downloaded by Android Device Policy and verified against the hash.",
"id": "ExternalData",
"properties": {
"url": {
"description": "The absolute URL to the data, which must use either the http or https scheme. Android Device Policy doesn't provide any credentials in the GET request, so the URL must be publicly accessible. Including a long, random component in the URL may be used to prevent attackers from discovering the URL.",
"type": "string"
},
"sha256Hash": {
"description": "The base-64 encoded SHA-256 hash of the content hosted at url. If the content doesn't match this hash, Android Device Policy won't use the data.",
"type": "string"
}
},
"type": "object"
},
"Policy": {
"description": "A policy resources represents a group settings that govern the behavior of a managed device and the apps installed on it.",
"id": "Policy",
"properties": {
"shareLocationDisabled": {
"description": "Whether location sharing is disabled.",
"type": "boolean"
},
"cellBroadcastsConfigDisabled": {
"description": "Whether configuring cell broadcast is disabled.",
"type": "boolean"
},
"androidDevicePolicyTracks": {
"description": "The app tracks for Android Device Policy the device can access. The device receives the latest version among all accessible tracks. If no tracks are specified, then the device only uses the production track.",
"enumDescriptions": [
"This value is ignored.",
"The production track, which provides the latest stable release.",
"The beta track, which provides the latest beta release."
],
"items": {
"enum": [
"APP_TRACK_UNSPECIFIED",
"PRODUCTION",
"BETA"
],
"type": "string"
},
"type": "array"
},
"modifyAccountsDisabled": {
"description": "Whether adding or removing accounts is disabled.",
"type": "boolean"
},
"frpAdminEmails": {
"description": "Email addresses of device administrators for factory reset protection. When the device is factory reset, it will require one of these admins to log in with the Google account email and password to unlock the device. If no admins are specified, the device won't provide factory reset protection.",
"items": {
"type": "string"
},
"type": "array"
},
"locationMode": {
"description": "The degree of location detection enabled. The user may change the value unless the user is otherwise blocked from accessing device settings.",
"enum": [
"LOCATION_MODE_UNSPECIFIED",
"HIGH_ACCURACY",
"SENSORS_ONLY",
"BATTERY_SAVING",
"OFF"
],
"enumDescriptions": [
"The current device value is not modified.",
"All location detection methods are enabled, including GPS, networks, and other sensors.",
"Only GPS and other sensors are enabled.",
"Only the network location provider is enabled.",
"Location detection is disabled."
],
"type": "string"
},
"installUnknownSourcesAllowed": {
"description": "Whether the user is allowed to enable the \"Unknown Sources\" setting, which allows installation of apps from unknown sources.",
"type": "boolean"
},
"privateKeySelectionEnabled": {
"description": "Allows showing UI on a device for a user to choose a private key alias if there are no matching rules in ChoosePrivateKeyRules. For devices below Android P, setting this may leave enterprise keys vulnerable.",
"type": "boolean"
},
"persistentPreferredActivities": {
"description": "Default intent handler activities.",
"items": {
"$ref": "PersistentPreferredActivity"
},
"type": "array"
},
"setupActions": {
"description": "Actions to take during the setup process.",
"items": {
"$ref": "SetupAction"
},
"type": "array"
},
"bluetoothContactSharingDisabled": {
"description": "Whether bluetooth contact sharing is disabled.",
"type": "boolean"
},
"createWindowsDisabled": {
"description": "Whether creating windows besides app windows is disabled.",
"type": "boolean"
},
"autoTimeRequired": {
"description": "Whether auto time is required, which prevents the user from manually setting the date and time.",
"type": "boolean"
},
"removeUserDisabled": {
"description": "Whether removing other users is disabled.",
"type": "boolean"
},
"complianceRules": {
"description": "Rules declaring which mitigating actions to take when a device is not compliant with its policy. When the conditions for multiple rules are satisfied, all of the mitigating actions for the rules are taken. There is a maximum limit of 100 rules. Use policy enforcement rules instead.",
"items": {
"$ref": "ComplianceRule"
},
"type": "array"
},
"installAppsDisabled": {
"description": "Whether user installation of apps is disabled.",
"type": "boolean"
},
"systemUpdate": {
"$ref": "SystemUpdate",
"description": "The system update policy, which controls how OS updates are applied. If the update type is WINDOWED, the update window will automatically apply to Play app updates as well."
},
"smsDisabled": {
"description": "Whether sending and receiving SMS messages is disabled.",
"type": "boolean"
},
"appAutoUpdatePolicy": {
"description": "The app auto update policy, which controls when automatic app updates can be applied.",
"enum": [
"APP_AUTO_UPDATE_POLICY_UNSPECIFIED",
"CHOICE_TO_THE_USER",
"NEVER",
"WIFI_ONLY",
"ALWAYS"
],
"enumDescriptions": [
"The auto-update policy is not set. Equivalent to CHOICE_TO_THE_USER.",
"The user can control auto-updates.",
"Apps are never auto-updated.",
"Apps are auto-updated over Wi-Fi only.",
"Apps are auto-updated at any time. Data charges may apply."
],
"type": "string"
},
"statusBarDisabled": {
"description": "Whether the status bar is disabled. This disables notifications, quick settings, and other screen overlays that allow escape from full-screen mode.",
"type": "boolean"
},
"uninstallAppsDisabled": {
"description": "Whether user uninstallation of applications is disabled.",
"type": "boolean"
},
"deviceOwnerLockScreenInfo": {
"$ref": "UserFacingMessage",
"description": "The device owner information to be shown on the lock screen."
},
"blockApplicationsEnabled": {
"description": "Whether applications other than the ones configured in applications are blocked from being installed. When set, applications that were installed under a previous policy but no longer appear in the policy are automatically uninstalled.",
"type": "boolean"
},
"credentialsConfigDisabled": {
"description": "Whether configuring user credentials is disabled.",
"type": "boolean"
},
"accountTypesWithManagementDisabled": {
"description": "Account types that can't be managed by the user.",
"items": {
"type": "string"
},
"type": "array"
},
"safeBootDisabled": {
"description": "Whether rebooting the device into safe boot is disabled.",
"type": "boolean"
},
"applications": {
"description": "Policy applied to apps.",
"items": {
"$ref": "ApplicationPolicy"
},
"type": "array"
},
"usbMassStorageEnabled": {
"description": "Whether USB storage is enabled. Deprecated.",
"type": "boolean"
},
"minimumApiLevel": {
"description": "The minimum allowed Android API level.",
"format": "int32",
"type": "integer"
},
"keyguardDisabled": {
"description": "Whether the keyguard is disabled.",
"type": "boolean"
},
"choosePrivateKeyRules": {
"description": "Rules for automatically choosing a private key and certificate to authenticate the device to a server. The rules are ordered by increasing precedence, so if an outgoing request matches more than one rule, the last rule defines which private key to use.",
"items": {
"$ref": "ChoosePrivateKeyRule"
},
"type": "array"
},
"permissionGrants": {
"description": "Explicit permission or group grants or denials for all apps. These values override the default_permission_policy.",
"items": {
"$ref": "PermissionGrant"
},
"type": "array"
},
"permittedInputMethods": {
"$ref": "PackageNameList",
"description": "If present, only the input methods provided by packages in this list are permitted. If this field is present, but the list is empty, then only system input methods are permitted."
},
"screenCaptureDisabled": {
"description": "Whether screen capture is disabled.",
"type": "boolean"
},
"passwordPolicies": {
"description": "Password requirement policies. Different policies can be set for work profile or fully managed devices by setting the password_scope field in the policy.",
"items": {
"$ref": "PasswordRequirements"
},
"type": "array"
},
"networkResetDisabled": {
"description": "Whether resetting network settings is disabled.",
"type": "boolean"
},
"mobileNetworksConfigDisabled": {
"description": "Whether configuring mobile networks is disabled.",
"type": "boolean"
},
"networkEscapeHatchEnabled": {
"description": "Whether the network escape hatch is enabled. If a network connection can't be made at boot time, the escape hatch prompts the user to temporarily connect to a network in order to refresh the device policy. After applying policy, the temporary network will be forgotten and the device will continue booting. This prevents being unable to connect to a network if there is no suitable network in the last policy and the device boots into an app in lock task mode, or the user is otherwise unable to reach device settings.",
"type": "boolean"
},
"name": {
"description": "The name of the policy in the form enterprises/{enterpriseId}/policies/{policyId}.",
"type": "string"
},
"playStoreMode": {
"description": "This mode controls which apps are available to the user in the Play Store and the behavior on the device when apps are removed from the policy.",
"enum": [
"PLAY_STORE_MODE_UNSPECIFIED",
"WHITELIST",
"BLACKLIST"
],
"enumDescriptions": [
"Unspecified. Defaults to WHITELIST.",
"Only apps that are in the policy are available and any app not in the policy will be automatically uninstalled from the device.",
"All apps are available and any app that should not be on the device should be explicitly marked as 'BLOCKED' in the applications policy."
],
"type": "string"
},
"unmuteMicrophoneDisabled": {
"description": "Whether the microphone is muted and adjusting microphone volume is disabled.",
"type": "boolean"
},
"encryptionPolicy": {
"description": "Whether encryption is enabled",
"enum": [
"ENCRYPTION_POLICY_UNSPECIFIED",
"ENABLED_WITHOUT_PASSWORD",
"ENABLED_WITH_PASSWORD"
],
"enumDescriptions": [
"This value is ignored, i.e. no encryption required",
"Encryption required but no password required to boot",
"Encryption required with password required to boot"
],
"type": "string"
},
"recommendedGlobalProxy": {
"$ref": "ProxyInfo",
"description": "The network-independent global HTTP proxy. Typically proxies should be configured per-network in open_network_configuration. However for unusual configurations like general internal filtering a global HTTP proxy may be useful. If the proxy is not accessible, network access may break. The global proxy is only a recommendation and some apps may ignore it."
},
"skipFirstUseHintsEnabled": {
"description": "Flag to skip hints on the first use. Enterprise admin can enable the system recommendation for apps to skip their user tutorial and other introductory hints on first start-up.",
"type": "boolean"
},
"usbFileTransferDisabled": {
"description": "Whether transferring files over USB is disabled.",
"type": "boolean"
},
"outgoingCallsDisabled": {
"description": "Whether outgoing calls are disabled.",
"type": "boolean"
},
"adjustVolumeDisabled": {
"description": "Whether adjusting the master volume is disabled.",
"type": "boolean"
},
"defaultPermissionPolicy": {
"description": "The default permission policy for runtime permission requests.",
"enum": [
"PERMISSION_POLICY_UNSPECIFIED",
"PROMPT",
"GRANT",
"DENY"
],
"enumDescriptions": [
"Policy not specified. If no policy is specified for a permission at any level, then the PROMPT behavior is used by default.",
"Prompt the user to grant a permission.",
"Automatically grant a permission.",
"Automatically deny a permission."
],
"type": "string"
},
"bluetoothConfigDisabled": {
"description": "Whether configuring bluetooth is disabled.",
"type": "boolean"
},
"stayOnPluggedModes": {
"description": "The battery plugged in modes for which the device stays on. When using this setting, it is recommended to clear maximum_time_to_lock so that the device doesn't lock itself while it stays on.",
"enumDescriptions": [
"This value is ignored.",
"Power source is an AC charger.",
"Power source is a USB port.",
"Power source is wireless."
],
"items": {
"enum": [
"BATTERY_PLUGGED_MODE_UNSPECIFIED",
"AC",
"USB",
"WIRELESS"
],
"type": "string"
},
"type": "array"
},
"outgoingBeamDisabled": {
"description": "Whether using NFC to beam data from apps is disabled.",
"type": "boolean"
},
"wifiConfigsLockdownEnabled": {
"description": "DEPRECATED - Use wifi_config_disabled.",
"type": "boolean"
},
"dataRoamingDisabled": {
"description": "Whether roaming data services are disabled.",
"type": "boolean"
},
"bluetoothDisabled": {
"description": "Whether bluetooth is disabled. Prefer this setting over bluetooth_config_disabled because bluetooth_config_disabled can be bypassed by the user.",
"type": "boolean"
},
"alwaysOnVpnPackage": {
"$ref": "AlwaysOnVpnPackage",
"description": "Configuration for an always-on VPN connection. Use with vpn_config_disabled to prevent modification of this setting."
},
"version": {
"description": "The version of the policy. This is a read-only field. The version is incremented each time the policy is updated.",
"format": "int64",
"type": "string"
},
"mountPhysicalMediaDisabled": {
"description": "Whether the user mounting physical external media is disabled.",
"type": "boolean"
},
"passwordRequirements": {
"$ref": "PasswordRequirements",
"description": "Password requirements. DEPRECATED - Use password_policies"
},
"tetheringConfigDisabled": {
"description": "Whether configuring tethering and portable hotspots is disabled.",
"type": "boolean"
},
"statusReportingSettings": {
"$ref": "StatusReportingSettings",
"description": "Status reporting settings"
},
"maximumTimeToLock": {
"description": "Maximum time in milliseconds for user activity until the device locks. A value of 0 means there is no restriction.",
"format": "int64",
"type": "string"
},
"funDisabled": {
"description": "Whether the user is allowed to have fun. Controls whether the Easter egg game in Settings is disabled.",
"type": "boolean"
},
"kioskCustomLauncherEnabled": {
"description": "Whether the kiosk custom launcher is enabled. This replaces the home screen with a launcher that locks down the device to the apps installed via the applications setting. The apps appear on a single page in alphabetical order. It is recommended to also use status_bar_disabled to block access to device settings.",
"type": "boolean"
},
"longSupportMessage": {
"$ref": "UserFacingMessage",
"description": "A message displayed to the user in the device administators settings screen."
},
"keyguardDisabledFeatures": {
"description": "Disabled keyguard customizations, such as widgets.",
"enumDescriptions": [
"This value is ignored.",
"Disable the camera on secure keyguard screens (e.g. PIN).",
"Disable showing all notifications on secure keyguard screens.",
"Disable unredacted notifications on secure keyguard screens.",
"Ignore trust agent state on secure keyguard screens.",
"Disable fingerprint sensor on keyguard secure screens.",
"Disable text entry into notifications on secure keyguard screens.",
"Disable all current and future keyguard customizations."
],
"items": {
"enum": [
"KEYGUARD_DISABLED_FEATURE_UNSPECIFIED",
"CAMERA",
"NOTIFICATIONS",
"UNREDACTED_NOTIFICATIONS",
"TRUST_AGENTS",
"DISABLE_FINGERPRINT",
"DISABLE_REMOTE_INPUT",
"ALL_FEATURES"
],
"type": "string"
},
"type": "array"
},
"vpnConfigDisabled": {
"description": "Whether configuring VPN is disabled.",
"type": "boolean"
},
"cameraDisabled": {
"description": "Whether all cameras on the device are disabled.",
"type": "boolean"
},
"factoryResetDisabled": {
"description": "Whether factory resetting from settings is disabled.",
"type": "boolean"
},
"wifiConfigDisabled": {
"description": "Whether configuring Wi-Fi access points is disabled.",
"type": "boolean"
},
"policyEnforcementRules": {
"description": "Rules that define the behavior when a particular policy can not be applied on device",
"items": {
"$ref": "PolicyEnforcementRule"
},
"type": "array"
},
"addUserDisabled": {
"description": "Whether adding new users and profiles is disabled.",
"type": "boolean"
},
"setUserIconDisabled": {
"description": "Whether changing the user icon is disabled.",
"type": "boolean"
},
"shortSupportMessage": {
"$ref": "UserFacingMessage",
"description": "A message displayed to the user in the settings screen wherever functionality has been disabled by the admin."
},
"setWallpaperDisabled": {
"description": "Whether changing the wallpaper is disabled.",
"type": "boolean"
},
"ensureVerifyAppsEnabled": {
"description": "Whether app verification is force-enabled.",
"type": "boolean"
},
"debuggingFeaturesAllowed": {
"description": "Whether the user is allowed to enable debugging features.",
"type": "boolean"
},
"openNetworkConfiguration": {
"additionalProperties": {
"description": "Properties of the object.",
"type": "any"
},
"description": "Network configuration for the device. See configure networks for more information.",
"type": "object"
}
},
"type": "object"
},
"PowerManagementEvent": {
"description": "A power management event.",
"id": "PowerManagementEvent",
"properties": {
"eventType": {
"description": "Event type.",
"enum": [
"POWER_MANAGEMENT_EVENT_TYPE_UNSPECIFIED",
"BATTERY_LEVEL_COLLECTED",
"POWER_CONNECTED",
"POWER_DISCONNECTED",
"BATTERY_LOW",
"BATTERY_OKAY",
"BOOT_COMPLETED",
"SHUTDOWN"
],
"enumDescriptions": [
"Unspecified. No events have this type.",
"Battery level was measured.",
"The device started charging.",
"The device stopped charging.",
"The device entered low-power mode.",
"The device exited low-power mode.",
"The device booted.",
"The device shut down."
],
"type": "string"
},
"createTime": {
"description": "The creation time of the event.",
"format": "google-datetime",
"type": "string"
},
"batteryLevel": {
"description": "For BATTERY_LEVEL_COLLECTED events, the battery level as a percentage.",
"format": "float",
"type": "number"
}
},
"type": "object"
},
"Operation": {
"description": "This resource represents a long-running operation that is the result of a network API call.",
"id": "Operation",
"properties": {
"name": {
"description": "The server-assigned name, which is only unique within the same service that originally returns it. If you use the default HTTP mapping, the name should be a resource name ending with operations/{unique_id}.",
"type": "string"
},
"error": {
"$ref": "Status",
"description": "The error result of the operation in case of failure or cancellation."
},
"metadata": {
"additionalProperties": {
"description": "Properties of the object. Contains field @type with type URL.",
"type": "any"
},
"description": "Service-specific metadata associated with the operation. It typically contains progress information and common metadata such as create time. Some services might not provide such metadata. Any method that returns a long-running operation should document the metadata type, if any.",
"type": "object"
},
"done": {
"description": "If the value is false, it means the operation is still in progress. If true, the operation is completed, and either error or response is available.",
"type": "boolean"
},
"response": {
"additionalProperties": {
"description": "Properties of the object. Contains field @type with type URL.",
"type": "any"
},
"description": "The normal response of the operation in case of success. If the original method returns no data on success, such as Delete, the response is google.protobuf.Empty. If the original method is standard Get/Create/Update, the response should be the resource. For other methods, the response should have the type XxxResponse, where Xxx is the original method name. For example, if the original method name is TakeSnapshot(), the inferred response type is TakeSnapshotResponse.",
"type": "object"
}
},
"type": "object"
},
"ManagedConfigurationTemplate": {
"description": "The managed configurations template for the app, saved from the managed configurations iframe.",
"id": "ManagedConfigurationTemplate",
"properties": {
"templateId": {
"description": "The ID of the managed configurations template.",
"type": "string"
},
"configurationVariables": {
"additionalProperties": {
"type": "string"
},
"description": "Optional, a map containing <key, value> configuration variables defined for the configuration.",
"type": "object"
}
},
"type": "object"
},
"EnrollmentToken": {
"description": "An enrollment token.",
"id": "EnrollmentToken",
"properties": {
"expirationTimestamp": {
"description": "The expiration time of the token. This is a read-only field generated by the server.",
"format": "google-datetime",
"type": "string"
},
"additionalData": {
"description": "Optional, arbitrary data associated with the enrollment token. This could contain, for example, the ID of an org unit the device is assigned to after enrollment. After a device enrolls with the token, this data will be exposed in the enrollment_token_data field of the Device resource. The data must be 1024 characters or less; otherwise, the creation request will fail.",
"type": "string"
},
"policyName": {
"description": "The name of the policy initially applied to the enrolled device, in the form enterprises/{enterpriseId}/policies/{policyId}. If not specified, the policy_name for the device’s user is applied. If user_name is also not specified, enterprises/{enterpriseId}/policies/default is applied by default. When updating this field, you can specify only the policyId as long as the policyId doesn’t contain any slashes. The rest of the policy name will be inferred.",
"type": "string"
},
"qrCode": {
"description": "A JSON string whose UTF-8 representation can be used to generate a QR code to enroll a device with this enrollment token. To enroll a device using NFC, the NFC record must contain a serialized java.util.Properties representation of the properties in the JSON.",
"type": "string"
},
"oneTimeOnly": {
"description": "Whether the enrollment token is for one time use only. If the flag is set to true, only one device can use it for registration.",
"type": "boolean"
},
"name": {
"description": "The name of the enrollment token, which is generated by the server during creation, in the form enterprises/{enterpriseId}/enrollmentTokens/{enrollmentTokenId}.",
"type": "string"
},
"user": {
"$ref": "User",
"description": "The user associated with this enrollment token. If it's specified when the enrollment token is created and the user does not exist, the user will be created. This field must not contain personally identifiable information. Only the account_identifier field needs to be set."
},
"value": {
"description": "The token value that's passed to the device and authorizes the device to enroll. This is a read-only field generated by the server.",
"type": "string"
},
"duration": {
"description": "The length of time the enrollment token is valid, ranging from 1 minute to 30 days. If not specified, the default duration is 1 hour.",
"format": "google-duration",
"type": "string"
}
},
"type": "object"
},
"Status": {
"description": "The Status type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by gRPC (https://github.com/grpc). Each Status message contains three pieces of data: error code, error message, and error details.You can find out more about this error model and how to work with it in the API Design Guide (https://cloud.google.com/apis/design/errors).",
"id": "Status",
"properties": {
"details": {
"description": "A list of messages that carry the error details. There is a common set of message types for APIs to use.",
"items": {
"additionalProperties": {
"description": "Properties of the object. Contains field @type with type URL.",
"type": "any"
},
"type": "object"
},
"type": "array"
},
"code": {
"description": "The status code, which should be an enum value of google.rpc.Code.",
"format": "int32",
"type": "integer"
},
"message": {
"description": "A developer-facing error message, which should be in English. Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.",
"type": "string"
}
},
"type": "object"
},
"Display": {
"description": "Device display information.",
"id": "Display",
"properties": {
"width": {
"description": "Display width in pixels.",
"format": "int32",
"type": "integer"
},
"refreshRate": {
"description": "Refresh rate of the display in frames per second.",
"format": "int32",
"type": "integer"
},
"displayId": {
"description": "Unique display id.",
"format": "int32",
"type": "integer"
},
"state": {
"description": "State of the display.",
"enum": [
"DISPLAY_STATE_UNSPECIFIED",
"OFF",
"ON",
"DOZE",
"SUSPENDED"
],
"enumDescriptions": [
"This value is disallowed.",
"Display is off.",
"Display is on.",
"Display is dozing in a low power state",
"Display is dozing in a suspended low power state."
],
"type": "string"
},
"name": {
"description": "Name of the display.",
"type": "string"
},
"density": {
"description": "Display density expressed as dots-per-inch.",
"format": "int32",
"type": "integer"
},
"height": {
"description": "Display height in pixels.",
"format": "int32",
"type": "integer"
}
},
"type": "object"
},
"ApplicationPermission": {
"description": "A permission required by the app.",
"id": "ApplicationPermission",
"properties": {
"description": {
"description": "A longer description of the permission, providing more detail on what it affects. Localized.",
"type": "string"
},
"permissionId": {
"description": "An opaque string uniquely identifying the permission. Not localized.",
"type": "string"
},
"name": {
"description": "The name of the permission. Localized.",
"type": "string"
}
},
"type": "object"
},
"TermsAndConditions": {
"description": "A terms and conditions page to be accepted during provisioning.",
"id": "TermsAndConditions",
"properties": {
"content": {
"$ref": "UserFacingMessage",
"description": "A well-formatted HTML string. It will be parsed on the client with android.text.Html#fromHtml."
},
"header": {
"$ref": "UserFacingMessage",
"description": "A short header which appears above the HTML content."
}
},
"type": "object"
},
"AlwaysOnVpnPackage": {
"description": "Configuration for an always-on VPN connection.",
"id": "AlwaysOnVpnPackage",
"properties": {
"lockdownEnabled": {
"description": "Disallows networking when the VPN is not connected.",
"type": "boolean"
},
"packageName": {
"description": "The package name of the VPN app.",
"type": "string"
}
},
"type": "object"
},
"ListOperationsResponse": {
"description": "The response message for Operations.ListOperations.",
"id": "ListOperationsResponse",
"properties": {
"nextPageToken": {
"description": "The standard List next-page token.",
"type": "string"
},
"operations": {
"description": "A list of operations that matches the specified filter in the request.",
"items": {
"$ref": "Operation"
},
"type": "array"
}
},
"type": "object"
},
"MemoryInfo": {
"description": "Information about device memory and storage.",
"id": "MemoryInfo",
"properties": {
"totalRam": {
"description": "Total RAM on device in bytes.",
"format": "int64",
"type": "string"
},
"totalInternalStorage": {
"description": "Total internal storage on device in bytes.",
"format": "int64",
"type": "string"
}
},
"type": "object"
},
"Enterprise": {
"description": "The configuration applied to an enterprise.",
"id": "Enterprise",
"properties": {
"signinDetails": {
"description": "Sign-in details of the enterprise. Maximum of 1 SigninDetail is supported.",
"items": {
"$ref": "SigninDetail"
},
"type": "array"
},
"termsAndConditions": {
"description": "Terms and conditions that must be accepted when provisioning a device for this enterprise. A page of terms is generated for each value in this list.",
"items": {
"$ref": "TermsAndConditions"
},
"type": "array"
},
"name": {
"description": "The name of the enterprise which is generated by the server during creation, in the form enterprises/{enterpriseId}.",
"type": "string"
},
"primaryColor": {
"description": "A color in RGB format that indicates the predominant color to display in the device management app UI. The color components are stored as follows: (red << 16) | (green << 8) | blue, where the value of each component is between 0 and 255, inclusive.",
"format": "int32",
"type": "integer"
},
"enabledNotificationTypes": {
"description": "The types of Google Pub/Sub notifications enabled for the enterprise.",
"enumDescriptions": [
"This value is ignored.",
"A notification sent when a device enrolls.",
"Deprecated.",
"A notification sent when a device issues a status report.",
"A notification sent when a device command has completed."
],
"items": {
"enum": [
"NOTIFICATION_TYPE_UNSPECIFIED",
"ENROLLMENT",
"COMPLIANCE_REPORT",
"STATUS_REPORT",
"COMMAND"
],
"type": "string"
},
"type": "array"
},
"enterpriseDisplayName": {
"description": "The name of the enterprise displayed to users.",
"type": "string"
},
"appAutoApprovalEnabled": {
"description": "Deprecated and unused.",
"type": "boolean"
},
"pubsubTopic": {
"description": "The topic that Cloud Pub/Sub notifications are published to, in the form projects/{project}/topics/{topic}. This field is only required if Pub/Sub notifications are enabled.",
"type": "string"
},
"logo": {
"$ref": "ExternalData",
"description": "An image displayed as a logo during device provisioning. Supported types are: image/bmp, image/gif, image/x-ico, image/jpeg, image/png, image/webp, image/vnd.wap.wbmp, image/x-adobe-dng."
}
},
"type": "object"
},
"BlockAction": {
"description": "An action to block access to apps and data on a fully managed device or in a work profile. This action also triggers a device or work profile to displays a user-facing notification with information (where possible) on how to correct the compliance issue. Note: wipeAction must also be specified.",
"id": "BlockAction",
"properties": {
"blockAfterDays": {
"description": "Number of days the policy is non-compliant before the device or work profile is blocked. To block access immediately, set to 0. blockAfterDays must be less than wipeAfterDays.",
"format": "int32",
"type": "integer"
}
},
"type": "object"
},
"User": {
"description": "A user belonging to an enterprise.",
"id": "User",
"properties": {
"accountIdentifier": {
"description": "A unique identifier you create for this user, such as user342 or asset#44418. This field must be set when the user is created and can't be updated. This field must not contain personally identifiable information (PII). This identifier must be 1024 characters or less; otherwise, the update policy request will fail.",
"type": "string"
}
},
"type": "object"
},
"Device": {
"description": "A device owned by an enterprise. Unless otherwise noted, all fields are read-only and can't be modified by enterprises.devices.patch.",
"id": "Device",
"properties": {
"memoryInfo": {
"$ref": "MemoryInfo",
"description": "Memory information. This information is only available if memoryInfoEnabled is true in the device's policy."
},
"memoryEvents": {
"description": "Events related to memory and storage measurements in chronological order. This information is only available if memoryInfoEnabled is true in the device's policy.",
"items": {
"$ref": "MemoryEvent"
},
"type": "array"
},
"systemProperties": {
"additionalProperties": {
"type": "string"
},
"description": "Map of selected system properties name and value related to the device.",
"type": "object"
},
"appliedPolicyName": {
"description": "The name of the policy currently applied to the device.",
"type": "string"
},
"appliedState": {
"description": "The state currently applied to the device.",
"enum": [
"DEVICE_STATE_UNSPECIFIED",
"ACTIVE",
"DISABLED",
"DELETED",
"PROVISIONING"
],
"enumDescriptions": [
"This value is disallowed.",
"The device is active.",
"The device is disabled.",
"The device was deleted. This state will never be returned by an API call, but is used in the final status report published to Cloud Pub/Sub when the device acknowledges the deletion.",
"The device is being provisioned. Newly enrolled devices are in this state until they have a policy applied."
],
"type": "string"
},
"hardwareStatusSamples": {
"description": "Hardware status samples in chronological order. This information is only available if hardwareStatusEnabled is true in the device's policy.",
"items": {
"$ref": "HardwareStatus"
},
"type": "array"
},
"lastPolicySyncTime": {
"description": "The last time the device fetched its policy.",
"format": "google-datetime",
"type": "string"
},
"policyName": {
"description": "The name of the policy applied to the device, in the form enterprises/{enterpriseId}/policies/{policyId}. If not specified, the policy_name for the device's user is applied. This field can be modified by a patch request. You can specify only the policyId when calling enterprises.devices.patch, as long as the policyId doesn’t contain any slashes. The rest of the policy name is inferred.",
"type": "string"
},
"powerManagementEvents": {
"description": "Power management events on the device in chronological order. This information is only available if powerManagementEventsEnabled is true in the device's policy.",
"items": {
"$ref": "PowerManagementEvent"
},
"type": "array"
},
"name": {
"description": "The name of the device in the form enterprises/{enterpriseId}/devices/{deviceId}.",
"type": "string"
},
"enrollmentTokenName": {
"description": "If the device was enrolled with an enrollment token, this field contains the name of the token.",
"type": "string"
},
"lastPolicyComplianceReportTime": {
"description": "Deprecated.",
"format": "google-datetime",
"type": "string"
},
"enrollmentTokenData": {
"description": "If the device was enrolled with an enrollment token with additional data provided, this field contains that data.",
"type": "string"
},
"managementMode": {
"description": "The type of management mode Android Device Policy takes on the device. This influences which policy settings are supported.",
"enum": [
"MANAGEMENT_MODE_UNSPECIFIED",
"DEVICE_OWNER",
"PROFILE_OWNER"
],
"enumDescriptions": [
"This value is disallowed.",
"Device owner. Android Device Policy has full control over the device.",
"Profile owner. Android Device Policy has control over a managed profile on the device."
],
"type": "string"
},
"nonComplianceDetails": {
"description": "Details about policy settings that the device is not compliant with.",
"items": {
"$ref": "NonComplianceDetail"
},
"type": "array"
},
"user": {
"$ref": "User",
"description": "The user who owns the device."
},
"previousDeviceNames": {
"description": "If the same physical device has been enrolled multiple times, this field contains its previous device names. The serial number is used as the unique identifier to determine if the same physical device has enrolled previously. The names are in chronological order.",
"items": {
"type": "string"
},
"type": "array"
},
"lastStatusReportTime": {
"description": "The last time the device sent a status report.",
"format": "google-datetime",
"type": "string"
},
"policyCompliant": {
"description": "Whether the device is compliant with its policy.",
"type": "boolean"
},
"deviceSettings": {
"$ref": "DeviceSettings",
"description": "Device settings information. This information is only available if deviceSettingsEnabled is true in the device's policy."
},
"state": {
"description": "The state to be applied to the device. This field can be modified by a patch request. Note that when calling enterprises.devices.patch, ACTIVE and DISABLED are the only allowable values. To enter the device into a DELETED state, call enterprises.devices.delete.",
"enum": [
"DEVICE_STATE_UNSPECIFIED",
"ACTIVE",
"DISABLED",
"DELETED",
"PROVISIONING"
],
"enumDescriptions": [
"This value is disallowed.",
"The device is active.",
"The device is disabled.",
"The device was deleted. This state will never be returned by an API call, but is used in the final status report published to Cloud Pub/Sub when the device acknowledges the deletion.",
"The device is being provisioned. Newly enrolled devices are in this state until they have a policy applied."
],
"type": "string"
},
"enrollmentTime": {
"description": "The time of device enrollment.",
"format": "google-datetime",
"type": "string"
},
"disabledReason": {
"$ref": "UserFacingMessage",
"description": "If the device state is DISABLED, an optional message that is displayed on the device indicating the reason the device is disabled. This field can be modified by a patch request."
},
"softwareInfo": {
"$ref": "SoftwareInfo",
"description": "Detailed information about the device software. This information is only available if softwareInfoEnabled is true in the device's policy."
},
"hardwareInfo": {
"$ref": "HardwareInfo",
"description": "Detailed information about the device hardware."
},
"appliedPolicyVersion": {
"description": "The version of the policy currently applied to the device.",
"format": "int64",
"type": "string"
},
"displays": {
"description": "Detailed information about displays on the device. This information is only available if displayInfoEnabled is true in the device's policy.",
"items": {
"$ref": "Display"
},
"type": "array"
},
"applicationReports": {
"description": "Reports for apps installed on the device. This information is only available when application_reports_enabled is true in the device's policy.",
"items": {
"$ref": "ApplicationReport"
},
"type": "array"
},
"apiLevel": {
"description": "The API level of the Android platform version running on the device.",
"format": "int32",
"type": "integer"
},
"userName": {
"description": "The resource name of the user that owns this device in the form enterprises/{enterpriseId}/users/{userId}.",
"type": "string"
},
"networkInfo": {
"$ref": "NetworkInfo",
"description": "Device network information. This information is only available if networkInfoEnabled is true in the device's policy."
}
},
"type": "object"
},
"KeyedAppState": {
"description": "Keyed app state reported by the app.",
"id": "KeyedAppState",
"properties": {
"lastUpdateTime": {
"description": "The time the app state was most recently updated.",
"format": "google-datetime",
"type": "string"
},
"data": {
"description": "Optionally, a machine-readable value to be read by the EMM. For example, setting values that the admin can choose to query against in the EMM console (e.g. “notify me if the battery_warning data < 10”).",
"type": "string"
},
"key": {
"description": "The key for the app state. Acts as a point of reference for what the app is providing state for. For example, when providing managed configuration feedback, this key could be the managed configuration key.",
"type": "string"
},
"message": {
"description": "Optionally, a free-form message string to explain the app state. If the state was triggered by a particular value (e.g. a managed configuration value), it should be included in the message.",
"type": "string"
},
"createTime": {
"description": "The creation time of the app state on the device.",
"format": "google-datetime",
"type": "string"
},
"severity": {
"description": "The severity of the app state.",
"enum": [
"SEVERITY_UNSPECIFIED",
"INFO",
"ERROR"
],
"enumDescriptions": [
"Unspecified severity level.",
"Information severity level.",
"Error severity level. This should only be set for genuine error conditions that a management organization needs to take action to fix."
],
"type": "string"
}
},
"type": "object"
},
"ComplianceRule": {
"description": "A rule declaring which mitigating actions to take when a device is not compliant with its policy. For every rule, there is always an implicit mitigating action to set policy_compliant to false for the Device resource, and display a message on the device indicating that the device is not compliant with its policy. Other mitigating actions may optionally be taken as well, depending on the field values in the rule.",
"id": "ComplianceRule",
"properties": {
"apiLevelCondition": {
"$ref": "ApiLevelCondition",
"description": "A condition which is satisfied if the Android Framework API level on the device doesn't meet a minimum requirement."
},
"nonComplianceDetailCondition": {
"$ref": "NonComplianceDetailCondition",
"description": "A condition which is satisfied if there exists any matching NonComplianceDetail for the device."
},
"packageNamesToDisable": {
"description": "If set, the rule includes a mitigating action to disable apps specified in the list, but app data is preserved.",
"items": {
"type": "string"
},
"type": "array"
},
"disableApps": {
"description": "If set to true, the rule includes a mitigating action to disable apps so that the device is effectively disabled, but app data is preserved. If the device is running an app in locked task mode, the app will be closed and a UI showing the reason for non-compliance will be displayed.",
"type": "boolean"
}
},
"type": "object"
},
"ListPoliciesResponse": {
"description": "Response to a request to list policies for a given enterprise.",
"id": "ListPoliciesResponse",
"properties": {
"nextPageToken": {
"description": "If there are more results, a token to retrieve next page of results.",
"type": "string"
},
"policies": {
"description": "The list of policies.",
"items": {
"$ref": "Policy"
},
"type": "array"
}
},
"type": "object"
},
"ApplicationEvent": {
"description": "An app-related event.",
"id": "ApplicationEvent",
"properties": {
"eventType": {
"description": "App event type.",
"enum": [
"APPLICATION_EVENT_TYPE_UNSPECIFIED",
"INSTALLED",
"CHANGED",
"DATA_CLEARED",
"REMOVED",
"REPLACED",
"RESTARTED",
"PINNED",
"UNPINNED"
],
"enumDescriptions": [
"This value is disallowed.",
"The app was installed.",
"The app was changed, for example, a component was enabled or disabled.",
"The app data was cleared.",
"The app was removed.",
"A new version of the app has been installed, replacing the old version.",
"The app was restarted.",
"The app was pinned to the foreground.",
"The app was unpinned."
],
"type": "string"
},
"createTime": {
"description": "The creation time of the event.",
"format": "google-datetime",
"type": "string"
}
},
"type": "object"
},
"PackageNameList": {
"description": "A list of package names.",
"id": "PackageNameList",
"properties": {
"packageNames": {
"description": "A list of package names.",
"items": {
"type": "string"
},
"type": "array"
}
},
"type": "object"
},
"PersistentPreferredActivity": {
"description": "A default activity for handling intents that match a particular intent filter.",
"id": "PersistentPreferredActivity",
"properties": {
"categories": {
"description": "The intent categories to match in the filter. An intent includes the categories that it requires, all of which must be included in the filter in order to match. In other words, adding a category to the filter has no impact on matching unless that category is specified in the intent.",
"items": {
"type": "string"
},
"type": "array"
},
"receiverActivity": {
"description": "The activity that should be the default intent handler. This should be an Android component name, e.g. com.android.enterprise.app/.MainActivity. Alternatively, the value may be the package name of an app, which causes Android Device Policy to choose an appropriate activity from the app to handle the intent.",
"type": "string"
},
"actions": {
"description": "The intent actions to match in the filter. If any actions are included in the filter, then an intent's action must be one of those values for it to match. If no actions are included, the intent action is ignored.",
"items": {
"type": "string"
},
"type": "array"
}
},
"type": "object"
},
"Application": {
"description": "Information about an app.",
"id": "Application",
"properties": {
"title": {
"description": "The title of the app. Localized.",
"type": "string"
},
"permissions": {
"description": "The permissions required by the app.",
"items": {
"$ref": "ApplicationPermission"
},
"type": "array"
},
"name": {
"description": "The name of the app in the form enterprises/{enterpriseId}/applications/{package_name}.",
"type": "string"
},
"managedProperties": {
"description": "The set of managed properties available to be pre-configured for the app.",
"items": {
"$ref": "ManagedProperty"
},
"type": "array"
}
},
"type": "object"
},
"UserFacingMessage": {
"description": "Provides a user-facing message with locale info. The maximum message length is 4096 characters.",
"id": "UserFacingMessage",
"properties": {
"defaultMessage": {
"description": "The default message displayed if no localized message is specified or the user's locale doesn't match with any of the localized messages. A default message must be provided if any localized messages are provided.",
"type": "string"
},
"localizedMessages": {
"additionalProperties": {
"type": "string"
},
"description": "A map containing <locale, message> pairs, where locale is a well-formed BCP 47 language (https://www.w3.org/International/articles/language-tags/) code, such as en-US, es-ES, or fr.",
"type": "object"
}
},
"type": "object"
},
"Command": {
"description": "A command.",
"id": "Command",
"properties": {
"createTime": {
"description": "The timestamp at which the command was created. The timestamp is automatically generated by the server.",
"format": "google-datetime",
"type": "string"
},
"errorCode": {
"description": "If the command failed, an error code explaining the failure. This is not set when the command is cancelled by the caller.",
"enum": [
"COMMAND_ERROR_CODE_UNSPECIFIED",
"UNKNOWN",
"API_LEVEL",
"MANAGEMENT_MODE",
"INVALID_VALUE",
"UNSUPPORTED"
],
"enumDescriptions": [
"There was no error.",
"An unknown error occurred.",
"The API level of the device does not support this command.",
"The management mode (profile owner, device owner, etc.) does not support the command.",
"The command has an invalid parameter value.",
"The device doesn't support the command. Updating Android Device Policy to the latest version may resolve the issue."
],
"type": "string"
},
"newPassword": {
"description": "For commands of type RESET_PASSWORD, optionally specifies the new password.",
"type": "string"
},
"resetPasswordFlags": {
"description": "For commands of type RESET_PASSWORD, optionally specifies flags.",
"enumDescriptions": [
"This value is ignored.",
"Don't allow other admins to change the password again until the user has entered it.",
"Don't ask for user credentials on device boot.",
"Lock the device after password reset."
],
"items": {
"enum": [
"RESET_PASSWORD_FLAG_UNSPECIFIED",
"REQUIRE_ENTRY",
"DO_NOT_ASK_CREDENTIALS_ON_BOOT",
"LOCK_NOW"
],
"type": "string"
},
"type": "array"
},
"userName": {
"description": "The resource name of the user that owns the device in the form enterprises/{enterpriseId}/users/{userId}. This is automatically generated by the server based on the device the command is sent to.",
"type": "string"
},
"type": {
"description": "The type of the command.",
"enum": [
"COMMAND_TYPE_UNSPECIFIED",
"LOCK",
"RESET_PASSWORD",
"REBOOT"
],
"enumDescriptions": [
"This value is disallowed.",
"Lock the device, as if the lock screen timeout had expired.",
"Reset the user's password.",
"Reboot the device. Only supported on API level 24+."
],
"type": "string"
},
"duration": {
"description": "The duration for which the command is valid. The command will expire if not executed by the device during this time. The default duration if unspecified is ten minutes. There is no maximum duration.",
"format": "google-duration",
"type": "string"
}
},
"type": "object"
},
"HardwareStatus": {
"description": "Hardware status. Temperatures may be compared to the temperature thresholds available in hardwareInfo to determine hardware health.",
"id": "HardwareStatus",
"properties": {
"cpuTemperatures": {
"description": "Current CPU temperatures in Celsius for each CPU on the device.",
"items": {
"format": "float",
"type": "number"
},
"type": "array"
},
"batteryTemperatures": {
"description": "Current battery temperatures in Celsius for each battery on the device.",
"items": {
"format": "float",
"type": "number"
},
"type": "array"
},
"gpuTemperatures": {
"description": "Current GPU temperatures in Celsius for each GPU on the device.",
"items": {
"format": "float",
"type": "number"
},
"type": "array"
},
"createTime": {
"description": "The time the measurements were taken.",
"format": "google-datetime",
"type": "string"
},
"fanSpeeds": {
"description": "Fan speeds in RPM for each fan on the device. Empty array means that there are no fans or fan speed is not supported on the system.",
"items": {
"format": "float",
"type": "number"
},
"type": "array"
},
"cpuUsages": {
"description": "CPU usages in percentage for each core available on the device. Usage is 0 for each unplugged core. Empty array implies that CPU usage is not supported in the system.",
"items": {
"format": "float",
"type": "number"
},
"type": "array"
},
"skinTemperatures": {
"description": "Current device skin temperatures in Celsius.",
"items": {
"format": "float",
"type": "number"
},
"type": "array"
}
},
"type": "object"
},
"SigninDetail": {
"description": "A resource containing sign in details for an enterprise.",
"id": "SigninDetail",
"properties": {
"signinEnrollmentToken": {
"description": "An enterprise wide enrollment token used to trigger custom sign-in flow. This is a read-only field generated by the server.",
"type": "string"
},
"qrCode": {
"description": "A JSON string whose UTF-8 representation can be used to generate a QR code to enroll a device with this enrollment token. To enroll a device using NFC, the NFC record must contain a serialized java.util.Properties representation of the properties in the JSON. This is a read-only field generated by the server.",
"type": "string"
},
"signinUrl": {
"description": "Sign-in URL for authentication when device is provisioned with a sign-in enrollment token. The sign-in endpoint should finish authentication flow with a URL in the form of https://enterprise.google.com/android/enroll?et=<token> for a successful login, or https://enterprise.google.com/android/enroll/invalid for a failed login.",
"type": "string"
}
},
"type": "object"
},
"WipeAction": {
"description": "An action to reset a fully managed device or delete a work profile. Note: blockAction must also be specified.",
"id": "WipeAction",
"properties": {
"preserveFrp": {
"description": "Whether the factory-reset protection data is preserved on the device. This setting doesn’t apply to work profiles.",
"type": "boolean"
},
"wipeAfterDays": {
"description": "Number of days the policy is non-compliant before the device or work profile is wiped. wipeAfterDays must be greater than blockAfterDays.",
"format": "int32",
"type": "integer"
}
},
"type": "object"
},
"WebAppIcon": {
"description": "An icon for a web app. Supported formats are: png, jpg and webp.",
"id": "WebAppIcon",
"properties": {
"imageData": {
"description": "The actual bytes of the image in a base64url encoded string (c.f. RFC4648, section 5 \"Base 64 Encoding with URL and Filename Safe Alphabet\"). <ul> <li>The image type can be png or jpg. <li>The image should ideally be square. <li>The image should ideally have a size of 512x512. </ul>",
"type": "string"
}
},
"type": "object"
},
"ApiLevelCondition": {
"description": "A compliance rule condition which is satisfied if the Android Framework API level on the device doesn't meet a minimum requirement. There can only be one rule with this type of condition per policy.",
"id": "ApiLevelCondition",
"properties": {
"minApiLevel": {
"description": "The minimum desired Android Framework API level. If the device doesn't meet the minimum requirement, this condition is satisfied. Must be greater than zero.",
"format": "int32",
"type": "integer"
}
},
"type": "object"
},
"ChoosePrivateKeyRule": {
"description": "A rule for automatically choosing a private key and certificate to authenticate the device to a server.",
"id": "ChoosePrivateKeyRule",
"properties": {
"privateKeyAlias": {
"description": "The alias of the private key to be used.",
"type": "string"
},
"packageNames": {
"description": "The package names for which outgoing requests are subject to this rule. If no package names are specified, then the rule applies to all packages. For each package name listed, the rule applies to that package and all other packages that shared the same Android UID. The SHA256 hash of the signing key signatures of each package_name will be verified against those provided by Play",
"items": {
"type": "string"
},
"type": "array"
},
"urlPattern": {
"description": "The URL pattern to match against the URL of the outgoing request. The pattern may contain asterisk (*) wildcards. Any URL is matched if unspecified.",
"type": "string"
}
},
"type": "object"
},
"SoftwareInfo": {
"description": "Information about device software.",
"id": "SoftwareInfo",
"properties": {
"androidBuildNumber": {
"description": "Android build ID string meant for displaying to the user. For example, shamu-userdebug 6.0.1 MOB30I 2756745 dev-keys.",
"type": "string"
},
"androidVersion": {
"description": "The user-visible Android version string. For example, 6.0.1.",
"type": "string"
},
"primaryLanguageCode": {
"description": "An IETF BCP 47 language code for the primary locale on the device.",
"type": "string"
},
"deviceBuildSignature": {
"description": "SHA-256 hash of android.content.pm.Signature (https://developer.android.com/reference/android/content/pm/Signature.html) associated with the system package, which can be used to verify that the system build hasn't been modified.",
"type": "string"
},
"androidDevicePolicyVersionName": {
"description": "The Android Device Policy app version as displayed to the user.",
"type": "string"
},
"bootloaderVersion": {
"description": "The system bootloader version number, e.g. 0.6.7.",
"type": "string"
},
"androidDevicePolicyVersionCode": {
"description": "The Android Device Policy app version code.",
"format": "int32",
"type": "integer"
},
"deviceKernelVersion": {
"description": "Kernel version, for example, 2.6.32.9-g103d848.",
"type": "string"
},
"androidBuildTime": {
"description": "Build time.",
"format": "google-datetime",
"type": "string"
},
"securityPatchLevel": {
"description": "Security patch level, e.g. 2016-05-01.",
"type": "string"
}
},
"type": "object"
},
"ListDevicesResponse": {
"description": "Response to a request to list devices for a given enterprise.",
"id": "ListDevicesResponse",
"properties": {
"devices": {
"description": "The list of devices.",
"items": {
"$ref": "Device"
},
"type": "array"
},
"nextPageToken": {
"description": "If there are more results, a token to retrieve next page of results.",
"type": "string"
}
},
"type": "object"
},
"LaunchAppAction": {
"description": "An action to launch an app.",
"id": "LaunchAppAction",
"properties": {
"packageName": {
"description": "Package name of app to be launched",
"type": "string"
}
},
"type": "object"
},
"ProxyInfo": {
"description": "Configuration info for an HTTP proxy. For a direct proxy, set the host, port, and excluded_hosts fields. For a PAC script proxy, set the pac_uri field.",
"id": "ProxyInfo",
"properties": {
"pacUri": {
"description": "The URI of the PAC script used to configure the proxy.",
"type": "string"
},
"port": {
"description": "The port of the direct proxy.",
"format": "int32",
"type": "integer"
},
"host": {
"description": "The host of the direct proxy.",
"type": "string"
},
"excludedHosts": {
"description": "For a direct proxy, the hosts for which the proxy is bypassed. The host names may contain wildcards such as *.example.com.",
"items": {
"type": "string"
},
"type": "array"
}
},
"type": "object"
},
"PasswordRequirements": {
"description": "Requirements for the password used to unlock a device.",
"id": "PasswordRequirements",
"properties": {
"passwordMinimumNonLetter": {
"description": "Minimum number of non-letter characters (numerical digits or symbols) required in the password. Only enforced when password_quality is COMPLEX.",
"format": "int32",
"type": "integer"
},
"passwordHistoryLength": {
"description": "The length of the password history. After setting this field, the user won't be able to enter a new password that is the same as any password in the history. A value of 0 means there is no restriction.",
"format": "int32",
"type": "integer"
},
"passwordQuality": {
"description": "The required password quality.",
"enum": [
"PASSWORD_QUALITY_UNSPECIFIED",
"BIOMETRIC_WEAK",
"SOMETHING",
"NUMERIC",
"NUMERIC_COMPLEX",
"ALPHABETIC",
"ALPHANUMERIC",
"COMPLEX"
],
"enumDescriptions": [
"There are no password requirements.",
"The device must be secured with a low-security biometric recognition technology, at minimum. This includes technologies that can recognize the identity of an individual that are roughly equivalent to a 3-digit PIN (false detection is less than 1 in 1,000).",
"A password is required, but there are no restrictions on what the password must contain.",
"The password must contain numeric characters.",
"The password must contain numeric characters with no repeating (4444) or ordered (1234, 4321, 2468) sequences.",
"The password must contain alphabetic (or symbol) characters.",
"The password must contain both numeric and alphabetic (or symbol) characters.",
"The password must contain at least a letter, a numerical digit and a special symbol. Other password constraints, for example, password_minimum_letters are enforced."
],
"type": "string"
},
"maximumFailedPasswordsForWipe": {
"description": "Number of incorrect device-unlock passwords that can be entered before a device is wiped. A value of 0 means there is no restriction.",
"format": "int32",
"type": "integer"
},
"passwordScope": {
"description": "The scope that the password requirement applies to.",
"enum": [
"SCOPE_UNSPECIFIED",
"SCOPE_DEVICE",
"SCOPE_PROFILE"
],
"enumDescriptions": [
"The scope is unspecified. The password requirements are applied to the work profile for work profile devices and the whole device for fully managed or dedicated devices.",
"The password requirements are only applied to the device.",
"The password requirements are only applied to the work profile."
],
"type": "string"
},
"passwordMinimumNumeric": {
"description": "Minimum number of numerical digits required in the password. Only enforced when password_quality is COMPLEX.",
"format": "int32",
"type": "integer"
},
"passwordMinimumSymbols": {
"description": "Minimum number of symbols required in the password. Only enforced when password_quality is COMPLEX.",
"format": "int32",
"type": "integer"
},
"passwordMinimumLetters": {
"description": "Minimum number of letters required in the password. Only enforced when password_quality is COMPLEX.",
"format": "int32",
"type": "integer"
},
"passwordMinimumLowerCase": {
"description": "Minimum number of lower case letters required in the password. Only enforced when password_quality is COMPLEX.",
"format": "int32",
"type": "integer"
},
"passwordMinimumLength": {
"description": "The minimum allowed password length. A value of 0 means there is no restriction. Only enforced when password_quality is NUMERIC, NUMERIC_COMPLEX, ALPHABETIC, ALPHANUMERIC, or COMPLEX.",
"format": "int32",
"type": "integer"
},
"passwordExpirationTimeout": {
"description": "Password expiration timeout.",
"format": "google-duration",
"type": "string"
},
"passwordMinimumUpperCase": {
"description": "Minimum number of upper case letters required in the password. Only enforced when password_quality is COMPLEX.",
"format": "int32",
"type": "integer"
}
},
"type": "object"
},
"SignupUrl": {
"description": "An enterprise signup URL.",
"id": "SignupUrl",
"properties": {
"name": {
"description": "The name of the resource. Use this value in the signupUrl field when calling enterprises.create to complete the enterprise signup flow.",
"type": "string"
},
"url": {
"description": "A URL where an enterprise admin can register their enterprise. The page can't be rendered in an iframe.",
"type": "string"
}
},
"type": "object"
},
"NonComplianceDetail": {
"description": "Provides detail about non-compliance with a policy setting.",
"id": "NonComplianceDetail",
"properties": {
"settingName": {
"description": "The name of the policy setting. This is the JSON field name of a top-level Policy  field.",
"type": "string"
},
"nonComplianceReason": {
"description": "The reason the device is not in compliance with the setting.",
"enum": [
"NON_COMPLIANCE_REASON_UNSPECIFIED",
"API_LEVEL",
"MANAGEMENT_MODE",
"USER_ACTION",
"INVALID_VALUE",
"APP_NOT_INSTALLED",
"UNSUPPORTED",
"APP_INSTALLED",
"PENDING",
"APP_INCOMPATIBLE",
"APP_NOT_UPDATED"
],
"enumDescriptions": [
"This value is disallowed.",
"The setting is not supported in the API level of the Android version running on the device.",
"The management mode (profile owner, device owner, etc.) doesn't support the setting.",
"The user has not taken required action to comply with the setting.",
"The setting has an invalid value.",
"The app required to implement the policy is not installed.",
"The policy is not supported by the version of Android Device Policy on the device.",
"A blocked app is installed.",
"The setting hasn't been applied at the time of the report, but is expected to be applied shortly.",
"The setting can't be applied to the app because the app doesn't support it, for example because its target SDK version is not high enough.",
"The app is installed, but it hasn't been updated to the minimum version code specified by policy."
],
"type": "string"
},
"installationFailureReason": {
"description": "If package_name is set and the non-compliance reason is APP_NOT_INSTALLED or APP_NOT_UPDATED, the detailed reason the app can't be installed or updated.",
"enum": [
"INSTALLATION_FAILURE_REASON_UNSPECIFIED",
"INSTALLATION_FAILURE_REASON_UNKNOWN",
"IN_PROGRESS",
"NOT_FOUND",
"NOT_COMPATIBLE_WITH_DEVICE",
"NOT_APPROVED",
"PERMISSIONS_NOT_ACCEPTED",
"NOT_AVAILABLE_IN_COUNTRY",
"NO_LICENSES_REMAINING",
"NOT_ENROLLED",
"USER_INVALID"
],
"enumDescriptions": [
"This value is disallowed.",
"An unknown condition is preventing the app from being installed. Some potential reasons are that the device doesn't have enough storage, the device network connection is unreliable, or the installation is taking longer than expected. The installation will be retried automatically.",
"The installation is still in progress.",
"The app was not found in Play.",
"The app is incompatible with the device.",
"The app has not been approved by the admin.",
"The app has new permissions that have not been accepted by the admin.",
"The app is not available in the user's country.",
"There are no licenses available to assign to the user.",
"The enterprise is no longer enrolled with managed Play or the admin has not accepted the latest managed Play terms of service.",
"The user is no longer valid. The user may have been deleted or disabled."
],
"type": "string"
},
"packageName": {
"description": "The package name indicating which app is out of compliance, if applicable.",
"type": "string"
},
"currentValue": {
"description": "If the policy setting could not be applied, the current value of the setting on the device.",
"type": "any"
},
"fieldPath": {
"description": "For settings with nested fields, if a particular nested field is out of compliance, this specifies the full path to the offending field. The path is formatted in the same way the policy JSON field would be referenced in JavaScript, that is: 1) For object-typed fields, the field name is followed by a dot then by a  subfield name. 2) For array-typed fields, the field name is followed by the array index  enclosed in brackets. For example, to indicate a problem with the url field in the externalData field in the 3rd application, the path would be applications[2].externalData.url",
"type": "string"
}
},
"type": "object"
},
"HardwareInfo": {
"description": "Information about device hardware. The fields related to temperature thresholds are only available if hardwareStatusEnabled is true in the device's policy.",
"id": "HardwareInfo",
"properties": {
"batteryShutdownTemperatures": {
"description": "Battery shutdown temperature thresholds in Celsius for each battery on the device.",
"items": {
"format": "float",
"type": "number"
},
"type": "array"
},
"skinShutdownTemperatures": {
"description": "Device skin shutdown temperature thresholds in Celsius.",
"items": {
"format": "float",
"type": "number"
},
"type": "array"
},
"model": {
"description": "The model of the device. For example, Asus Nexus 7.",
"type": "string"
},
"cpuShutdownTemperatures": {
"description": "CPU shutdown temperature thresholds in Celsius for each CPU on the device.",
"items": {
"format": "float",
"type": "number"
},
"type": "array"
},
"skinThrottlingTemperatures": {
"description": "Device skin throttling temperature thresholds in Celsius.",
"items": {
"format": "float",
"type": "number"
},
"type": "array"
},
"hardware": {
"description": "Name of the hardware. For example, Angler.",
"type": "string"
},
"cpuThrottlingTemperatures": {
"description": "CPU throttling temperature thresholds in Celsius for each CPU on the device.",
"items": {
"format": "float",
"type": "number"
},
"type": "array"
},
"gpuShutdownTemperatures": {
"description": "GPU shutdown temperature thresholds in Celsius for each GPU on the device.",
"items": {
"format": "float",
"type": "number"
},
"type": "array"
},
"gpuThrottlingTemperatures": {
"description": "GPU throttling temperature thresholds in Celsius for each GPU on the device.",
"items": {
"format": "float",
"type": "number"
},
"type": "array"
},
"batteryThrottlingTemperatures": {
"description": "Battery throttling temperature thresholds in Celsius for each battery on the device.",
"items": {
"format": "float",
"type": "number"
},
"type": "array"
},
"manufacturer": {
"description": "Manufacturer. For example, Motorola.",
"type": "string"
},
"serialNumber": {
"description": "The device serial number.",
"type": "string"
},
"brand": {
"description": "Brand of the device. For example, Google.",
"type": "string"
},
"deviceBasebandVersion": {
"description": "Baseband version. For example, MDM9625_104662.22.05.34p.",
"type": "string"
}
},
"type": "object"
},
"ManagedProperty": {
"description": "Managed property.",
"id": "ManagedProperty",
"properties": {
"defaultValue": {
"description": "The default value of the property. BUNDLE_ARRAY properties don't have a default value.",
"type": "any"
},
"nestedProperties": {
"description": "For BUNDLE_ARRAY properties, the list of nested properties. A BUNDLE_ARRAY property is at most two levels deep.",
"items": {
"$ref": "ManagedProperty"
},
"type": "array"
},
"type": {
"description": "The type of the property.",
"enum": [
"MANAGED_PROPERTY_TYPE_UNSPECIFIED",
"BOOL",
"STRING",
"INTEGER",
"CHOICE",
"MULTISELECT",
"HIDDEN",
"BUNDLE_ARRAY"
],
"enumDescriptions": [
"Not used.",
"A property of boolean type.",
"A property of string type.",
"A property of integer type.",
"A choice of one item from a set.",
"A choice of multiple items from a set.",
"A hidden restriction of string type (the default value can be used to pass along information that can't be modified, such as a version code).",
"An array of property bundles."
],
"type": "string"
},
"title": {
"description": "The name of the property. Localized.",
"type": "string"
},
"key": {
"description": "The unique key that the app uses to identify the property, e.g. \"com.google.android.gm.fieldname\".",
"type": "string"
},
"description": {
"description": "A longer description of the property, providing more detail of what it affects. Localized.",
"type": "string"
},
"entries": {
"description": "For CHOICE or MULTISELECT properties, the list of possible entries.",
"items": {
"$ref": "ManagedPropertyEntry"
},
"type": "array"
}
},
"type": "object"
}
},
"servicePath": "",
"title": "Android Management API",
"version": "v1",
"version_module": true
}