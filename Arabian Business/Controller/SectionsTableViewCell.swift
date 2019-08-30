//
//  SectionsTableViewCell.swift
//  Arabian Business
//
//  Created by Nessrine on 8/2/19.
//  Copyright © 2019 com.NessrineHafi. All rights reserved.
//

import UIKit
import NightNight
class SectionsTableViewCell: UITableViewCell {

    @IBOutlet var backView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.mixedBackgroundColor = MixedColor(normal: .white, night: .black)
        sectionLabel.mixedTextColor = MixedColor(normal: UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1), night: .white)
    }
    @IBOutlet weak var sectionLabel: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
