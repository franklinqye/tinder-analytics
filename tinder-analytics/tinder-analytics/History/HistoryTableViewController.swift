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

class HistoryTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet var backgroundView: UIView!
    @IBOutlet weak var historyTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.historyTable.delegate = self
        self.historyTable.dataSource = self

        backgroundView.backgroundColor = tertiary
    }
    
    override func viewWillAppear(_ animated: Bool) {
        historyTable.reloadData()
        //updateData() firebase
    }
    
//    func updateData() {
//        getPosts(user: currentUser) { (posts) in
//            print("Updating data to table...")
//            if let posts = posts {
//                clearThreads()
//                for post in posts {
//                    print("adding post:")
//                    print(post)
//                    print("Read?")
//                    print(post.read)
//                    print("-")
//                    addPostToThread(post: post)
//                    getDataFromPath(path: post.postImagePath, completion: { (data) in
//                        print("getting post data:")
//                        print(data)
//                        if let data = data {
//                            if let image = UIImage(data: data) {
//                                self.loadedImagesById[post.postId] = image
//                            }
//                        }
//                    })
//                }
//                self.postTableView.reloadData()
//            }
//            print("END Updating data to table...")
//        }
//    }
    
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "historySelect", sender: nil)
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

