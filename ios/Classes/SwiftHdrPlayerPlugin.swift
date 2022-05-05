import Flutter
import UIKit

public class SwiftHdrPlayerPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        registrar.register(HdrPlayerFactory(), withId: "hdr_player")
    }
}

class HdrPlayerFactory: NSObject, FlutterPlatformViewFactory {
    func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        return HdrPlayer(frame, viewId, args)
    }
}

class HdrPlayer: NSObject, FlutterPlatformView {
    private var _view: UILabel!

    init(_ frame: CGRect, _ viewId: Int64, _ args: Any?) {
        _view = UILabel(frame: frame)
        _view.text = "hdr_player"
        super.init()
    }

    func view() -> UIView {
        return _view
    }
}
