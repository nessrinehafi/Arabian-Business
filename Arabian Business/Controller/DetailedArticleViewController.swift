//
//  DetailedArticleViewController.swift
//  Arabian Business
//
//  Created by Nessrine on 8/30/19.
//  Copyright © 2019 com.NessrineHafi. All rights reserved.
//

import UIKit

class DetailedArticleViewController: UIViewController {
    var selectedVideo : Video?
    var name = ""
    @IBOutlet var newsImage: UIImageView!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet weak var bookmarkButton: UIButton!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var titleView: UIView!
    @IBOutlet var dateLabem: UILabel!
    @IBOutlet var likesLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLabel?.text = "name"
        
        bookmarkButton.isHidden = true
        shareButton.isHidden = true
        likeButton.isHidden = true
        // Do any additional setup after loading the view.
    }
    @IBOutlet var seenLabel: UILabel!
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    var num = 1
    @IBAction func menuClicked(_ sender: UIButton) {
        
        
        if(num % 2 > 0){
            UIView.animate(withDuration: 0.3, animations: {
                
                self.bookmarkButton.isHidden = false
                self.likeButton.isHidden = false
                self.shareButton.isHidden = false
                self.num = self.num + 1
            })
        }
        else{
            bookmarkButton.isHidden = true
            shareButton.isHidden = true
            likeButton.isHidden = true
            num = num + 1
        }
    }
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
