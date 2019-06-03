//
//  MoreViewController.swift
//  ITEA_Diploma
//
//  Created by Alex Marfutin on 5/27/19.
//  Copyright © 2019 ITEA. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController {

    @IBOutlet var moreTextView: UITextView!
    
    var moreAboutCourseText : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        if let more =  moreAboutCourseText {
            moreTextView.text = AfterCourseTextFormating(text: more)
        }
    }
    
    @IBAction func backBarButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func AfterCourseTextFormating(text : String) -> String {
        var modifyText = String()
        for line in text.split(separator: ";") {
            modifyText = "\(modifyText)\n * \(line)"
        }
        return modifyText
    }
}
