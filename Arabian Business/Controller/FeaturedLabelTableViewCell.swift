//
//  FeaturedLabelTableViewCell.swift
//  Arabian Business
//
//  Created by Nessrine on 8/5/19.
//  Copyright © 2019 com.NessrineHafi. All rights reserved.
//

import UIKit
import NightNight
class FeaturedLabelTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        backView.mixedBackgroundColor = MixedColor(normal: .white, night: .black)        }

    @IBOutlet var backView: UIView!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
