//
//  SearchFeaturesCollectionViewCell.swift
//  Arabian Business
//
//  Created by Nessrine on 8/5/19.
//  Copyright © 2019 com.NessrineHafi. All rights reserved.
//

import UIKit
import NightNight
class SearchFeaturesCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
titleView.mixedBackgroundColor = MixedColor(normal: UIColor(red: 233/255, green: 233/255, blue: 233/255, alpha: 1), night: .black)
        title.mixedTextColor = MixedColor(normal: .black, night: .white)
        
        
    }

    @IBOutlet var titleView: UIView!
    @IBOutlet var title: UILabel!
}
