//
//  HistoryTableViewController.swift
//  tinder-analytics
//
//  Created by Franklin Ye on 11/14/18.
//  Copyright © 2018 Franklin Ye. All rights reserved.
//

import Foundation
import ChameleonFramework
import UIKit
import FirebaseAuth

class HistoryTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet var backgroundView: UIView!
    @IBOutlet weak var historyTable: UITableView!
    
    var historyRecord:[Record] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateData()
        self.historyTable.delegate = self
        self.historyTable.dataSource = self

        backgroundView.backgroundColor = tertiary
    }
    
    override func viewWillAppear(_ animated: Bool) {
        historyRecord = []
        updateData()
    }
    
    func updateData() {
        appendHistory(userID: (Auth.auth().currentUser?.uid)!, completion: {record->Void in
            self.historyRecord.append(record)
            print("updeated \(record.name) to history")
            self.historyTable.reloadData()
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyRecord.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell", for: indexPath) as! HistoryTableViewCell
        if historyRecord.endIndex > indexPath.row {
            let record = historyRecord[indexPath.row]
            cell.name.text = record.name
            cell.date.text = record.persona
            cell.status.image = rankImage(rank: record.rank)
            fetchImage(path: record.picPath, completion: {(image)->Void in
                cell.profilePic.image = image
            })
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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

