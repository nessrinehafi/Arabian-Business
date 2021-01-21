//
//  HomeViewController.swift
//  Arabian Business
//
//  Created by Nessrine on 7/16/19.
//  Copyright © 2019 com.NessrineHafi. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController , UITableViewDelegate, UITableViewDataSource ,UIScrollViewDelegate , UITabBarControllerDelegate  {
    @IBOutlet weak var navigationItel: UINavigationItem!
    
    @IBOutlet weak var TopView: UIView!
    // outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var featureButton: UIButton!
    
    private let imageView = UIImageView(image: UIImage(named: "logo"))

    
    
    
 
    
//// table View
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        if (indexPath.row == 0)
        {
            let cell = Bundle.main.loadNibNamed("FeaturesTableViewCell", owner: self, options: nil)?.first as! FeaturesTableViewCell

            cell.titleLabel.text = "First"
            return cell

        }
       else if (indexPath.row == 1)
        {
            let cell = Bundle.main.loadNibNamed("BreakingNewsViewCell", owner: self, options: nil)?.first as! BreakingNewsViewCell
            cell.newsLabel.text = "heyy"
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
            return 296.5
            
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

        
 
      
        setupUI()
        tableView.delegate = self
        tableView.dataSource = self
       // setupMenuBar()
    }
    private struct Const {
        /// Image height/width for Large NavBar state
        static let ImageSizeForheightState: CGFloat = 23
        static let ImageSizeForwidthState: CGFloat = 109
        /// Margin from right anchor of safe area to right anchor of Image
        static let ImageLeftMargin: CGFloat = -12
        /// Margin from bottom anchor of NavBar to bottom anchor of Image for Large NavBar state
        static let ImageBottomMarginForLargeState: CGFloat = 8
        /// Margin from bottom anchor of NavBar to bottom anchor of Image for Small NavBar state
        static let ImageBottomMarginForSmallState: CGFloat = 6
        /// Image height/width for Small NavBar state
        static let ImageSizeForSmallState: CGFloat = 32
        /// Height of NavBar for Small state. Usually it's just 44
        static let NavBarHeightSmallState: CGFloat = 44
        /// Height of NavBar for Large state. Usually it's just 96.5 but if you have a custom font for the title, please make sure to edit this value since it changes the height for Large state of NavBar
        static let NavBarHeightLargeState: CGFloat = 89
    }
    private func setupUI() {
    
        
        // Initial setup for image for Large NavBar state since the the screen always has Large NavBar once it gets opened
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(named: "Rectangle"), for: UIBarMetrics.default)
        self.navigationController!.navigationBar.shadowImage = UIImage()

        guard let navigationBar = self.navigationController?.navigationBar else { return }

        navigationBar.addSubview(imageView)
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.leftAnchor.constraint(equalTo: navigationBar.leftAnchor, constant: -Const.ImageLeftMargin),
            imageView.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: -Const.ImageBottomMarginForLargeState),
            imageView.heightAnchor.constraint(equalToConstant: Const.ImageSizeForheightState),
            imageView.widthAnchor.constraint(equalToConstant: Const.ImageSizeForwidthState)
            ])
        
        
        
        
   


    }
}

 
/*    let menuBar : MenuBar = {
        let mb = MenuBar()
        return mb
    }()
    private func setupMenuBar()
    {
        view.addSubview(menuBar)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat(format: "V:|[v0(50)]|", views: menuBar)

      
    }
*/
  



/*
extension UIView {
    func addConstraintsWithFormat(format: String , views : UIView...)
    
    {
        var viewsDictionnary = [String : UIView]()
        for (index , view) in views.enumerated()
        {
            let key = "v\(index)"
            viewsDictionnary[key] = view
        }
        
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionnary))
    }
}
*/
