//
//  CoursesViewController.swift
//  ITEA_Diploma
//
//  Created by Alex Marfutin on 5/27/19.
//  Copyright © 2019 ITEA. All rights reserved.
//

import UIKit

class CoursesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var courseTableView: UICollectionView!
    
    var profile : User?
    var coursesList = [Course]()
    var coursesListFiltered = [Course]()
    var courseManger = CourseManager()
    var filterByTime : CourseFilterByTime?
    var filterByType : CourseFilterByType?
    
    override func viewDidLoad() {
        self.navigationController?.navigationBar.isHidden = true
        super.viewDidLoad()
        courseTableView.delegate = self
        courseTableView.dataSource = self
        coursesList = courseManger.GetCourseList()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        courseTableView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FilterCourseList(filterTime: filterByTime, filterType: filterByType).count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "reusItem", for: indexPath) as! CoursesCollectionViewCell
        item.courseImage.image = UIImage(imageLiteralResourceName: FilterCourseList(filterTime: filterByTime, filterType: filterByType)[indexPath.row].courseImage)
        return item
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: courseTableView.frame.size.width/2 - 5, height: courseTableView.frame.size.width/2 - 10)
    }
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboardCategory = UIStoryboard(name: "IteaCoursesApp", bundle: nil)
        let vc = storyboardCategory.instantiateViewController(withIdentifier: "CourseCategoryViewController") as! CourseCategoryViewController
        vc.subCategories = FilterCourseList(filterTime: filterByTime, filterType: filterByType)[indexPath.row].courseCategory
        vc.courseName = FilterCourseList(filterTime: filterByTime, filterType: filterByType)[indexPath.row].courseName
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func onFilterbuttonTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "FilterViewController") as! FilterViewController
        vc.filterByType = self.filterByType
        vc.filterByTime = self.filterByTime
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func FilterCourseList(filterTime : CourseFilterByTime? , filterType : CourseFilterByType?) -> [Course] {
        if(filterTime == nil && filterType != nil) {
            switch(filterType!) {
            case .development:
                return coursesList.filter({$0.type == .development})
            case .managment:
                return coursesList.filter({$0.type == .managment})
            case .sale:
                return coursesList.filter({$0.type == .sale})
            case .organisable:
                return coursesList.filter({$0.type == .organisable})
            }
        } else if(filterType == nil && filterTime != nil) {
            switch(filterTime!) {
            case .daily:
                return coursesList.filter({$0.time == .daily})
            case .evening:
               return coursesList.filter({$0.time == .evening})
            }
        } else if(filterType != nil && filterTime != nil) {
            if(filterTime == .daily) {
                switch(filterType!) {
                case .development:
                    return coursesList.filter({$0.type == .development}).filter({$0.time == .daily})
                case .managment:
                    return coursesList.filter({$0.type == .managment}).filter({$0.time == .daily})
                case .sale:
                    return coursesList.filter({$0.type == .sale}).filter({$0.time == .daily})
                case .organisable:
                    return coursesList.filter({$0.type == .organisable}).filter({$0.time == .daily})
                }
            } else {
                switch(filterType!) {
                case .development:
                    return coursesList.filter({$0.type == .development}).filter({$0.time == .evening})
                case .managment:
                    return coursesList.filter({$0.type == .managment}).filter({$0.time == .evening})
                case .sale:
                    return coursesList.filter({$0.type == .sale}).filter({$0.time == .evening})
                case .organisable:
                    return coursesList.filter({$0.type == .organisable}).filter({$0.time == .evening})
                }
            }
        } else {
            return coursesList
        }
    }
    
    @IBAction func onMyProfileButtonTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        vc.profile = self.profile
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
