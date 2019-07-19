//
//  FeaturesTableViewCell.swift
//  Arabian Business
//
//  Created by Nessrine on 7/17/19.
//  Copyright © 2019 com.NessrineHafi. All rights reserved.
//

import UIKit

class FeaturesTableViewCell: UITableViewCell  , UIScrollViewDelegate{
    @IBOutlet weak var featureScroller: UIScrollView!
    @IBOutlet weak var pageController: UIPageControl!
    
    @IBOutlet weak var viewsLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var dataType: UIImageView!
    
    
   
}
