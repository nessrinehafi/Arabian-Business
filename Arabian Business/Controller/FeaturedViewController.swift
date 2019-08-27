//
//  FeaturedViewController.swift
//  Arabian Business
//
//  Created by Nessrine on 7/26/19.
//  Copyright © 2019 com.NessrineHafi. All rights reserved.
//

import UIKit
import DLPageMenu
class FeaturedViewController: UIViewController , UITableViewDelegate, UITableViewDataSource ,UIScrollViewDelegate  {


    
    
    // outlets
    @IBOutlet weak var tableView: UITableView!
    
    
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
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if (item.tag == 0)
        {
            
            
            print(33333)
            
            
        }
        else if (item.tag == 1)
        {
            print(111111111111)
        }
        else if (item.tag == 2)
        {
            guard let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "Search") as? SearchViewController else {
                return
            }
            let transition:CATransition = CATransition()
            transition.duration = 0.5
            transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            transition.type = CATransitionType.push
            transition.subtype = CATransitionSubtype.fromRight
            self.navigationController!.view.layer.add(transition, forKey: kCATransition)
            
            self.navigationController?.pushViewController(vc, animated: false)        }
        else
        {
            print(33333)
        }
        
    }
    
    override func viewDidLoad() {
        navigationItem.hidesBackButton = true
        
        var viewControllers = [UIViewController]()
        let names = ["Lionel Messi", "Neymar", "Xavi", "Andres Iniesta", "Sergio Busquets", "Thierry Henry", "Abidal", "Alves", "Carles Puyol", "Gerard Pique"]
        for name in names
        {
            let viewController = UIViewController()
            viewController.title = name
            viewController.view.backgroundColor = UIColor(red: CGFloat(arc4random_uniform(256))/255,
                                                          green: CGFloat(arc4random_uniform(256))/255,
                                                          blue: CGFloat(arc4random_uniform(256))/255,
                                                          alpha: 1)
            viewControllers.append(viewController)
            
            
        }
        //setupMenuPage()
        let pageMenu = DLPageMenu(viewControllers: viewControllers, option: setupMenuPage())
        
        view.addSubview(pageMenu)
        setupUI()
        
        // setupMenuBar()
    }
    @IBAction func didTapMenu(_ sender: UIBarButtonItem) {
        guard let menuViewController = storyboard?.instantiateViewController(withIdentifier: "menuViewController" ) else{return}
        
        present(menuViewController, animated: true)
        
        
        
        
    }
    
    
    func setupMenuPage()->PageMenuOption{
        var option = PageMenuOption(frame: CGRect(x: 0, y: 86, width: view.frame.size.width, height: 49))
        option.menuItemHeight = 44
        option.menuTitleFont = .boldSystemFont(ofSize: 16)
        option.menuTitleColorNormal = .lightGray
        option.menuTitleColorSelected = .black
        option.menuItemBackgroundColorNormal = .white
        option.menuItemBackgroundColorSelected = .white
        option.menuIndicatorColor = .black
        return option
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
        
        
        
        
        
        
        
        
    }
    func willMoveToPage(controller: UIViewController, index: Int){
        
        
        print("nddd")
    }
    
    
}
