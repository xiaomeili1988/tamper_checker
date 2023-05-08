import Flutter
import UIKit

public class SwiftTamperCheckerPlugin: NSObject, FlutterPlugin {
    public static func register(with t: FlutterPluginRegistrar) {
        let d = FlutterMethodChannel(name: "tc", binaryMessenger: t.messenger())
        let g = SwiftTamperCheckerPlugin()
        t.addMethodCallDelegate(g, channel: d)
    }
    
    public func handle(_ q: FlutterMethodCall, result: @escaping FlutterResult) {
        DispatchQueue.global(qos: .default).async {
            if q.method == "gba" {
                let i = Bundle.main.bundlePath
                result(i)
            } else {
                DispatchQueue.main.sync {
                    result(FlutterMethodNotImplemented)
                }
            }
        }
    }
}
