Pod::Spec.new do |spec|
  spec.name          = "Tight"
  spec.version       = "1.0.0"
  spec.summary       = "Tight iOS SDK for automatic mileage detection and tracking"
  spec.description   = <<-DESC
    The Tight SDK provides automatic mileage detection and tracking capabilities for iOS applications.
  DESC

  spec.homepage      = "https://github.com/Hurdlr/tight-ios-sdk.git"
  spec.license       = { :type => "Proprietary" }
  spec.author        = { "Tight" => "api@tight.com" }

  spec.platform      = :ios, "17.0"
  spec.ios.deployment_target = "17.0"

  spec.source        = {
    :git => "https://github.com/Hurdlr/tight-ios-sdk",
    :tag => "#{spec.version}"
  }

  # Binary xcframework
  spec.vendored_frameworks = "Tight.xcframework"

  # Required frameworks
  spec.frameworks = "CoreLocation", "CoreMotion", "UIKit"

  spec.swift_version = "5.10"

  # Ensure users know about required Info.plist keys
  spec.info_plist = {
    'TightClientId' => '$(TIGHT_CLIENT_ID)'
  }
end
