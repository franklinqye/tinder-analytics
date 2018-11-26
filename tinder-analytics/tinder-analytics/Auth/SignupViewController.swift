//
//  SignupViewController.swift
//  tinder-analytics
//
//  Created by Franklin Ye on 11/14/18.
//  Copyright © 2018 Franklin Ye. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var backgroundView: UIView!
    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var userPasswordField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    var username: String = ""
    var password: String = ""
    var password2: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundView.backgroundColor = primary
        header.textColor = tertiary
        subView.backgroundColor = tertiary
        subView.layer.cornerRadius = 5;
        subView.layer.masksToBounds = true
        signupButton.layer.cornerRadius = 5;
        signupButton.layer.masksToBounds = true
        backButton.layer.cornerRadius = 5;
        backButton.layer.masksToBounds = true
        
        setButtonState(button: self.signupButton, status: false)
        setButtonState(button: self.backButton, status: false)
        
        self.usernameField.delegate = self
        self.userPasswordField.delegate = self
        
    }
    
    @IBAction func signupButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "signupToAuth", sender: nil)
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "signupToLogin", sender: nil)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        setButtonState(button: self.signupButton, status: true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == self.usernameField {
            if textField.text != nil {
                self.username = textField.text!
            }
        } else if textField == self.userPasswordField {
            if textField.text != nil {
                self.password = textField.text!
            }
        }
    }
    
}
