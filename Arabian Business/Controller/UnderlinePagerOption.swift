//
//  UnderlinePagerOption.swift
//  Arabian Business
//
//  Created by Nessrine on 8/1/19.
//  Copyright © 2019 com.NessrineHafi. All rights reserved.
//

import UIKit
import Swift_PageMenu

public struct UnderlinePagerOption: PageMenuOptions {


   
    
    
    public var isInfinite: Bool = false
    
  
    
    public var menuTitleColor: UIColor {
        return UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1.0)
    }
    
  
    
    
    
    public var font: UIFont {
        return UIFont.systemFont(ofSize: UIFont.systemFontSize)
    }
    
    public var menuItemMargin: CGFloat {
        return 8
    }
    
    public var tabMenuBackgroundColor: UIColor {
        return .white
    }
    public var menuItemSize: PageMenuItemSize {
        return .sizeToFit(minWidth: 80, height: 50)
    }
    
 
    
 
    
    public var menuTitleSelectedColor: UIColor {
        return UIColor(red: 236/255, green: 0/255, blue: 25/255, alpha: 1)
    }
    
    public var menuCursor: PageMenuCursor {
        return .roundRect(rectColor: .white, cornerRadius: 20, height: 40, borderWidth: nil, borderColor: nil)
    }
    
 
    


    
    
    public init(isInfinite: Bool = false) {
        self.isInfinite = isInfinite
        
    }
    
   
    
 
}



