//
//  GoOnCourseViewController.swift
//  ITEA_Diploma
//
//  Created by Alex Marfutin on 5/27/19.
//  Copyright © 2019 ITEA. All rights reserved.
//

import UIKit
import SCLAlertView
import MessageUI

enum Filter {
    case LeftBanch
    case RightBanch
}

class GoOnCourseViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate, MFMailComposeViewControllerDelegate {

    @IBOutlet var leftCheckAroundView: UIView!
    @IBOutlet var leftCheckInsideView: UIView!
    @IBOutlet var rightCheckAroundView: UIView!
    @IBOutlet var rightCheckInsideView: UIView!
    @IBOutlet var acseptRulesImage: UIImageView!
    @IBOutlet var nameSurnameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var phoneTextField: UITextField!
    @IBOutlet var comentTextView: UITextView!
    
    var filter = Filter.LeftBanch
    var rulesFlag = false
    var bodyEmailRequest : String?
    var courseName : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        InitViewFrame()
        nameSurnameTextField.delegate = self
        emailTextField.delegate = self
        phoneTextField.delegate = self
        comentTextView.delegate = self
        phoneTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingDidBegin)
        self.hideKeyboardWhenTappedAround()
        ChangeFilter(filter: filter)
    }
    
    @IBAction func leftBanchCheckButtonTapped(_ sender: Any) {
        filter = .LeftBanch
        ChangeFilter(filter: filter)
    }
    
    @IBAction func rightBanchCheckButtonTapped(_ sender: Any) {
        filter = .RightBanch
        ChangeFilter(filter: filter)
    }
    
    @IBAction func goOnCourseButtonTapped(_ sender: Any) {
        if(CheckTextFieldByRules()) {
            let MCViewController = configureMailController()
            if(MFMailComposeViewController.canSendMail()) {
                self.present(MCViewController, animated: true, completion: nil)
                navigationController?.popViewController(animated: true)
            }
        }
    }
    
    @IBAction func acseptRulesButtonTapped(_ sender: Any) {
        if(rulesFlag == false) {
            acseptRulesImage.image = UIImage(imageLiteralResourceName: "acsept-icon")
            rulesFlag = true
        } else {
             acseptRulesImage.image = nil
            rulesFlag = false
        }
    }
    
    @IBAction func backBarButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func InitViewFrame() {
        leftCheckInsideView.clipsToBounds = true
        leftCheckInsideView.layer.cornerRadius = leftCheckInsideView.frame.width / 2 - 1
        leftCheckAroundView.clipsToBounds = true
        leftCheckAroundView.layer.cornerRadius = leftCheckAroundView.frame.width / 2 - 1
        leftCheckAroundView.layer.borderWidth = 2
        rightCheckInsideView.clipsToBounds = true
        rightCheckInsideView.layer.cornerRadius = rightCheckInsideView.frame.width / 2 - 1
        rightCheckAroundView.clipsToBounds = true
        rightCheckAroundView.layer.cornerRadius = rightCheckAroundView.frame.width / 2 - 1
        rightCheckAroundView.layer.borderWidth = 2
    }
    
    func CheckTextFieldByRules() -> Bool {
        var flag = false
        if(nameSurnameTextField.text!.isEmpty || emailTextField.text!.isEmpty || phoneTextField.text!.isEmpty) {
            Alert(text: "Не все поля заполнены! Заполните все поля!")
        } else if(!emailTextField.text!.contains("@")) {
            Alert(text: "Некоректный email! Введите правильный email для продолжения!")
        } else if(rulesFlag == false) {
            Alert(text: "Вы не приняли Политику конфеденциальности! Подтвердите согласие!")
        } else if(phoneTextField.text?.count != 13) {
            Alert(text: "Неправильно введен номер телефона! Укажите рабочий номер телефона в формате 13 цифр!")
        } else {
            flag = true
        }
        return flag
    }
    
    func Alert(text : String) {
        let alertView = SCLAlertView()
        alertView.iconTintColor = UIColor.red
        alertView.showInfo("Error!", subTitle: text)
    }
    
    func ChangeFilter(filter : Filter) {
        if(filter == .LeftBanch) {
                rightCheckInsideView.backgroundColor = UIColor.white
                leftCheckInsideView.backgroundColor = UIColor.green
        } else {
            leftCheckInsideView.backgroundColor = UIColor.white
            rightCheckInsideView.backgroundColor = UIColor.green
        }
    }
    
    @objc private func textFieldDidChange(textField: UITextField) {
        if(textField.text!.isEmpty) {
            textField.text = "+380"
        }
    }
    
    func configureMailController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        var location = String()
        mailComposerVC.mailComposeDelegate = self
        mailComposerVC.setToRecipients(["alexmarfutin@gmail.com"])
        mailComposerVC.setSubject("New request to course")
        if(filter == .LeftBanch) {
            location = "Левый берег"
        } else {
            location = "Правый берег"
        }
        bodyEmailRequest = "<h2>New request to course : <font color='blue'>\(courseName!)</font></h2><br><h3>Person email :<font color='blue'> \(emailTextField.text!)</font><br>Person Name and Surname:<font color='blue'> \(nameSurnameTextField.text!)</font><br> Contact phone:<font color='blue'> \(phoneTextField.text!)</font><br>Selected location:<font color='blue'> \(location)</font><br>Persons coment:<font color='blue'> \(comentTextView.text!)</font></h3>"
        mailComposerVC.setMessageBody(bodyEmailRequest!, isHTML: true)
        return mailComposerVC
    }
    
    func showMailError() {
        Alert(text: "Your device could not send email!")
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        if(result == .failed) {
            Alert(text: "Your device could not send email! Error : \(error.debugDescription)")
        } else if(result == .sent) {
            let alertView = SCLAlertView()
            alertView.iconTintColor = UIColor.green
            alertView.showInfo("Поздравляем!", subTitle: "Вы успешно подали заявку! Наши менеджеры приступили к рассмотрению вашей заявки. С вами свяжутся в ближайшее время")
        }
        self.dismiss(animated: true, completion: nil)
    }
}
