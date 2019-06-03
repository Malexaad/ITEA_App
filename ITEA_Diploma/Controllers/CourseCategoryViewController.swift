//
//  CourseCategoryViewController.swift
//  ITEA_Diploma
//
//  Created by Alex Marfutin on 5/28/19.
//  Copyright © 2019 ITEA. All rights reserved.
//

import UIKit

class CourseCategoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var subNavigationBar: UINavigationItem!
    @IBOutlet var subCategoryTableView: UITableView!
    
    var subCategories = [Category]()
    var courseName : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        subCategoryTableView.delegate = self
        subCategoryTableView.dataSource = self
        subNavigationBar.title = courseName
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subCategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubCategoryCell") as! SubCategoryTableViewCell
        cell.courseNameLabel.text = subCategories[indexPath.row].categoryName
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 147
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "AboutCourseViewController") as! AboutCourseViewController
        vc.about = subCategories[indexPath.row].about
        vc.after = subCategories[indexPath.row].afterCourse
        vc.more = subCategories[indexPath.row].more
        vc.courseName = subCategories[indexPath.row].categoryName
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func backBarButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
