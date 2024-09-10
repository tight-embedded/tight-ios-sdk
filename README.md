# HurdlrIosSDK

## Setup

### Package Installation with Swift Package Manager

The Hurdlr SDK makes use of Swift Package Manager to enable a quick and easy integration pathway for iOS applications.
Follow the steps below to install the Hurdlr SDK using Swift Package Manager:

1. From within XCode, navigate to: `File > Add Package Dependencies`
2. Enter the following package URL in the search field: `https://github.com/Hurdlr/HurdlrIosSDK.git`
3. Specify the version as `1.0.0`
4. Add the package to your target

### Info.plist Configuration

In addition to installing the package with Swift Package Manager, you must also add the following to your app's
info.plist file so that your app can request the necessary permissions from the user when they turn on mileage tracking,
while complying with Apple's guidelines:

```
<key>NSLocationAlwaysAndWhenInUseUsageDescription</key>
<string>YOUR_APP_NAME uses Hurdlr to collect and transmit location data, which is used solely for drive detection and mileage tracking. 

For automatic drive detection and mileage tracking, please select "Always Allow".</string>

<key>NSLocationAlwaysUsageDescription</key>
<string>YOUR_APP_NAME uses Hurdlr to collect and transmit location data, which is used solely for drive detection and mileage tracking. 

For automatic drive detection and mileage tracking, please select "Always Allow".</string>

<key>NSLocationUsageDescription</key>
<string>YOUR_APP_NAME uses Hurdlr to collect and transmit location data, which is used solely for drive detection and mileage tracking. 

For automatic drive detection and mileage tracking, please select "Allow While Using App".</string>

<key>NSLocationWhenInUseUsageDescription</key>
<string>YOUR_APP_NAME uses Hurdlr to collect and transmit location data, which is used solely for drive detection and mileage tracking. 

For automatic drive detection and mileage tracking, please select "Allow While Using App".</string>

<key>NSMotionUsageDescription</key>
<string>YOUR_APP_NAME uses Hurdlr to collect and transmit motion data, which is used solely for drive detection and mileage tracking. 

For automatic drive detection and mileage tracking, please select "OK".</string>

<key>UIBackgroundModes</key>
<array>
    <string>location</string>
</array>
```

## Functions

### getMileageDetectionMode() -> `MileageDetectionMode`

Returns a `MileageDetectionMode` enum representing the current detection mode

### getCurrentDrive() -> `Drive?`

Returns a `Drive?` object representing the current drive

### getMileagePermissions() -> `Permissions`

Returns a `Permissions` object indicating the permission authorization granted by the user

### initialize(`accessToken` : `String`)

Initializes the Hurdlr SDK with an appropriate `accessToken`

Example usage:

```
let hurdlrManager = Hurdlr.SDK.manager
let sampleAccessToken = "sample_access_token"
hurdlrManager.SDK.initialize(accessToken : sampleAccessToken)
```

### isSetup() -> `Bool`

Returns a `Bool` indicating if the Hurdlr SDK has been properly initialized

### logout()

Logs the user out of the Hurdlr SDK

### openAppSettings(`completionHandler` : `((Bool) -> Void)?`)

Opens the native settings screen for the app. This function accepts a completionHandler, which executes on the
successful launch of the settings app

Example usage:

```
let hurdlrManager = Hurdlr.SDK.manager
hurdlrManager.SDK.openAppSettings() { success in
    print("Result of opening app settings: ", success)
}
```

### requestInitialMileagePermissions()

Requests initial mileage permissions for the app. This function should be called while onboarding users, and will result
in all neccessary mileage-related permissions being requested from the user

### requestMileagePermissions(`viewController` : `UIViewController`)

Requests the user to navigate to settings and enable necessary permissions if they have not done so already. Note this
function should be called only after the `requestInitialMileagePermissions` function has been called

Example usage:

```
let hurdlrManager = Hurdlr.SDK.manager
hurdlrManager.SDK.requestMileagePermissions(viewController: self)
```

### setMileageDetectionMode(`mileageDetectionMode` : `MileageDetectionMode`)

Sets the mileage detection mode

### startSemiAutoDrive()

Starts a semi-auto drive

### stopSemiAutoDrive()

Stops a semi-auto drive

## Enums

### LocationAccess

One of `UNKNOWN`, `DISABLED`, `IN_APP_ONLY`, or `ALWAYS`

- `UNKNOWN` - Location access authorization has not been requested from the user
- `DISABLED` - The user explicitly denied location access authorization. Can also indicate that the app was restricted
  externally, such as by parental controls
- `IN_APP_ONLY` - Location access has only been authorized when the user is using the app
- `ALWAYS` - Location access has been granted for use anytime

### MileageDetectionMode

One of `OFF` or `AUTO`

- `AUTO` - Uses Hurdlr's automatic mileage detection algorithms to track mileage routes and distance
- `OFF` - The user must manually start and stop mileage tracking

### MotionActivityAccess

One of `UNKNOWN`, `DISABLED`, or `ENABLED`

- `UNKNOWN` - Motion activity access authorization has not been requested from the user
- `DISABLED` - The user explicitly denied motion activity access authorization. Can also indicate that the app was
  restricted externally, such as by parental controls
- `ALWAYS` - Motion activity access has been granted for use anytime

### PreciseLocationAccess

One of `UNKNOWN`, `DISABLED`, or `ENABLED`

- `UNKNOWN` - Precise location access authorization has not been requested from the user
- `DISABLED` - Approximate location access has been granted for use anytime
- `ALWAYS` - Precise location access has been granted for use anytime

## Classes 

### Drive

Used to represent information related to the current drive

```
class Drive {

}
```

## Structures

### Permissions

Used to represent information related to the status of permissions requested from the user

```
struct Permissions {
    public let locationAccess: LocationAccess
    public let preciseLocationAccess: PreciseLocationAccess
    public let motionActivityAccess: MotionActivityAccess
}
```