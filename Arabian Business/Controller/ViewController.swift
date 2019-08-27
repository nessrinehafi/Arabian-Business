//
//  ViewController.swift
//  Arabian Business
//
//  Created by Nessrine on 7/16/19.
//  Copyright © 2019 com.NessrineHafi. All rights reserved.
//

import UIKit
import SQLite

let path = NSSearchPathForDirectoriesInDomains(
    .documentDirectory, .userDomainMask, true
    ).first
let databaseFileName = "db.sqlite3"
let databaseFilePath = "\(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0])/\(databaseFileName)"
let db = try! Connection(databaseFilePath)
class ViewController: UIViewController {


    @IBOutlet weak var loaderImage: UIImageView!


    override func viewDidLoad() {
        

        super.viewDidLoad()
        // Do any additional setup after loading the view.
    

     

        
       
        Loader(imageView: loaderImage, aCircleTime: 2)
        self.perform(#selector(changeImageColor), with: nil, afterDelay: 0 )
    }
    // Color Change 
    @objc func changeImageColor() {
        let tempImagr = loaderImage.image?.withRenderingMode(.alwaysTemplate)
        loaderImage.image = tempImagr
        loaderImage.tintColor = UIColor.white
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            let navigationController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NavigationController") as! UINavigationController
            self.present(navigationController,animated: true, completion: nil)
        //self.performSegue(withIdentifier: "showHome", sender: self)

    }
    
    
}
}


