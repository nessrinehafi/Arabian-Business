//
//  CustomLoader.swift
//  Arabian Business
//
//  Created by Nessrine on 7/16/19.
//  Copyright © 2019 com.NessrineHafi. All rights reserved.
//

import UIKit

extension  UIViewController {

    
    func Loader(imageView: UIImageView, aCircleTime: Double)  {
        
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.fromValue = 0.0
        rotationAnimation.toValue = -Double.pi * 2 //Minus can be Direction
        rotationAnimation.duration = aCircleTime
        rotationAnimation.repeatCount = 3
        imageView.layer.add(rotationAnimation, forKey: nil)
        
        
    }



}
