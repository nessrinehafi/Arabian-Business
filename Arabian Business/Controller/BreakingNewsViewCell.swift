//
//  BreakingNewsViewCell.swift
//  Arabian Business
//
//  Created by Nessrine on 7/17/19.
//  Copyright © 2019 com.NessrineHafi. All rights reserved.
//

import UIKit
import MarqueeLabel
import NightNight
class BreakingNewsViewCell: UITableViewCell {

    @IBOutlet var breakingNewsLabel: UILabel!
    
    @IBOutlet var rectangleImage: UIImageView!
    @IBOutlet weak var newsLabel: MarqueeLabel!
    
    @IBOutlet var backView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.mixedBackgroundColor = MixedColor(normal: UIColor(red: 236/255, green: 0/255, blue: 25/255, alpha: 1), night: .black)
       newsLabel.type = .continuous

        
        rectangleImage.mixedImage = MixedImage(normal: UIImage(named: "Rectangle 2 Copy 4")!, night: UIImage(named: "Rectangle 2")!)
        breakingNewsLabel.mixedTextColor = MixedColor(normal: UIColor(red: 236/255, green: 0/255, blue: 25/255, alpha: 1), night: .black)
        newsLabel.mixedTextColor = MixedColor(normal: .white, night: UIColor(red: 236/255, green: 0/255, blue: 25/255, alpha: 1))

    }
}
