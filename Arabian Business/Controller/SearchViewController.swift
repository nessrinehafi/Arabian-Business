
//
//  SearchViewController.swift
//  Arabian Business
//
//  Created by Nessrine on 7/24/19.
//  Copyright © 2019 com.NessrineHafi. All rights reserved.
//

import UIKit
import NightNight
class SearchViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource  {
    
    
    
    let section = ["GCC" , "INDUSTRIES" , "PROPERTY" , "OPINION" , "LIFESTYLE" , "GALLERY" , "LISTS" , "MARKETS"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 14
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.row == 0)
        {
            let cell = Bundle.main.loadNibNamed("SearchTableViewCell", owner: self, options: nil)?.first as! SearchTableViewCell
            
            
            return cell
            
        }
        else if (indexPath.row == 1)
        {
            let cell = Bundle.main.loadNibNamed("FeaturedLabelTableViewCell", owner: self, options: nil)?.first as! FeaturedLabelTableViewCell
            
            return cell
            
            
        }
        else if (indexPath.row == 2)
        {
            let cell = Bundle.main.loadNibNamed("SearchFeaturesTableViewCell", owner: self, options: nil)?.first as! SearchFeaturesTableViewCell

            return cell
            
            
        }
        else if (indexPath.row == 3)
        {
            let cell = Bundle.main.loadNibNamed("SectionLabelTableViewCell", owner: self, options: nil)?.first as! SectionLabelTableViewCell
            
            return cell
            
            
        }
        else if (indexPath.row == 4) {
           
            let cell = Bundle.main.loadNibNamed("SectionsTableViewCell", owner: self, options: nil)?.first as! SectionsTableViewCell
                cell.sectionLabel.text = section[0]
                return cell
                
            }
        else if (indexPath.row == 5) {
            
            let cell = Bundle.main.loadNibNamed("SectionsTableViewCell", owner: self, options: nil)?.first as! SectionsTableViewCell
            cell.sectionLabel.text = section[1]
            return cell
            
        }
        else if (indexPath.row == 6) {
            
            let cell = Bundle.main.loadNibNamed("SectionsTableViewCell", owner: self, options: nil)?.first as! SectionsTableViewCell
            cell.sectionLabel.text = section[2]
            return cell
            
        }
            
        else if (indexPath.row == 7) {
            
            let cell = Bundle.main.loadNibNamed("SectionsTableViewCell", owner: self, options: nil)?.first as! SectionsTableViewCell
            cell.sectionLabel.text = section[3]
            return cell
            
        }
            
        else if (indexPath.row == 8) {
            
            let cell = Bundle.main.loadNibNamed("SectionsTableViewCell", owner: self, options: nil)?.first as! SectionsTableViewCell
            cell.sectionLabel.text = section[4]
            return cell
            
        }
            
        else if (indexPath.row == 9) {
            
            let cell = Bundle.main.loadNibNamed("SectionsTableViewCell", owner: self, options: nil)?.first as! SectionsTableViewCell
            cell.sectionLabel.text = section[5]
            return cell
            
        }
            
        else if (indexPath.row == 10) {
            
            let cell = Bundle.main.loadNibNamed("SectionsTableViewCell", owner: self, options: nil)?.first as! SectionsTableViewCell
            cell.sectionLabel.text = section[6]
            return cell
            
        }
        else {
            let cell = Bundle.main.loadNibNamed("SectionsTableViewCell", owner: self, options: nil)?.first as! SectionsTableViewCell
            cell.sectionLabel.text = section[7]
            cell.selectionStyle = UITableViewCell.SelectionStyle.none

            return cell
        }

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.row == 0)
        {
            return 44
            
        }
        else if (indexPath.row == 1)
        {
            
            return 58
            
            
        }
        else if (indexPath.row == 2)
        {
            
            return 200
            
            
        }
        else if (indexPath.row == 3)
        {
            
            return 58
            
            
        }
        else{
            
            return 58
        }
    }
    
    @IBOutlet weak var searchTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTableView.delegate = self
        searchTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let additionalSeparatorThickness = CGFloat(1)
        let additionalSeparator = UIView(frame: CGRect(x: 0,
                                                       y: cell.frame.size.height - additionalSeparatorThickness,
                                                       width: cell.frame.size.width,
                                                       height: additionalSeparatorThickness))
        additionalSeparator.mixedBackgroundColor = MixedColor(normal: UIColor(red: 233/255, green: 233/255, blue: 233/255, alpha: 1), night: UIColor(red: 31/255, green: 33/255, blue: 36/255, alpha: 1))
        cell.addSubview(additionalSeparator)
    }
 
}
