import Foundation
import Flutter
import AmplitudeSwift

class AnalyticChannel: Channel {
  var channel: FlutterMethodChannel?
  var controller: FlutterViewController?

  enum Methods: String {
    case sendAnalytics
  }

  let amplitude = Amplitude(
    configuration: Configuration(
      apiKey: "YOUR-API-KEY",
      logLevel: .DEBUG
    )
  )

  var channelName: String {
    "AmplitudeChannel"
  }

  init(controller: FlutterViewController) {
    self.controller = controller
    initChannel()
  }

  func initChannel() {
    guard let controller = controller else {
      return
    }

    amplitude.setUserId(userId: "YOUR-EMAIL")
    amplitude.setDeviceId(deviceId: UUID().uuidString)

    channel = FlutterMethodChannel(name: channelName,
                                   binaryMessenger: controller.binaryMessenger)
    channel?.setMethodCallHandler({
      (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
      // This method is invoked on the UI thread.
      let flutterMethod = Methods(rawValue: call.method)
      switch flutterMethod {
      case .sendAnalytics:
        guard let arguments = call.arguments as? [String: Any] else {
          result("No arguments")
          return
        }

        guard
          let eventName = arguments[FlutterKeys.eventName.rawValue] as? String,
          let artID = arguments[FlutterKeys.id.rawValue] as? String else {
          result("Keys have not found'")
          return
        }

        self.trackEvent(name: eventName, data: ["artID": artID])
      default: break
      }
    })
  }

  // MARK: Private methods
  func trackEvent(name: String, data: [String: Any]? = nil) {
    amplitude.track(
      eventType: name,
      eventProperties: data
    )
  }

}
