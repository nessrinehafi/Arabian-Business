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
import SQLite
import NewsAPISwift

class HomeViewController: UIViewController , UITableViewDelegate, UITableViewDataSource ,UIScrollViewDelegate , UITabBarDelegate {



    var ref: DatabaseReference!
    

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
    
    let newsAPI = NewsAPI(apiKey: "e2519a76a0a343e38b8cad1692c27f0f")
    var source: NewsSource!
    
    
     func setSelected(_ selected: Bool, animated: Bool) {
       table setSelected(selected, animated: animated)
    }
    
    
    private let imageView = UIImageView(image: UIImage(named: "logo"))

    
    
    


    //// table View
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        if (indexPath.row == 0)
        {
            let cell = Bundle.main.loadNibNamed("FeaturesTableViewCell", owner: self, options: nil)?.first as! FeaturesTableViewCell
        
            
            return cell

        }
       else if (indexPath.row == 1)
        {
            let cell = Bundle.main.loadNibNamed("BreakingNewsViewCell", owner: self, options: nil)?.first as! BreakingNewsViewCell
            cell.newsLabel.text = "heyyllflfllfepraflapêrg^peakg^pearkg^praegk^pegkp^zekg^pzekg^pekrg^pekg^pekg^pekg^pke^pgk^pekrgp^kea^pgkaêpgkâpekg"
            return cell

            
        }
        else{
            let cell = Bundle.main.loadNibNamed("NewViewCellTableViewCell", owner: self, options: nil)?.first as! NewViewCellTableViewCell
            
            cell.titleLabel.text = "NEWS"
            
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

            return 400
        }
    }
    
  ////////


    
    override func viewDidLoad() {
        navigationItem.hidesBackButton = true
     

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


