import UIKit
import AVKit
import AVFoundation

class VideoView: UIView {
    
    var playerLayer: AVPlayerLayer?
    var player: AVPlayer?
    var isLoop: Bool = false
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

    }
    
    func configure(url: String) {
        if let videoURL = URL(string: url) {
            
     
            player = AVPlayer(url: videoURL)
            playerLayer = AVPlayerLayer(player: player)
            playerLayer?.frame = bounds
            playerLayer?.videoGravity = AVLayerVideoGravity.resize

            if let playerLayer = self.playerLayer {
                layer.addSublayer(playerLayer)
            }
            NotificationCenter.default.addObserver(self, selector: #selector(reachTheEndOfTheVideo(_:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: self.player?.currentItem)
        }
    }
    
    func play() {
        if player?.timeControlStatus != AVPlayer.TimeControlStatus.playing {
            player?.play()
        }
    }
    
    func pause() {
        player?.pause()
    }
    
    func stop() {
        player?.pause()
        player?.seek(to: CMTime.zero)
    }
    func mute() {
        player?.isMuted = true
    }
    func unmute() {
        player?.isMuted = false
    }

     func getCurrentItemDuration() -> Double
    {
        let duration = player?.currentItem?.asset.duration
        let durationSeconds = CMTimeGetSeconds(duration!)
        
        return durationSeconds
    }
    @objc func reachTheEndOfTheVideo(_ notification: Notification) {
        if isLoop {
            player?.pause()
            player?.seek(to: CMTime.zero)
            player?.play()
        }
    }
    func seekToTime(time:CMTime) {
        player?.seek(to: time, completionHandler: { (Bool) in
            
        })
    }
    
}
