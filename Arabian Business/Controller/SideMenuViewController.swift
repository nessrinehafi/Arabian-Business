//
//  SideMenuViewController.swift
//  Arabian Business
//
//  Created by Nessrine on 7/23/19.
//  Copyright © 2019 com.NessrineHafi. All rights reserved.
//

import UIKit

class SideMenuViewController: UITableViewController {
    @IBOutlet var menuTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
//        menuTableView.sectionIndexBackgroundColor = .blue

        
    }
    

    @IBAction func dissmissDidTapButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    


}
