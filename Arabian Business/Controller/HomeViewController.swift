//
//  HomeViewController.swift
//  Arabian Business
//
//  Created by Nessrine on 7/16/19.
//  Copyright © 2019 com.NessrineHafi. All rights reserved.
//

import UIKit
import NewsAPISwift
import Firebase
import FirebaseDatabase
import NewsAPISwift

class HomeViewController: UIViewController , UITableViewDelegate, UITableViewDataSource ,UIScrollViewDelegate , UITabBarDelegate {

    var getThatValue = ViewController.GlobalVariable.ArticleList

    var myCustomViewController: ViewController = ViewController(nibName: nil, bundle: nil)

    
    var i: Int = 0

    @IBOutlet weak var bookMark: UITabBarItem!
    
  
    // outlets
    @IBOutlet weak var tableView: UITableView!
   
    var articles = [NewsArticle]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    let newsAPI = NewsAPI(apiKey: "857aee26c13b4caeb2eac19347a12dc0")
    
    
   
    
    
    private let imageView = UIImageView(image: UIImage(named: "logo"))

    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //let secondViewController = storyboard.instantiateViewController(withIdentifier: "DetailedArticleViewController") as? DetailedArticleViewController
      //  guard let name = articles[1].author else {  return }
//        secondViewController.titleLabel.text = ""
        print( articles[indexPath.row-2].title)
        self.performSegue(withIdentifier: "detailsSegue", sender: indexPath.row)

//        secondViewController!.titleLabel.text = "articles[indexPath.row-2].title"
      //  self.present(secondViewController!, animated: true, completion: nil)
        

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            guard let destinationVC = segue.destination as? DetailedArticleViewController else {return}
            let selectedRow = indexPath.row
            destinationVC.titleLabel.text = articles[selectedRow].title
        }
    }
    //// table View
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count+2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        if (indexPath.row == 0)
        {
            let cell = Bundle.main.loadNibNamed("FeaturesTableViewCell", owner: self, options: nil)?.first as! FeaturesTableViewCell
        
            
            return cell

        }
       else if (indexPath.row == 1)
        {
            var breakingNews : String = ""

            let cell = Bundle.main.loadNibNamed("BreakingNewsViewCell", owner: self, options: nil)?.first as! BreakingNewsViewCell
            for article in articles
            {
                let currentrow = indexPath.row - 1
                breakingNews = breakingNews+" - "+articles[currentrow].title
                
                
            }
            cell.newsLabel.text = breakingNews
            return cell

            
        }
        else{
            let cell = Bundle.main.loadNibNamed("NewViewCellTableViewCell", owner: self, options: nil)?.first as! NewViewCellTableViewCell
            let currentrow = indexPath.row - 2
            cell.titleLabel.text = articles[currentrow].title
            let dateFormatter = DateFormatter()
            
            
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            
            dateFormatter.dateFormat = "yyyy-mm-dd'T'HH:mm:ss.SSSZ"
            let date = articles[currentrow].publishedAt
            let url = articles[currentrow].urlToImage?.absoluteString
            
            if(url == nil)
            {
                cell.newsImage.imageFromServerURL(urlString: "https://image.shutterstock.com/image-vector/breaking-news-background-planet-600w-667420906.jpg" )
                cell.newsImage.contentMode = .scaleAspectFill
                
            }
            else{
                
                cell.newsImage.imageFromServerURL(urlString: url! )
                cell.newsImage.contentMode = .scaleToFill
                
            }
            dateFormatter.dateStyle = .medium
            dateFormatter.string(from: date)
            print(date)
            
            cell.dateLabel.text =  dateFormatter.string(from: date)
            return cell

        }

    

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.row == 0)
        {
            return 295
            
        }
        else if (indexPath.row == 1)
        {
           
            return 60.5
            
            
        }
        else{

            return 396
        }
    }
    
  ////////


    override func viewDidLoad() {
        
        
        
        for i in getThatValue
        {
            print("-----\(i.title)")
        }

        navigationItem.hidesBackButton = true
        newsAPI.getTopHeadlines(category: .general ){ result in
            switch result {
            case .success(let articles):
                self.articles = articles
            case .failure(let error):
                print(error)            }
        }
      
        tableView.delegate = self
        tableView.dataSource = self
      
       // setupMenuBar()
    }
    @IBAction func didTapMenu(_ sender: UIBarButtonItem) {
        guard let menuViewController = storyboard?.instantiateViewController(withIdentifier: "menuViewController" ) else{return}
            
        present(menuViewController, animated: true)
        
    
        
        
    }

  

    func willMoveToPage(controller: UIViewController, index: Int){
        
        
        print(index)
    }

   
  

}


