//
//  ProfileViewController.swift
//  tinder-analytics
//
//  Created by Franklin Ye on 11/14/18.
//  Copyright © 2018 Franklin Ye. All rights reserved.
//

import UIKit
import ChameleonFramework
import FirebaseAuth


class ProfileViewController: UIViewController, UITextViewDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var personality: UILabel!
    @IBOutlet weak var subheaderView: UIView!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var textBox: UITextView!
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var button: UIButton!
    
    var bioText = ""
    let userID = (Auth.auth().currentUser?.uid)!
    
    var imagePickerController : UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textBox.delegate = self
        personality.text = formatPersonality()
        
        view.backgroundColor = primary
        headerView.backgroundColor = primary
        subheaderView.backgroundColor = secondary
        titleLabel.textColor = tertiary
        subTitle.textColor = tertiary
        buttonView.backgroundColor = primary
        button.tintColor = tertiary
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getPosts(userID: userID, completion: self.refresh)
    }

    func refresh(id: String, name: String, info: PersonalityPackage, images: UIImage?) {
        self.titleLabel.text = name
        self.personality.text = "\(info.personalityAccromyn)"
        self.textBox.text = "\(info.personalityDescription)"
        if let safeImage = images {
            print("got image")
            self.profilePic.image = safeImage
        }
    }
    
    func formatPersonality() -> String {
        return ""
    }
    
    @IBAction func updateProfile(_ sender: Any) {
        imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .camera
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imagePickerController.dismiss(animated: true, completion: nil)
        profilePic.image = info[UIImagePickerController.InfoKey.originalImage.rawValue] as? UIImage
        
    }
    
}
