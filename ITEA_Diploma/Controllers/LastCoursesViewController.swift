//
//  LastCoursesViewController.swift
//  ITEA_Diploma
//
//  Created by Alex Marfutin on 5/27/19.
//  Copyright © 2019 ITEA. All rights reserved.
//

import UIKit

class LastCoursesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var lastCourseTableView: UITableView!
    
    var lastCoursesList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lastCourseTableView.delegate = self
        lastCourseTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lastCoursesList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 147
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lastCell") as! LastCourseTableViewCell
        cell.lastCourseNameLabel.text = lastCoursesList[indexPath.row]
        return cell
    }
    
    @IBAction func backBarButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
