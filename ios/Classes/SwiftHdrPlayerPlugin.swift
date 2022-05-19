import Flutter
import UIKit
import AVFoundation

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
    private var _view: HdrView!

    init(_ frame: CGRect, _ viewId: Int64, _ args: Any?) {
        _view = HdrView(frame: frame)
        super.init()
    }

    func view() -> UIView {
        return _view
    }
}

class HdrView: UIView {
    private var player: AVPlayer!
    private var playerLayer: AVPlayerLayer!

    override init(frame: CGRect) {
        super.init(frame: frame)
        player = AVPlayer(url: URL(string: "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4")!)
        playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        self.layer.addSublayer(playerLayer)

        player.actionAtItemEnd = .none
        player.play()
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil, queue: nil) { notification in
            self.player.seek(to: .zero)
            self.player.play()
        }
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        playerLayer.frame = self.bounds
    }
}
