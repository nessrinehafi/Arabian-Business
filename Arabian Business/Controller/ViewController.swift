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
import NewsAPISwift
import Alamofire
import SwiftyJSON

var db: OpaquePointer?

internal let SQLITE_STATIC = unsafeBitCast(0, to: sqlite3_destructor_type.self)
internal let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self)
class ViewController: UIViewController {
    
    
    struct GlobalVariable{
    static var ArticleList = [Article]()
    }
    let newArticle = Article(id: 0, title: "", likes: 0, seen: 0, saved: 0 )

   

    let newsAPI = NewsAPI(apiKey: "857aee26c13b4caeb2eac19347a12dc0")
    var source: NewsSource!
    
    @IBOutlet weak var loaderImage: UIImageView!

    var arrRes = [[String:AnyObject]]()
    override func viewDidLoad() {
        

        
        super.viewDidLoad()
  //       self.getData()
       
      //  retrieveArticles(searchText: "t"")
     
        

        // Do any additional setup after loading the view.
    
        let fileUrl = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("ArabianBusiness.sqlite")
       if (sqlite3_open(fileUrl.path, &db) != SQLITE_OK)
       {
        print("Error Opening Database")
        }
        let s = "DROP TABLE articles "
        let createTableQuery = "CREATE TABLE IF NOT EXISTS articles(id INTEGER PRIMARY KEY AUTOINCREMENT, author TEXT , titles TEXT, description TEXT , url TEXT , urlToImage TEXT , publishedAt TEXT , content TEXT , likes INTEGER , seen INTEGER , saved boolean default 0  ) "

        if sqlite3_exec(db,createTableQuery , nil , nil , nil ) != SQLITE_OK {
            print("Error Creating Table")
            return

        }
       print("OK")
 
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
    var test = false
    func insert(title: String )
    {
        var stmt: OpaquePointer?

        let v =  self.readValues()
        for i in v
        {
            if (i.title == title)
            {
                test = false
                
            }
            
        }
        if (test == false)
        {

        let queryString = "INSERT INTO articles (titles, content, likes, seen,saved) VALUES (? , ? ,? ,? ,? )"
     
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return
        }
        
  
        if sqlite3_bind_text(stmt, 2, title, -1, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding name: \(errmsg)")
            return
        }
   
        if sqlite3_bind_int(stmt, 7, 0) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding likes: \(errmsg)")
            return
        }
        if sqlite3_bind_int(stmt, 8, 0) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding Seen: \(errmsg)")
            return
        }
        if sqlite3_bind_int(stmt, 9, 0) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding Saved: \(errmsg)")
            return
        }
        if sqlite3_step(stmt) != SQLITE_DONE {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure inserting hero: \(errmsg)")
            return
        }
        
        print("Article saved successfully")
        }
        sqlite3_finalize(stmt)
        }

    func readValues() -> [Article]{
        
        
        
       GlobalVariable.ArticleList.removeAll()
        let queryStrings = "SELECT * FROM articles "
        var stmt2:OpaquePointer?
        if sqlite3_prepare(db, queryStrings, -1, &stmt2, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return GlobalVariable.ArticleList
        }
        
        while(sqlite3_step(stmt2) == SQLITE_ROW){
            let id = sqlite3_column_int(stmt2, 0)
            let titles = String(cString: sqlite3_column_text(stmt2, 1))
            let likes = sqlite3_column_int(stmt2, 2)
            let seen = sqlite3_column_int(stmt2, 3)
            let saved = sqlite3_column_int(stmt2, 4)

            //adding values to list
            GlobalVariable.ArticleList.append(Article(id: Int(id), title: titles, likes: 0, seen: 0, saved: 0))
           // print(ArticleList.count)
        //     print(GlobalVariable.ArticleList.count)
          
        }
    
        sqlite3_finalize(stmt2)
        return GlobalVariable.ArticleList
    }
    
   /* func getData()
    {
        Alamofire.request("https://newsapi.org/v2/everything?q=a&apiKey=857aee26c13b4caeb2eac19347a12dc0").responseJSON {response in
            let swiftyJsonVar = JSON(response.data as Any)

         //   print(swiftyJsonVar)
            self.arti = [Article]()
            if let articles = swiftyJsonVar["articles"].arrayObject as? [[String : AnyObject]]{
                for article in articles {
                    if  let title = article["title"] as? String , let author = article["author"] as? String, let description = article["description"] as? String, let urlToImage = article["urlToImage"] as? String, let posturl = article["url"] as? String, let content = article["content"] , let publishedAt = article["publishedAt"]{
                   //     print(author)
                        var test = false
                        
                        let v =  self.readValues()
                        for i in v
                        {
                            if (i.title == title)
                            {
                                test = true
                                
                            }
                            
                        }
                        
                        
                        if( test == false ){
                        self.insert(author: author, title: title, description: description, url: posturl, urlToImage: urlToImage, publishedAt: publishedAt as! String, content: content as! String, likes: 0, seen: 0, saved: false   )
                        }
                        //ArticleList.append(article)
                        self.newArticle.author = author
                        self.newArticle.title = title
                        
                    }
                    self.arti?.append(self.newArticle)
                    
                }
            
            }else{
                print("Error in fetching the NEWS JSON")
            }
        }
            
            
        }*/
    

}


