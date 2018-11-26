//
//  AnalyticsTableViewController.swift
//  tinder-analytics
//
//  Created by Franklin Ye on 11/14/18.
//  Copyright © 2018 Franklin Ye. All rights reserved.
//

import Foundation
import UIKit
import ChameleonFramework

class AnalyticsTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var analyticsTable: UITableView!
    @IBOutlet var backgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        analyticsTable.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "analyticsCell", for: indexPath) as! AnalyticsTableViewCell
        //        if let post = getPostFromIndexPath(indexPath: indexPath) {
        //            if post.read {
        //                cell.readImageView.image = UIImage(named: "read")
        //            }
        //            else {
        //                cell.readImageView.image = UIImage(named: "unread")
        //            }
        //            cell.usernameLabel.text = post.username
        //            cell.timeElapsedLabel.text = post.getTimeElapsedString()
        //        }
        print("cell name")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "analyticsToPersona", sender: nil)
        //        if let post = getPostFromIndexPath(indexPath: indexPath), !post.read {
        //            presentPostImage(forPost: post)
        //            post.read = true
        //
        //            // Adding the selected post as one of the current user's read posts
        //            currentUser.addNewReadPost(postID: post.postId)
        //
        //            // Reloading the cell that the user tapped so the unread/read image updates
        //            tableView.reloadRows(at: [indexPath], with: .automatic)
        //        }
        
    }
    
    
}
