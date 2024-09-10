# HurdlrIosSDK

## Setup

### Package Installation with Swift Package Manager

The Hurdlr SDK makes use of Swift Package Manager to enable a quick and easy integration pathway for iOS applications. Follow the steps below to install the Hurdlr SDK using Swift Package Manager:

1. From within XCode, navigate to: `File > Add Package Dependencies`
2. Enter the following package URL in the search field: `https://github.com/Hurdlr/HurdlrIosSDK.git`
3. Specify the version as `1.0.0`
4. Add the package to your target

### Info.plist Configuration

In addition to installing the package with Swift Package Manager, you must also add the following to your app's info.plist file so that your app can request the necessary permissions from the user when they turn on mileage tracking, while complying with Apple's guidelines:

```
<key>NSLocationAlwaysAndWhenInUseUsageDescription</key>
<string>YOUR_APP_NAME uses Hurdlr to collect and transmit location data, which is used solely for drive detection and mileage tracking. For automatic drive detection and mileage tracking, please select "Always Allow".</string>

<key>NSLocationAlwaysUsageDescription</key>
<string>YOUR_APP_NAME uses Hurdlr to collect and transmit location data, which is used solely for drive detection and mileage tracking. For automatic drive detection and mileage tracking, please select "Always Allow".</string>

<key>NSLocationUsageDescription</key>
<string>YOUR_APP_NAME uses Hurdlr to collect and transmit location data, which is used solely for drive detection and mileage tracking. For automatic drive detection and mileage tracking, please select "Allow While Using App".</string>

<key>NSLocationWhenInUseUsageDescription</key>
<string>YOUR_APP_NAME uses Hurdlr to collect and transmit location data, which is used solely for drive detection and mileage tracking. For automatic drive detection and mileage tracking, please select "Allow While Using App".</string>

<key>NSMotionUsageDescription</key>
<string>YOUR_APP_NAME uses Hurdlr to collect and transmit motion data, which is used solely for drive detection and mileage tracking. For automatic drive detection and mileage tracking, please select "OK".</string>

<key>UIBackgroundModes</key>
<array>
    <string>location</string>
</array>
```

## Enums

### MileageDetectionMode

One of `OFF` or `AUTO`.

- `AUTO` - uses Hurdlr's automatic mileage detection algorithms to track mileage routes and distance
- `OFF` - manual tracking

### LocationAccess

One of `UNKNOWN`, `DISABLED`, `IN_APP_ONLY`, or `ALWAYS`

- `UNKNOWN` - Location access authorization has not been requested from the user
- `DISABLED` - The user explicitly denied location access authorization. Can also indicate that the app was restricted externally, such as by parental controls
- `IN_APP_ONLY` - Location access has only been authorized when the user is using the app
- `ALWAYS` - Location access has been granted for use anytime

### PreciseLocationAccess

One of `UNKNOWN`, `DISABLED`, or `ENABLED`

- `UNKNOWN` - Precise location access authorization has not been requested from the user
- `DISABLED` - Approximate location access has been granted for use anytime
- `ALWAYS` - Precise location access has been granted for use anytime

### MotionActivityAccess

One of `UNKNOWN`, `DISABLED`, or `ENABLED`

-

## Accessors

### isSetup() -> Bool

### getMileagePermissions() -> Permissions

### getMileageDetectionMode() -> MileageDetectionMode

### getCurrentDrive() -> Drive?

## Mutators

### initialize()

### logout()

### requestInitialMileagePermissions()

### requestMileagePermissions(viewController: UIViewController)

### setMileageDetectionMode(mileageDetectionMode: MileageDetectionMode)

### startSemiAutoDrive()

### stopSemiAutoDrive()

### openApp(completionHandler: ((Bool) -> Void)?)
