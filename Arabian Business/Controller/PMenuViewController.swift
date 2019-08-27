//
//  PMenuViewController.swift
//  Arabian Business
//
//  Created by Nessrine on 8/1/19.
//  Copyright © 2019 com.NessrineHafi. All rights reserved.
//

import UIKit
import Swift_PageMenu

class PMenuViewController: PageMenuController {
    

    
    let titles: [String] = [
        "Featured",
        "video",
        "Explore",
        "Bookmarked",

    ]
    private let imageView = UIImageView(image: UIImage(named: "logo"))

    

    
    init(titles: [String], options: PageMenuOptions? = nil) {
       // self.items = items
       //
        super.init(options: options)
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)

    }
    
  


    override func viewDidLoad() {
        
        
        self.edgesForExtendedLayout = []
        
        if options.layout == .layoutGuide && options.tabMenuPosition == .bottom {
            self.view.backgroundColor = .blue
        } else {
            self.view.backgroundColor = .white
        }
        
        if self.options.tabMenuPosition == .custom {
            self.view.addSubview(self.tabMenuView)
            self.tabMenuView.translatesAutoresizingMaskIntoConstraints = false
            
            self.tabMenuView.heightAnchor.constraint(equalToConstant: self.options.menuItemSize.height).isActive = true
            self.tabMenuView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
            self.tabMenuView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
            if #available(iOS 11.0, *) {
                self.tabMenuView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
            } else {
                self.tabMenuView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
            }
        }
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self 
        // Do any additional setup after loading the view.
        setupUI()
    }
    private func setupUI() {
        
        
        // Initial setup for image for Large NavBar state since the the screen always has Large NavBar once it gets opened
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(named: "Rectangle"), for: UIBarMetrics.default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "Rectangle-560-Copy Copy"), style: .plain, target: self, action: #selector(menuButtonTapped(sender:)))
        navigationItem.rightBarButtonItem?.tintColor = .white
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
    @objc func menuButtonTapped(sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondViewController = storyboard.instantiateViewController(withIdentifier: "menuViewController") as! SideMenuViewController
        self.present(secondViewController, animated: true, completion: nil)


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

}


extension PMenuViewController: PageMenuControllerDataSource {
    
    func viewControllers(forPageMenuController pageMenuController: PageMenuController) -> [UIViewController] {
        print("Hello word")
        
                let vc1: HomeViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: HomeViewController.self)) as! HomeViewController
        
                
        
                let vc2: VideoViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: VideoViewController.self)) as! VideoViewController
        
                
     
                let vc3: SearchViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: SearchViewController.self)) as! SearchViewController
        
                
        
                let vc4: BookmarkViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: BookmarkViewController.self)) as! BookmarkViewController

        let viewControllers: [UIViewController] = [vc1, vc2, vc3, vc4]
        
        return viewControllers
    }
    
    func menuTitles(forPageMenuController pageMenuController: PageMenuController) -> [String] {
        
        return self.titles
    }
    
    func defaultPageIndex(forPageMenuController pageMenuController: PageMenuController) -> Int {
        return 0
    }
}
extension PMenuViewController: PageMenuControllerDelegate {
    func pageMenuController(_ pageMenuController: PageMenuController, didScrollToPageAtIndex index: Int, direction: PageMenuNavigationDirection) {
        // The page view controller will begin scrolling to a new page.
        print("didScrollToPageAtIndex index:\(index)")
    }
    
    func pageMenuController(_ pageMenuController: PageMenuController, willScrollToPageAtIndex index: Int, direction: PageMenuNavigationDirection) {
        // The page view controller scroll progress between pages.
        print("willScrollToPageAtIndex index:\(index)")
    }
    
    func pageMenuController(_ pageMenuController: PageMenuController, scrollingProgress progress: CGFloat, direction: PageMenuNavigationDirection) {
        // The page view controller did complete scroll to a new page.
        print("scrollingProgress progress: \(progress)")
    }
    
    func pageMenuController(_ pageMenuController: PageMenuController, didSelectMenuItem index: Int, direction: PageMenuNavigationDirection) {
        print("didSelectMenuItem index: \(index)")
    }
}
