//
//  AuthViewController.swift
//  tinder-analytics
//
//  Created by Franklin Ye on 11/14/18.
//  Copyright © 2018 Franklin Ye. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var backgroundView: UIView!
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var userPasswordField: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    var username: String = ""
    var userPassword: String = ""
    
    
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
        self.userPasswordField.delegate = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if false {
            performSegue(withIdentifier: "loginToTabs", sender: nil)
        }
    }
    
    @IBAction func enterButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "authToTabs", sender: nil)
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
        } else if textField == self.userPasswordField {
            if textField.text != nil {
                self.userPassword = textField.text!
            }
        }
    }
    
    
}
