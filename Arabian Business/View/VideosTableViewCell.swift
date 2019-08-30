//
//  VideosTableViewCell.swift
//  Arabian Business
//
//  Created by Nessrine on 8/29/19.
//  Copyright © 2019 com.NessrineHafi. All rights reserved.
//

import UIKit
import NightNight

class VideosTableViewCell: UITableViewCell {
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
    @IBOutlet var titleView: UIView!
    
    @IBOutlet weak var playButton: UIButton!

    
    @IBOutlet var footerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.mixedTextColor = MixedColor(normal: .black, night: .white)
            footerView.mixedBackgroundColor = MixedColor(normal: UIColor(red: 104/255, green: 105/255, blue: 107/255, alpha: 1), night: UIColor(red: 31/255, green: 32/255, blue: 35/255, alpha: 1))
        titleView.mixedBackgroundColor = MixedColor(normal: .white, night: .black)
        videoView.configure(url: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")

        // Initialization code
        bookmarkButton.isHidden = true
        shareButton.isHidden = true
        likeButton.isHidden = true
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
    @IBAction func playButtonPressed(_ sender: UIButton) {
    }
}

