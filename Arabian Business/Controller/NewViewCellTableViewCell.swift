//
//  NewViewCellTableViewCell.swift
//  Arabian Business
//
//  Created by Nessrine on 7/18/19.
//  Copyright © 2019 com.NessrineHafi. All rights reserved.
//

import UIKit
class NewViewCellTableViewCell: UITableViewCell {

    @IBOutlet weak var likesLabel: UILabel!
    
    @IBOutlet weak var viewsLabel: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var bookmarkButton: UIButton!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var tagButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!



    override func awakeFromNib() {
     bookmarkButton.isHidden = true
     shareButton.isHidden = true
     likeButton.isHidden = true
        
    }
        var num : Int = 1
    @IBAction func menuClicked(_ sender: UIButton) {
    
        
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
}
