//
//  SignupViewController.swift
//  tinder-analytics
//
//  Created by Franklin Ye on 11/14/18.
//  Copyright © 2018 Franklin Ye. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

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
        usernameField.placeholder = "Email"
        self.userPasswordField.delegate = self
        userPasswordField.placeholder = "Password"
        
    }
    
    @IBAction func signupButtonPressed(_ sender: Any) {
        guard let email = usernameField.text else { return }
        guard let password = userPasswordField.text else { return }
        if email == "" || password == "" {
            let alertController = UIAlertController(title: "Form Error.", message: "Please fill in form completely.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            
        } else {
            Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                if error == nil {
                    // TO DO:
                    // The user account has been successfully created. Now, update the user's name in
                    // firebase and then perform a segue to the main page. Note, again, that this segue
                    // already exists somewhere, just do some simple debugging to find the identifier.
                    // Also, notify the user that the account has been successfully created before
                    // performing the segue.
                    let changeRequest = user?.user.createProfileChangeRequest()
//                    changeRequest?.displayName = email
                    changeRequest?.commitChanges { (error) in
                        if error == nil {
                            //make user in db
                            let dbRef = Database.database().reference()
                            let newNode = dbRef.child("Users/\(user!.user.uid)")
                            newNode.child("Users")
                            //make user in db
                            
                            let alertController = UIAlertController(title: "Success!", message: "Sucessfully signed up", preferredStyle: .alert)
                            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: {(_) in self.performSegue(withIdentifier: "signupToAuth", sender: nil)})
                            alertController.addAction(defaultAction)
                            self.present(alertController, animated: true, completion: nil)
                        } else {
                            let alertController = UIAlertController(title: "Error", message: "User Name not updated", preferredStyle: .alert)
                            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                            alertController.addAction(defaultAction)
                            self.present(alertController, animated: true, completion: nil)
                        }
                    }
                    
                } else {
                    let alertController = UIAlertController(title: "Sign Up Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
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
