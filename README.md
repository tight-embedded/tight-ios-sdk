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