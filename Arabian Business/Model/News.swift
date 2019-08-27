//
//  News.swift
//  Arabian Business
//
//  Created by Nessrine on 8/9/19.
//  Copyright © 2019 com.NessrineHafi. All rights reserved.
//
 import UIKit
import Foundation
class News: NSObject {
    var idNews : Int
    var headlines : String
    
     init(idnews: Int , headlines: String ) {
        self.idNews = idnews
        self.headlines  = headlines
        
    }
}
