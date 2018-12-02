//
//  AuthViewController.swift
//  tinder-analytics
//
//  Created by Franklin Ye on 11/14/18.
//  Copyright © 2018 Franklin Ye. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class AuthViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var backgroundView: UIView!
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var mindInput: UITextField!
    @IBOutlet weak var energyInput: UITextField!
    @IBOutlet weak var natureInput: UITextField!
    @IBOutlet weak var tacticsInput: UITextField!
    @IBOutlet weak var identityInput: UITextField!
    
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    var username: String = ""
    var userMind: String = ""
    var userEnergy: String = ""
    var userNature: String = ""
    var userTactics: String = ""
    var userIdentity: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundView.backgroundColor = primary
        headerLabel.textColor = tertiary
        subView.backgroundColor = tertiary
        subView.layer.cornerRadius = 5;
        subView.layer.masksToBounds = true
        enterButton.layer.cornerRadius = 5;
        enterButton.layer.masksToBounds = true
        backButton.layer.cornerRadius = 5;
        backButton.layer.masksToBounds = true
        
        setButtonState(button: self.enterButton, status: false)
        setButtonState(button: self.backButton, status: false)
        
        self.usernameField.delegate = self
        usernameField.placeholder = "First Name"
        self.mindInput.delegate = self
        mindInput.placeholder = "Mind"
        self.energyInput.delegate = self
        energyInput.placeholder = "Energy"
        self.natureInput.delegate = self
        natureInput.placeholder = "Nature"
        self.tacticsInput.delegate = self
        tacticsInput.placeholder = "Tactics"
        self.identityInput.delegate = self
        identityInput.placeholder = "Identity"
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
    @IBAction func enterButtonPressed(_ sender: Any) {
        for textfield in [mindInput, energyInput, natureInput, tacticsInput, identityInput] {
            textFieldDidEndEditing(textfield!)
            if textfield?.text == nil {
                let alert = UIAlertController(title: "No thread selected", message: "You must select a thread to post your snap to.", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return
            }
        }
        inputUserTraits(userID: (Auth.auth().currentUser?.uid)!, name: username, mind: Int(userMind)!, energy: Int(userEnergy)!, nature: Int(userNature)!, tactics: Int(userTactics)!, identity: Int(userIdentity)!, completion: {()->Void in
            self.performSegue(withIdentifier: "authToTabs", sender: nil)
        })
        
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "authToLogin", sender: nil)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        setButtonState(button: self.enterButton, status: true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == self.usernameField {
            if textField.text != nil {
                self.username = textField.text!
            }
        } else if textField == self.mindInput {
            if textField.text != nil {
                self.userMind = textField.text!
            }
        } else if textField == self.energyInput {
            if textField.text != nil {
                self.userEnergy = textField.text!
            }
        } else if textField == self.natureInput {
            if textField.text != nil {
                self.userNature = textField.text!
            }
        } else if textField == self.tacticsInput {
            if textField.text != nil {
                self.userTactics = textField.text!
            }
        } else if textField == self.identityInput {
            if textField.text != nil {
                self.userIdentity = textField.text!
            }
        }
    }
    
    
}
