//
//  RootViewController.swift
//  Arabian Business
//
//  Created by Nessrine on 8/1/19.
//  Copyright © 2019 com.NessrineHafi. All rights reserved.
//

import UIKit
import Swift_PageMenu
class RootViewController: UITableViewController, UIGestureRecognizerDelegate {
    let tabTitles: [String] = [
        "Featured",
        "video",
        "Search",
        "Bookmarked",
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self


    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = self.tabTitles[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            let pageViewController = PMenuViewController(
                
                titles: tabTitles,
                options: UnderlinePagerOption())
            
           // pageViewController.navigationItem.title = self.titles[indexPath.row]
            self.navigationController?.pushViewController(pageViewController, animated: true)
        } else if indexPath.row == 1 {
            
            let pageViewController = PMenuViewController(
                titles: tabTitles,
                options: UnderlinePagerOption())
            
            pageViewController.navigationItem.title = self.tabTitles[indexPath.row]
            self.navigationController?.pushViewController(pageViewController, animated: true)
        } else if indexPath.row == 2 {
            let pageViewController = PMenuViewController(
            
                titles: tabTitles,
                options: UnderlinePagerOption(isInfinite: true))
            
          //  pageViewController.navigationItem.title = self.titles[indexPath.row]
            self.navigationController?.pushViewController(pageViewController, animated: true)
        } else if indexPath.row == 3 {
            let pageViewController = PMenuViewController(
          
                titles: tabTitles,
                options: UnderlinePagerOption(isInfinite: true))
            
         //   pageViewController.navigationItem.title = self.titles[indexPath.row]
            self.navigationController?.pushViewController(pageViewController, animated: true)
        } else if indexPath.row == 4 {
            let pageViewController = PMenuViewController(
            
                titles: tabTitles,
                options: UnderlinePagerOption(isInfinite: true))
            
           // pageViewController.navigationItem.title = self.titles[indexPath.row]
            self.navigationController?.pushViewController(pageViewController, animated: true)
        } else if indexPath.row == 5 {
            let pageViewController = PMenuViewController(
                titles: tabTitles,
                options: UnderlinePagerOption(isInfinite: true))
         //   pageViewController.navigationItem.title = self.titles[indexPath.row]
            self.navigationController?.pushViewController(pageViewController, animated: true)
        }
    }

  

}
