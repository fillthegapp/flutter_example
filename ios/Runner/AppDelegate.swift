import UIKit
import Flutter
import AmplitudeSwift

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    let amplitude = Amplitude(
        configuration: Configuration(
            apiKey: "70fc7f074578d2c0b97283983cf153fe",
            logLevel: .DEBUG
        )
    )
    private var channel: FlutterMethodChannel?
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {


        amplitude.setUserId(userId: "ivan.diaz@fillthegapp.com")
        amplitude.setDeviceId(deviceId: UUID().uuidString)

        initFlutterMethodChannel()
        GeneratedPluginRegistrant.register(with: self)


        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    private func initFlutterMethodChannel() {

        guard let controller = window?.rootViewController as? FlutterViewController else {
            print("Error to cast rootViewController to FlutterViewController")
            return
        }

        channel = FlutterMethodChannel(name: "museum.list.test/flutter",
                                       binaryMessenger: controller.binaryMessenger)
        channel?.setMethodCallHandler({
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            // This method is invoked on the UI thread.
            print(call.method)
            let flutterMethod = FlutterMethod(rawValue: call.method)
            switch flutterMethod {
            case .sendAnalytics:
                print("Send analytics to Amplitude")

                guard let arguments = call.arguments as? [String: Any] else {
                    result("WatchSession has no arguments")
                    return
                }

                guard
                    let eventName = arguments[FlutterKeys.eventName.rawValue] as? String,
                    let artID = arguments[FlutterKeys.id.rawValue] as? String else {
                    result("Keys have not found'")
                    return
                }

                self.amplitude.track(
                    eventType: eventName,
                    eventProperties: ["artID": artID]
                )
                result("ok")
            default:
                result("default")
            }
        })
    }
}
