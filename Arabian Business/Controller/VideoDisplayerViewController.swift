//
//  VideoDisplayerViewController.swift
//  Arabian Business
//
//  Created by Nessrine on 8/30/19.
//  Copyright © 2019 com.NessrineHafi. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import NightNight
class VideoDisplayerViewController: UIViewController {
    @IBOutlet weak var videoView: VideoView!
    @IBOutlet weak var likesLabel: UILabel!
    
    @IBOutlet weak var viewsLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
 
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var soundButton: UIButton!
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var pauseButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        pauseButton.isHidden = true
        soundButton.isHidden = true
        durationLabel.isHidden = true
        slider.isHidden = true
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction))
        self.view.addGestureRecognizer(gesture)
        let nothing = UITapGestureRecognizer(target: self, action:  #selector(self.NoAction))
        self.canvasView.addGestureRecognizer(nothing)
      canvasView.mixedBackgroundColor = MixedColor(normal: .white, night: .black)
        titleLabel.mixedTextColor = MixedColor(normal: .black, night: .white)
        videoView.configure(url: "https://firebasestorage.googleapis.com/v0/b/gameofchats-762ca.appspot.com/o/message_movies%2F12323439-9729-4941-BA07-2BAE970967C7.mov?alt=media&token=3e37a093-3bc8-410f-84d3-38332af9c726")
        let seconds = String(format: "%02d", Int(videoView.getCurrentItemDuration())%60)
        let minuts = String(format: "%02d", Int(videoView.getCurrentItemDuration())/60)
        durationLabel.text = "\(minuts):\(seconds)"
        print("----------------")
        videoView.isLoop = true
        videoView.pause()
        playButton.addTarget(self, action: #selector(handlePlay), for: .touchUpInside)
        pauseButton.addTarget(self, action: #selector(handlePause), for: .touchUpInside)
        soundButton.addTarget(self, action: #selector(handleSound), for: .touchUpInside)
        slider.addTarget(self, action: #selector(handleSliderChange), for: .valueChanged)
        slider.maximumValue = Float(videoView.getCurrentItemDuration())
        
    }
    @IBOutlet var canvasView: UIView!
    @objc func checkAction(sender:UITapGestureRecognizer){
        dismiss(animated: true, completion: nil)
   }
    @objc func NoAction(sender:UITapGestureRecognizer){
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
        playButton.isHidden = true
        soundButton.isHidden = false
        durationLabel.isHidden = false
        slider.isHidden = false
        pauseButton.isHidden = false
    }
    @objc func handlePause()  {
        
        videoView.pause()
        playButton.isHidden = false
        pauseButton.isHidden = false
    }


}
