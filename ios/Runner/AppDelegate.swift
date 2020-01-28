import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GMSServices.provideAPIKey("AIzaSyCXkKpGAugeLwVR9vzLu1Z0_Mpn77WczV8")
    GMSPlacesClient.provideAPIKey("AIzaSyCXkKpGAugeLwVR9vzLu1Z0_Mpn77WczV8")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
