# TightIosSDK

## Minimum iOS Deployment Version

The Tight SDK supports a minimum iOS deployment version of `iOS 17.0`. Your app must target an iOS version greater than or equal to this version in order to use the Tight SDK. 

## Setup

### Package Installation with Swift Package Manager

The Tight SDK makes use of Swift Package Manager to enable a quick and easy integration pathway for iOS applications. Follow the steps below to install the Tight SDK using Swift Package Manager:

1. From within XCode, navigate to: `File > Add Package Dependencies`  
2. Enter the following package URL in the search field: `https://github.com/Hurdlr/TightIosSDK.git`  
3. TBD: For Dependency Rule, specify the release branch you would like to use  
4. Add the package to your target

### Info.plist Configuration

In addition to installing the package with Swift Package Manager, you must also add the following to your app's info.plist file so that your app can request the necessary permissions from the user when they turn on mileage tracking, while complying with Apple's guidelines:

```
<key>NSLocationAlwaysAndWhenInUseUsageDescription</key>
<string>YOUR_APP_NAME uses Tight to collect and transmit location data, which is used solely for drive detection and mileage tracking. 

For automatic drive detection and mileage tracking, please select "Always Allow".</string>

<key>NSLocationAlwaysUsageDescription</key>
<string>YOUR_APP_NAME uses Tight to collect and transmit location data, which is used solely for drive detection and mileage tracking.

For automatic drive detection and mileage tracking, please select "Always Allow".</string>

<key>NSLocationUsageDescription</key>
<string>YOUR_APP_NAME uses Tight to collect and transmit location data, which is used solely for drive detection and mileage tracking.

For automatic drive detection and mileage tracking, please select "Allow While Using App".
</string>

<key>NSLocationWhenInUseUsageDescription</key>
<string>YOUR_APP_NAME uses Tight to collect and transmit location data, which is used solely for drive detection and mileage tracking.

For automatic drive detection and mileage tracking, please select "Allow While Using App".</string>

<key>NSMotionUsageDescription</key>
<string>YOUR_APP_NAME uses Tight to collect and transmit motion data, which is used solely for drive detection and mileage tracking.

For automatic drive detection and mileage tracking, please select “Allow”.
</string>

<key>UIBackgroundModes</key>
<array>
    <string>location</string>
</array>
```

## Functions

### initialize(`accessToken` : `String`) async throws 

Initializes the Tight SDK with an appropriate accessToken. This function may throw the following errors:

- `InvalidAccessTokenError` \- if the accessToken is invalid   
- `NetworkConnectivityError` \- if there are network connection issues

Example usage:

```
let tightManager = TightSDK.SDK.manager
let sampleAccessToken = "sample_access_token"
do {
try tightManager.initialize(accessToken: sampleAccessToken)
catch let error as InvalidAccessTokenError {
	// handle InvalidAccessTokenError
} catch let error as NetworkConnectivityError {
	// handle NetworkConnectivityError. Generally you should retry initialization in this case
} catch {
	// unknown error caught
}
```

### isSetup() \-\> `Bool`

Returns a `Bool` indicating if the Tight SDK has been properly initialized

### teardown()

Resets the Tight SDK to its default state prior to initialization

### hasDelegate() \-\> `Bool`

Returns a `Bool` indicating whether a `TightDelegate` has been registered

### setTightDelegate(`delegate`: `TightDelegate`?)

Sets the `TightDelegate` used to notify the consumer when drive and permission events occur. This function should be called once every time the app launches

### requestInitialMileagePermissions(`viewController`: `UIViewController`)

Requests initial mileage permissions for the app. This function should be called while onboarding users, and will result in all necessary mileage-related permissions being requested from the user

### requestMileagePermissions(`viewController`: `UIViewController`)

Requests the user to navigate to settings and enable necessary permissions if they have not done so already. Note this function should be called only after the `requestInitialMileagePermissions` function has been called

### getMileagePermissions() \-\> `Permissions`

Returns a `Permissions` object indicating the permission authorization granted by the user

### getMileageDetectionMode() \-\> `MileageDetectionMode`

Returns a `MileageDetectionMode` enum representing the current detection mode

### setMileageDetectionMode(`mileageDetectionMode`: `MileageDetectionMode`) throws

Sets the mileage detection mode. Throws an `InadequateMileagePermissionsError` if the user hasn’t granted required mileage permissions  
Example usage:

```
let tightManager = TightSDK.SDK.manager
do { 
try tightManager.setMileageDetectionMode(mileageDetectionMode: MileageDetectionMode.AUTO)
} catch let error as InadequateMileagePermissionsError {
	// handle InadequateMileagePermissionsError
}
```

### startSemiAutoDrive() throws

Starts a semi-auto drive. Throws an `InadequateMileagePermissionsError` if the user hasn’t granted required mileage permissions

Example usage:

```
let tightManager = TightSDK.SDK.manager
do { 
try tightManager.startSemiAutoDrive()
} catch let error as InadequateMileagePermissionsError {
	// handle InadequateMileagePermissionsError
}
```

### stopDrive()

Stops the current drive manually

### getCurrentDrive() \-\> `CurrentDrive?`

Returns a `CurrentDrive?` object representing the current ongoing drive

### getTightMapView(`mileageId`: `UInt`) async \-\> `UIView`

Returns a `UIView` representing the TightMap embeddable component

### uploadDebugLogs()

Uploads debug logs to Tight for debugging purposes

## Enums

### MileageDetectionMode

One of `OFF` or `AUTO`

- `AUTO` \- Uses Tight's automatic mileage detection algorithms to track mileage routes and distance  
- `OFF` \- The user must manually start and stop mileage tracking

### LocationAccess

One of `DISABLED`, `IN_APP_ONLY`, `ALWAYS`, `RESTRICTED`, or `UNKNOWN`

- `DISABLED` \- The user explicitly denied location access authorization. Can also indicate that the app was restricted externally, such as by parental controls  
- `IN_APP_ONLY` \- Location access has only been authorized when the user is using the app  
- `ALWAYS` \- Location access has been granted for use anytime  
- `RESTRICTED` \- Location access is restricted by the os and cannot be turned on by the user  
- `UNKNOWN` \- Location access authorization has not been requested from the user

### MotionActivityAccess

One of `UNKNOWN`, `DISABLED`, `ENABLED`, `RESTRICTED`, or `UNKNOWN`

- `DISABLED` \- The user explicitly denied motion activity access authorization. Can also indicate that the app was restricted externally, such as by parental controls  
- `ENABLED` \- Motion activity access has been granted  
- `RESTRICTED` \- Motion activity access is restricted by the os and cannot be turned on by the user  
- `UNKNOWN` \- Motion activity access authorization has not been requested from the user

### PreciseLocationAccess

One of `DISABLED`,  `ENABLED`, or `UNKNOWN`

- `DISABLED` \- Approximate location access has been granted for use anytime  
- `ENABLED` \- Precise location access has been granted  
- `UNKNOWN` \- Precise location access authorization has not been requested from the user

### DriveReason

One of `MANUAL` or `AUTOMATIC`

- `MANUAL` \- indicates that the drive was completed or started manually  
- `AUTOMATIC` \- indicates that the drive was completed or started automatically

## Classes, Structures and Protocols

### CurrentDrive

Used to represent information related to the current drive

```
class CurrentDrive {
var route: [Coordinate2D]
var startTime: Date?
var endTime: Date?
var sdkTimestamp: UInt64? //Tight internal usage only
var startAddress: String?
var endAddress: String?
var startReason: DriveReason
var completeReason: DriveReason
func getDistance(inKilometers: Bool?) -> Double
}
```

### Coordinate2D

Represents a single coordinate of a route

```
struct Coordinate2D {
  let longitude: Double
  let latitude: Double
  let timestamp: Long
}
```

### Permissions

Used to represent information related to the status of permissions requested from the user

```
struct Permissions {
    let locationAccess: LocationAccess
    let preciseLocationAccess: PreciseLocationAccess
    let motionActivityAccess: MotionActivityAccess
}
```

### TightDelegate

Delegate protocol that should be implemented to receive drive and permission events 

```
protocol TightDelegate : Codable {
	func didStartDrive(currentDrive: CurrentDrive)
	func didStopDrive(currentDrive: CurrentDrive?)
	func didResumeDrive(currentDrive: CurrentDrive)
	func didMileagePermissionsChange(permissions: Permissions)
}
```

#### didStartDrive(`currentDrive`: `CurrentDrive`)

Called when a drive is started

#### didStopDrive(`currentDrive`: `CurrentDrive?`)

Called when a drive is stopped. `CurrentDrive` will be `nil` if the drive was invalid

#### didResumeDrive(`currentDrive`: `CurrentDrive`)

Called when a drive is resumed. This delegate function is triggered if the user force quits and re-opens the app during an active drive

#### didMileagePermissionsChange(`permissions`: `Permissions`)

Called whenever permissions required for mileage tracking are updated by the user

## Exceptions

### InadequateMileagePermissionsError

Represents an error thrown as a result of inadequate mileage permissions. 

```
class InadequateMileagePermissionsError : Error {
	let permissions : Permissions
}
```

### InvalidAccessTokenError

Represents an error thrown as a result of an invalid access token

```
class InvalidAccessTokenError : Error {}
```

### NetworkConnectivityError

Represents an error thrown as a result of network connectivity issues

```
class NetworkConnectivityError : Error {}
```
