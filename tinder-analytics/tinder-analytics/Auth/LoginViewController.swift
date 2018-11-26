//
//  LoginViewController.swift
//  tinder-analytics
//
//  Created by Franklin Ye on 11/14/18.
//  Copyright © 2018 Franklin Ye. All rights reserved.
//

import UIKit
import ChameleonFramework

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var backgroundView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    var username: String = ""
    var userPassword: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.usernameField.delegate = self
        self.passwordField.delegate = self
        
        loginButton.layer.cornerRadius = 5;
        loginButton.layer.masksToBounds = true
        signupButton.layer.cornerRadius = 5;
        signupButton.layer.masksToBounds = true
        self.hasAccount(status: false)
        
        backgroundView.backgroundColor = primary
        subView.backgroundColor = tertiary
        subView.layer.cornerRadius = 5;
        subView.layer.masksToBounds = true
        titleLabel.textColor = tertiary
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        performSegue(withIdentifier: "loginToAuth", sender: nil)
    }
    
    @IBAction func signupPressed(_ sender: Any) {
        performSegue(withIdentifier: "loginToSignup", sender: nil)
    }
    
    func hasAccount(status stat:Bool) {
        if stat {
            setButtonState(button: self.loginButton, status: true)
            setButtonState(button: self.signupButton, status: false)
        } else {
            setButtonState(button: self.loginButton, status: false)
            setButtonState(button: self.signupButton, status: true)
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        hasAccount(status: true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == self.usernameField {
            if textField.text != nil {
                self.username = textField.text!
            }
        } else {
            if textField.text != nil {
                self.userPassword = textField.text!
            }
        }
    }
    
}
