//
//  VideoViewController.swift
//  Arabian Business
//
//  Created by Nessrine on 8/5/19.
//  Copyright © 2019 com.NessrineHafi. All rights reserved.
//

import UIKit

class VideoViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource  {
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondViewController = storyboard.instantiateViewController(withIdentifier: "VideoDisplayerViewController") as! VideoDisplayerViewController
        secondViewController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        secondViewController.modalTransitionStyle = UIModalTransitionStyle.crossDissolve

        self.present(secondViewController, animated: true, completion: nil)
    }
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("VideosTableViewCell", owner: self, options: nil)?.first as! VideosTableViewCell
        cell.selectionStyle = UITableViewCell.SelectionStyle.none

        
        return cell
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      
            return 406
      
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
