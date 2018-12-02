//
//  LoginViewController.swift
//  tinder-analytics
//
//  Created by Franklin Ye on 11/14/18.
//  Copyright © 2018 Franklin Ye. All rights reserved.
//

import UIKit
import ChameleonFramework
import FirebaseAuth

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
        usernameField.placeholder = "Email"
        self.passwordField.delegate = self
        passwordField.placeholder = "Password"
        
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
        
        guard let emailText = usernameField.text else { return }
        guard let passwordText = passwordField.text else { return }
        
        if emailText == "" || passwordText == "" {
            //Alert to tell the user that there was an error because they didn't fill anything in the textfields
            let alertController = UIAlertController(title: "Log In Error", message: "Please enter an email and password.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        else {
            // email and password fields are not blank, let's try logging in the user!
            // you'll need to use `emailText` and `passwordText`, and a method found in this
            // api doc https://firebase.google.com/docs/auth/ios/start
            Auth.auth().signIn(withEmail: emailText, password: passwordText) { (user, error) in
                if error == nil {
                    self.performSegue(withIdentifier: "loginToAuth", sender: nil)
                } else {
                    let alertController = UIAlertController(title: "Log In Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
            // if the error == nil, segue to the main page using `performSegue` with identifier
            // `segueLogInToMainPage`
            // if there is an error signing in (error != nil), present the following alert:
            
            //    let alertController = UIAlertController(title: "Log In Error", message:
            //                        error?.localizedDescription, preferredStyle: .alert)
            //    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            //    alertController.addAction(defaultAction)
            //    self.present(alertController, animated: true, completion: nil)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //YOUR CODE HERE
//        if let _ = Auth.auth().currentUser {
//            performSegue(withIdentifier: "loginToTabs", sender: nil)
//        }
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
