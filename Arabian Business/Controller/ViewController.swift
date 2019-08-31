//
//  ViewController.swift
//  Arabian Business
//
//  Created by Nessrine on 7/16/19.
//  Copyright © 2019 com.NessrineHafi. All rights reserved.
//

import UIKit
import SQLite3
import NightNight
/*
let path = NSSearchPathForDirectoriesInDomains(
    .documentDirectory, .userDomainMask, true
    ).first
let databaseFileName = "db.sqlite3"
let databaseFilePath = "\(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0])/\(databaseFileName)"
let db = try! Connection(databaseFilePath)*/

class ViewController: UIViewController {


    @IBOutlet weak var loaderImage: UIImageView!
    var db: OpaquePointer?

    override func viewDidLoad() {
        
   
        
        super.viewDidLoad()
        
        /*
        var ArticleList = [Article]()
        
        ArticleList.removeAll()
        let queryStrings = "SELECT * FROM articles"
        var stmt2:OpaquePointer?
        if sqlite3_prepare(db, queryStrings, -1, &stmt2, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return
        }
        /*
         while(sqlite3_step(stmt2) == SQLITE_ROW){
         let id = sqlite3_column_int(stmt2, 0)
         let author = String(cString: sqlite3_column_text(stmt2, 1))
         let title = sqlite3_column_int(stmt2, 2)
         
         //adding values to list
         ArticleList.append(Article(id: Int(id), author: String(describing: author), title: String(describing: title)))
         }
         
         */
        // Do any additional setup after loading the view.
    
        let fileUrl = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("ArabianBusiness.sqlite")
       if (sqlite3_open(fileUrl.path, &db) != SQLITE_OK)
       {
        print("Error Opening Database")
        }
        let createTableQuery = "CREATE TABLE IF NOT EXISTS articles(id INTEGER PRIMARY KEY AUTOINCREMENT, author TEXT , title TEXT UNIQUE, description TEXT , url TEXT , urlToImage TEXT , publishedAt TEXT , content TEXT  ) "

        if sqlite3_exec(db,createTableQuery , nil , nil , nil ) != SQLITE_OK {
            print("Error Creating Table")
            return

        }
       print("OK")
        
        let author = "Nessrine"
        let title = "testing2"
        var stmt: OpaquePointer?
        let queryString = "INSERT INTO articles (author, title) VALUES (?,?)"

        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return
        }
        if sqlite3_bind_text(stmt, 1, author, -1, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding name: \(errmsg)")
            return
        }
        if sqlite3_bind_int(stmt, 2, (title as NSString).intValue) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding name: \(errmsg)")
            return
        }
        if sqlite3_step(stmt) != SQLITE_DONE {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure inserting hero: \(errmsg)")
            return
        }
    
        print("Article saved successfully")

    */
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
            NightNight.theme = .normal

    }
    
    
}
}


