//
//  Utilities.swift
//  tinder-analytics
//
//  Created by Franklin Ye on 11/28/18.
//  Copyright © 2018 Franklin Ye. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

//takes in a ranking of one user on another and store it in the original user's history
let dbRef = Database.database().reference()
let storageRef = Storage.storage().reference()

func rankProfile(origUserID: String, destUserID: String, rank: Int) {
    
//    let data = UIImageJPEGRepresentation(postImage, 1.0)
    
    let postDict: [String:AnyObject] = ["userID": destUserID as AnyObject, "rank": rank as AnyObject,]
    // YOUR CODE HERE
    let newRef = dbRef.child("History/\(origUserID)").childByAutoId()
    
    newRef.setValue(postDict)
}

//takes in name & 5 user traits and saves them to profile
func inputUserTraits(userID: String, name: String, mind: Int, energy: Int, nature: Int, tactics: Int, identity: Int, completion: @escaping ()->Void) {
    let postDict: [String:AnyObject] = ["mind": mind as AnyObject, "energy": energy as AnyObject, "nature": nature as AnyObject, "tactics": tactics as AnyObject, "identity": identity as AnyObject]
    // YOUR CODE HERE
    
    
    let newPersonalityRef = dbRef.child("Profiles/\(userID)/personality")
    newPersonalityRef.setValue(postDict)
    let newNameRef = dbRef.child("Profiles/\(userID)/name")
    newNameRef.setValue(name)
    
    let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
    changeRequest?.displayName = name
    changeRequest?.commitChanges { (error) in
        completion()
    }
}

//takes in uid and returns profile in a dict
func getPosts(userID: String, completion: @escaping (String, String, PersonalityPackage, UIImage?) -> Void) {
    dbRef.child("Profiles/\(userID)").observeSingleEvent(of: .value, with: { snapshot -> Void in
        
        if snapshot.exists() {
            
            if let value = snapshot.value as? [String:AnyObject] {
                //test
                //get the images
                let storageRef = Storage.storage().reference()
                storageRef.child("Images/\(userID)").getData(maxSize: 5 * 1024 * 1024) { (data, error) in
                    if let error = error {
                        print(error)
                    }
                    print(data)
                    let name = value["name"] as! String
                    
                    let personalityNode = value["personality"] as! [String:Int]
                    let personalityPackage = formatePersonality(mind: personalityNode["mind"]!, energy: personalityNode["energy"]!, nature: personalityNode["nature"]!, tactics: personalityNode["tactics"]!, identity: personalityNode["identity"]!)
                    print(value)
                    if let data = data  {
                        completion(userID, name, personalityPackage, UIImage(data: data)!)
                    } else {
                        completion(userID, name, personalityPackage, nil)
                    }
                }
            } else {
                print("not a dict")
            }
        } else {
            print("dne")
        }
    })
}

// get next UID to swipe on
func getNextUID(user: String, currentID: String, completion: @escaping (String) -> Void) {
    dbRef.child("Profiles").observeSingleEvent(of: .value, with: { snapshot -> Void in
        
        if snapshot.exists() {
            
            if let value = snapshot.value as? [String:AnyObject] {
                print("currently with userID:\(user) and currentID:\(currentID):")
                let keys = value.keys.shuffled()
                for id in keys {
                    print("lookins at (\(id))")
                    if id != user && id != currentID {
                        print("score!")
                        completion(id)
                        return
                    }
                }
                print("no more id's left")
            } else {
                print("not a dict")
                completion("")
            }
        } else {
            print("dne")
            completion("")
        }
    })
}

//calls a compeltions on each record of a user's history
func appendHistory(userID: String, completion: @escaping (Record) -> Void) {
    dbRef.child("History/\(userID)").observeSingleEvent(of: .value, with: { snapshot -> Void in

        if snapshot.exists() {

            if let value = snapshot.value as? [String:AnyObject] {
                print("value")
                print(value)
                for key in value.keys {
                    let historyNode = (value[key] as! [String: AnyObject])
                    let profileID = historyNode["userID"] as! String
                    generateRecord(profileID: profileID,  completion: {(name, personality)->Void in
                        let rank = historyNode["rank"] as! Int
                        let picPath = "Images/\(historyNode["userID"]!)"
                        let record = Record(rank: rank, name: name, picPath: picPath, persona: personality)
                        completion(record)
                    })
                    
                }
                print("no more id's left")
            } else {
                print("not a dict")
            }
        } else {
            print("dne")
        }
    })
}

//generate a record given a profile's id and rank
func generateRecord(profileID: String, completion: @escaping (String, String) -> Void) {
    dbRef.child("Profiles/\(profileID)").observeSingleEvent(of: .value, with: { snapshot -> Void in
        if snapshot.exists() {
            
        if let value = snapshot.value as? [String:AnyObject] {
            let name = value["name"] as! String
            let personalityNode = value["personality"] as! [String:Int]
            let personalityPackage = formatePersonality(mind: personalityNode["mind"]!, energy: personalityNode["energy"]!, nature: personalityNode["nature"]!, tactics: personalityNode["tactics"]!, identity: personalityNode["identity"]!)
            completion(name, personalityPackage.personalityAccromyn)
            } else {
            print("not a dict")
            completion("", "")
            }
        } else {
            print("dne")
            completion("", "")
        }
    })
}

//take in a rank and return it's image
func rankImage(rank: Int) -> UIImage? {
    switch rank {
    case 0:
        return UIImage(named: "bronze")
    case 1:
        return UIImage(named: "silver")
    case 2:
        return UIImage(named: "gold")
    default:
        return nil
    }
}

func postImage(path: String, completion: @escaping ()->Void) {
    let data = (UIImage(named: "gold")!).jpegData(compressionQuality: 1.0)!
    let _ = storageRef.child(path).putData(data, metadata: nil) { metadata, error in
        guard let _ = metadata else {
            // Uh-oh, an error occurred!
            print(error!)
            return
        }
        completion()
        // Metadata contains file metadata such as size, content-type.
//        let size = metadata.size
        // You can also access to download URL after upload.
//        storageRef.downloadURL { (url, error) in
//            guard let downloadURL = url else {
//                // Uh-oh, an error occurred!
//                return
//            }
//            print("downloadURL")
//            print(downloadURL)
//        }
    }
}

func fetchImage(path: String, completion: @escaping (UIImage)->Void) {
    storageRef.child(path).getData(maxSize: 1 * 1024 * 1024) { data, error in
    if let error = error {
        print(error)
    } else {
        // Data for "images/island.jpg" is returned
        let image = UIImage(data: data!)!
        completion(image)
    }
}

}

