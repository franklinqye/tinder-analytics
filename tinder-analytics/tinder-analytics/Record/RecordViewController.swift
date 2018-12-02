//
//  RecordViewController.swift
//  tinder-analytics
//
//  Created by Franklin Ye on 11/28/18.
//  Copyright © 2018 Franklin Ye. All rights reserved.
//

import UIKit
import ChameleonFramework
import FirebaseAuth
import FirebaseDatabase

class RecordViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var info: UILabel!
    @IBOutlet weak var displayImage: UIImageView!
    @IBOutlet weak var subView: UIView!
    
    @IBOutlet weak var leftArrow: UIImageView!
    @IBOutlet weak var leftNumber: UIImageView!
    @IBOutlet weak var upArrow: UIImageView!
    @IBOutlet weak var upNumber: UIImageView!
    @IBOutlet weak var rightArrow: UIImageView!
    @IBOutlet weak var rightNumber: UIImageView!

    
    var image: UIImage?
    
    var currentID = ""
    let userID = (Auth.auth().currentUser?.uid)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        leftArrow.image = UIImage(named: "left")
        leftNumber.image = UIImage(named: "zero")
        upArrow.image = UIImage(named: "up")
        upNumber.image = UIImage(named: "two")
        rightArrow.image = UIImage(named: "right")
        rightNumber.image = UIImage(named: "one")
        
        view.backgroundColor = primary
        subView.backgroundColor = tertiary
        getNextUID(user: userID, currentID: "", completion: {(id)-> Void in
            getPosts(userID: id, completion: self.refresh)
        })
        
        
    }
    
    func refresh(id: String, name: String, info: PersonalityPackage, images: UIImage?) {
        print("currentID is now \(id)")
        currentID = id
        self.name.text = name
        self.info.text = "\(info.personalityAccromyn):\n\(info.personalityDescription)"
        if let safeImage = images {
            self.displayImage.image = safeImage
        }
    }
    
    @IBAction func swipedRight(_ sender: Any) {
        print("swipeped right")
        let test = sender as! UISwipeGestureRecognizer
        print(test.direction)
        rankProfile(origUserID: userID, destUserID: currentID, rank: 1)
        //pop next in queue
        getNextUID(user: userID, currentID: currentID, completion: {id->Void in
            getPosts(userID: id, completion: self.refresh)
        })
    }
    
    @IBAction func swipedLeft(_ sender: Any) {
        print("swipeped left")
        let test = sender as! UISwipeGestureRecognizer
        print(test.direction)
        rankProfile(origUserID: userID, destUserID: currentID, rank: 0)
        //pop next in queue
        getNextUID(user: userID, currentID: currentID, completion: {id->Void in
            getPosts(userID: id, completion: self.refresh)
        })
    }
    
    @IBAction func swipedUp(_ sender: Any) {
        print("swipeped up")
        let test = sender as! UISwipeGestureRecognizer
        print(test.direction)
        rankProfile(origUserID: userID, destUserID: currentID, rank: 2)
        //pop next in queue
        getNextUID(user: userID, currentID: currentID, completion: {id->Void in
            getPosts(userID: id, completion: self.refresh)
        })
    }
    
    @IBAction func swipedrright(_ sender: Any) {
        print("swipeped rrrrright!")
        let test = sender as! UISwipeGestureRecognizer
        print(test.direction)
        rankProfile(origUserID: userID, destUserID: currentID, rank: 1)
        //pop next in queue
        getNextUID(user: userID, currentID: currentID, completion: {id->Void in
            getPosts(userID: id, completion: self.refresh)
        })
    }
    
}


