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
    
    var about : String?
    var after : String?
    var more : String?
    var courseName : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.navigationController?.navigationBar.isHidden = true
        aboutTextView.text = about
        if(after != nil) {
            afterCourseTextView.text = AfterCourseTextFormating(text: after!)
        } else {
            afterCourseTextView.text = ""
        }
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
        vc.courseName = self.courseName
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func moreButtonTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "MoreViewController") as! MoreViewController
        if more != nil {
            vc.moreAboutCourseText = more
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
