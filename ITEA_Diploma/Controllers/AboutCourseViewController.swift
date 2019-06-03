//
//  AboutCourseViewController.swift
//  ITEA_Diploma
//
//  Created by Alex Marfutin on 5/27/19.
//  Copyright © 2019 ITEA. All rights reserved.
//

import UIKit

class AboutCourseViewController: UIViewController {

    @IBOutlet var aboutTextView: UITextView!
    @IBOutlet var afterCourseTextView: UITextView!
    @IBOutlet var aboutNavigationBar: UINavigationBar!
    
    var subCategories = [Category]()
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.navigationController?.navigationBar.isHidden = true
        setGuesterRecognizer()
        SetValueToFields(data: subCategories[index])
    }
    
    func AfterCourseTextFormating(text : String) -> String {
        var modifyText = String()
        for line in text.split(separator: ";") {
            modifyText = "\(modifyText)\n * \(line)"
        }
        return modifyText
    }
    
    @IBAction func backBarButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func goOnCourseButtonTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GoOnCourseViewController") as! GoOnCourseViewController
        vc.courseName = subCategories[index].categoryName
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func moreButtonTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "MoreViewController") as! MoreViewController
        vc.moreAboutCourseText = subCategories[index].more
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func setGuesterRecognizer(){
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeft(gesture:)))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeRight(gesture:)))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
    }
    
    @objc func swipeLeft(gesture: UISwipeGestureRecognizer) {
        if(index < subCategories.count - 1) {
            index = index + 1
            SetValueToFields(data: subCategories[index])
        }
    }
    
    @objc func swipeRight(gesture: UISwipeGestureRecognizer) {
        if(index > 0) {
            index = index - 1
            SetValueToFields(data: subCategories[index])
        }
    }
    
    func SetValueToFields(data : Category) {
        aboutTextView.text = data.about
        afterCourseTextView.text = AfterCourseTextFormating(text: data.afterCourse)
        aboutNavigationBar.topItem?.title = data.categoryName
    }
}
