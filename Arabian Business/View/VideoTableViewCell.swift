//
//  VideoTableViewCell.swift
//  Arabian Business
//
//  Created by Nessrine on 8/28/19.
//  Copyright © 2019 com.NessrineHafi. All rights reserved.
import UIKit
import AVKit
import AVFoundation

class VideoTableViewCell: UITableViewCell  {
    
    @IBOutlet weak var videoView: VideoView!
    @IBOutlet weak var likesLabel: UILabel!
    
    @IBOutlet weak var viewsLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var bookmarkButton: UIButton!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var tagButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var soundButton: UIButton!
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var pauseButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
   

        
        bookmarkButton.isHidden = true
        shareButton.isHidden = true
        likeButton.isHidden = true
        pauseButton.isHidden = true
        soundButton.isHidden = true
        durationLabel.isHidden = true
        slider.isHidden = true
    
        videoView.configure(url: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
        let seconds = String(format: "%02d", Int(videoView.getCurrentItemDuration())%60)
        let minuts = String(format: "%02d", Int(videoView.getCurrentItemDuration())/60)
        durationLabel.text = "\(minuts):\(seconds)"
     //   print("----------------")
        videoView.isLoop = true
        videoView.pause()
        playButton.addTarget(self, action: #selector(handlePlay), for: .touchUpInside)
        pauseButton.addTarget(self, action: #selector(handlePause), for: .touchUpInside)
        soundButton.addTarget(self, action: #selector(handleSound), for: .touchUpInside)
        slider.addTarget(self, action: #selector(handleSliderChange), for: .valueChanged)
        
        
    }
    
    
    @objc func handleSliderChange()  {
       print(slider.value)
        
        
        if let duration = videoView?.getCurrentItemDuration() {
            let value  = Float64(slider.value) * duration
            let seekTime = CMTime(value: Int64(value), timescale: 1)
            videoView?.seekToTime(time: seekTime)
            
        }
        
    }
    var muteDet = 1
    
    @objc func handleSound()  {
        if(muteDet % 2 > 0)
        {
        videoView.mute()
            muteDet = muteDet + 1
        }
        else
        {
           videoView.unmute()
             muteDet = muteDet + 1
        }
    
    }
    @objc func handlePlay()  {
        
        videoView.play()
        menuButton.isHidden = true
        playButton.isHidden = true
        soundButton.isHidden = false
        durationLabel.isHidden = false
        slider.isHidden = false
        pauseButton.isHidden = false
    }
    @objc func handlePause()  {
        
        videoView.pause()
        menuButton.isHidden = true
        playButton.isHidden = false
        pauseButton.isHidden = false
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var num: Int = 1
    var num2: Int = 1
    @IBAction func menuButtonPressed(_ sender: Any) {
        
        if(num % 2 > 0){
            UIView.animate(withDuration: 0.3, animations: {
                
                self.bookmarkButton.isHidden = false
                self.likeButton.isHidden = false
                self.shareButton.isHidden = false
                self.num = self.num + 1
                self.videoView.pause()

            })
        }
        else{
            bookmarkButton.isHidden = true
            shareButton.isHidden = true
            likeButton.isHidden = true
            num = num + 1
        }
        
    }

}
