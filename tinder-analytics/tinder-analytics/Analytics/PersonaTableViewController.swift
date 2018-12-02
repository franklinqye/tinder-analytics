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
    
    @IBOutlet weak var personaMatchTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.personaMatchTable.delegate = self
        self.personaMatchTable.dataSource = self
        
        view.backgroundColor = tertiary
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personaCell", for: indexPath) as! PersonaTableViewCell
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
