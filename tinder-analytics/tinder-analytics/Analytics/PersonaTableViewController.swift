//
//  PersonaTableViewController.swift
//  tinder-analytics
//
//  Created by Franklin Ye on 11/14/18.
//  Copyright © 2018 Franklin Ye. All rights reserved.
//

import UIKit
import ChameleonFramework

class PersonaTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell", for: indexPath) as! HistoryTableViewCell
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
        return cell
    }
}
