//
//  LoginViewController.swift
//  ITEA_Diploma
//
//  Created by Alex Marfutin on 5/27/19.
//  Copyright © 2019 ITEA. All rights reserved.
//

import UIKit
import SCLAlertView

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var userNameText: UITextField!
    @IBOutlet var userPasswordText: UITextField!
    
    @IBOutlet var loginViewButton: UIButton!
    
    var userManger = UserManager()
    var usersList = [User]()
    var profile : User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        userPasswordText.delegate = self
        userPasswordText.delegate = self
        self.hideKeyboardWhenTappedAround()
        usersList = userManger.GetUsers()
        loginViewButton.translatesAutoresizingMaskIntoConstraints = false
        loginViewButton.layer.cornerRadius = 15
    }
    
    @IBAction func onLoginButtonTapped(_ sender: Any) {
        if(CheckLoginData(username: userNameText.text!, password: userPasswordText.text!)) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "CoursesViewController") as! CoursesViewController
            vc.profile = self.profile
        self.navigationController?.pushViewController(vc, animated: true)
        } 
    }
    
    func CheckLoginData(username : String, password : String) -> Bool {
        var flag = false
        if(userNameText.text!.isEmpty || userPasswordText.text!.isEmpty) {
            Alert(text: "Field are empty! Please try again!")
        } else {
            for user in usersList {
                if(userNameText.text == user.username) {
                    if(user.password == userPasswordText.text) {
                        flag = true
                        profile = user
                    } else {
                        Alert(text: "Wrong Password!")
                        break
                    }
                }
            }
        }
        return flag
    }
    
    func Alert(text : String) {
        let alertView = SCLAlertView()
        alertView.iconTintColor = UIColor.red
        alertView.showInfo("Error", subTitle: text)
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
