//
//  ProfileViewController.swift
//  ITEA_Diploma
//
//  Created by Alex Marfutin on 5/27/19.
//  Copyright © 2019 ITEA. All rights reserved.
//

import UIKit
import Foundation
class ProfileViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var userPhotoImage: UIImageView!
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var nameText: UITextField!
    @IBOutlet var surnameText: UITextField!
    @IBOutlet var ageText: UITextField!
    @IBOutlet var cityText: UITextField!
    @IBOutlet var birthdayText: UITextField!
    @IBOutlet var emailTextr: UITextField!
    @IBOutlet var phoneText: UITextField!
    @IBOutlet var currentCurseText: UITextField!
    @IBOutlet var workPlaceText: UITextField!
    
    var profile : User?
    var timeFlagList = ["Daily, Evening"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userPhotoImage.clipsToBounds = true
        userPhotoImage.layer.cornerRadius = 15
        nameText.delegate = self
        surnameText.delegate = self
        ageText.delegate = self
        cityText.delegate = self
        birthdayText.delegate = self
        emailTextr.delegate = self
        phoneText.delegate = self
        currentCurseText.delegate = self
        workPlaceText.delegate = self
        self.hideKeyboardWhenTappedAround()
        ShowProfileInfo()
    }
    
    @IBAction func onEditButtonTapped(_ sender: Any) {
        saveButton.isHidden = false
        ChangeFieldEditFlag(flag: true)
    }
    
    @IBAction func onSaveButtonTapped(_ sender: Any) {
        saveButton.isHidden = true
        profile = User(username: profile!.username, password: profile!.password, name: nameText.text!, surname: surnameText.text!, age: ageText.text!, city: cityText.text!, birthday: birthdayText.text!, email: emailTextr.text!, phone: phoneText.text!, currentCourse: currentCurseText.text!, workPlacwe: workPlaceText.text!, userFoto: profile!.userFoto, lastCourses: profile!.lastCourses)
        ChangeFieldEditFlag(flag: false)
    }
    
    func ChangeFieldEditFlag(flag : Bool) {
        nameText.isUserInteractionEnabled = flag
        surnameText.isUserInteractionEnabled = flag
        ageText.isUserInteractionEnabled = flag
        cityText.isUserInteractionEnabled = flag
        birthdayText.isUserInteractionEnabled = flag
        emailTextr.isUserInteractionEnabled = flag
        phoneText.isUserInteractionEnabled = flag
        currentCurseText.isUserInteractionEnabled = flag
        workPlaceText.isUserInteractionEnabled = flag
    }
    
    func ShowProfileInfo() {
        userPhotoImage.image = profile?.userFoto
        nameText.text = profile?.name
        surnameText.text = profile?.surname
        ageText.text = profile?.age
        cityText.text = profile?.city
        birthdayText.text = profile?.birthday
        emailTextr.text = profile?.email
        phoneText.text = profile?.phone
        currentCurseText.text = profile?.currentCourse
        workPlaceText.text = profile?.workPlacwe
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func lastCoursesButtonTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "LastCoursesViewController") as! LastCoursesViewController
        if let lastCourses = profile?.lastCourses {
        vc.lastCoursesList = lastCourses
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
