//
//  VideoTableViewCell.swift
//  Arabian Business
//
//  Created by Nessrine on 8/28/19.
//  Copyright © 2019 com.NessrineHafi. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
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
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        bookmarkButton.isHidden = true
        shareButton.isHidden = true
        likeButton.isHidden = true
        videoView.configure(url: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
        videoView.isLoop = true
        videoView.play()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var num: Int = 1
    @IBAction func menuButtonPressed(_ sender: Any) {
        
        if(num % 2 > 0){
            UIView.animate(withDuration: 0.3, animations: {
                
                self.bookmarkButton.isHidden = false
                self.likeButton.isHidden = false
                self.shareButton.isHidden = false
                self.num = self.num + 1
            })
        }
        else{
            bookmarkButton.isHidden = true
            shareButton.isHidden = true
            likeButton.isHidden = true
            num = num + 1
        }
        
    }
    
    @IBAction func playVideoPressed(_ sender: Any) {
        if(num % 2 > 0){
        self.videoView.pause()
              }
       else{
        self.videoView.play()
        }
    }
    
}
