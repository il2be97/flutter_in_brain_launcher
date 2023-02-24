import Flutter
import UIKit

public class SwiftFlutterInBrainLauncherPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "flutter_in_brain_launcher", binaryMessenger: registrar.messenger())
        let instance = SwiftFlutterInBrainLauncherPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "launch_in_brain":
            guard let arguments = call.arguments as? Dictionary<String, Any>,
                  let params = ConfigureInBrainParameters(dict: arguments) else {
                result(FlutterError(code: "1", message: "Invalid", details: "Incorrect params"))
                return
            }
            InBrainManager.shared.configure(params: params)
            result(true)
        case "get_native_survey":
            InBrainManager.shared.getNativeSurveys { listOfSurveys in
                result(listOfSurveys)
            } failed: { error in
                result(FlutterError(code: "Failed", message: error.localizedDescription, details: nil))
            }

        case "show_native_survey":
            guard let arguments = call.arguments as? Dictionary<String, Any>,
                  let params = ShowNativeInBrainParameters(dict: arguments) else {
                result(FlutterError(code: "1", message: "Invalid", details: "Incorrect params"))
                return
            }
            InBrainManager.shared.showNativeSurve(params: params) { status in
                result(status)
            }
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}
