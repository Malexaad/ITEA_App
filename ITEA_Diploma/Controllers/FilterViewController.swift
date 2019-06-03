//
//  FilterViewController.swift
//  ITEA_Diploma
//
//  Created by Alex Marfutin on 5/27/19.
//  Copyright © 2019 ITEA. All rights reserved.
//

import UIKit

enum CourseFilterByTime {
    case daily
    case evening
}
enum CourseFilterByType {
    case development
    case managment
    case sale
    case organisable
}

class FilterViewController: UIViewController{
    //Inside Filer View
    @IBOutlet var dailyView: UIView!
    @IBOutlet var eveningView: UIView!
    @IBOutlet var developmentView: UIView!
    @IBOutlet var managmentView: UIView!
    @IBOutlet var saleView: UIView!
    @IBOutlet var organisableView: UIView!
     //Around Frame Filter View
    @IBOutlet var dailyAroundView: UIView!
    @IBOutlet var eveningAroundView: UIView!
    @IBOutlet var developmentAroundView: UIView!
    @IBOutlet var managmentAroundView: UIView!
    @IBOutlet var saleAroundView: UIView!
    @IBOutlet var organisableAroundView: UIView!
    
    var filterByTime : CourseFilterByTime?
    var filterByType : CourseFilterByType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        InitViewFrames()
        CheckViewSelectedRules(filterTime: filterByTime, filterType: filterByType)
    }
    
    func CheckViewSelectedRules(filterTime : CourseFilterByTime? , filterType : CourseFilterByType?) {
        if(filterTime == nil && filterType != nil) {
            switch(filterType!) {
                case .development:
                    SetViewColorByType(view: developmentView)
                case .managment:
                    SetViewColorByType(view: managmentView)
                case .sale:
                    SetViewColorByType(view: saleView)
                case .organisable:
                    SetViewColorByType(view: organisableView)
            }
        } else if(filterType == nil && filterTime != nil) {
            switch(filterTime!) {
                case .daily:
                    SetViewColorByTime(view: dailyView)
                case .evening:
                    SetViewColorByTime(view: eveningView)
            }
        } else if(filterType != nil && filterTime != nil) {
            if(filterTime == .daily) {
                SetViewColorByTime(view: dailyView)
                switch(filterType!) {
                case .development:
                    SetViewColorByType(view: developmentView)
                case .managment:
                    SetViewColorByType(view: managmentView)
                case .sale:
                    SetViewColorByType(view: saleView)
                case .organisable:
                    SetViewColorByType(view: organisableView)
                }
            } else {
                SetViewColorByTime(view: eveningView)
                switch(filterType!) {
                case .development:
                    SetViewColorByType(view: developmentView)
                case .managment:
                    SetViewColorByType(view: managmentView)
                case .sale:
                    SetViewColorByType(view: saleView)
                case .organisable:
                    SetViewColorByType(view: organisableView)
                }
            }
        }
    }
    //By time Filter Group
    @IBAction func dailyCheckTapped(_ sender: Any) {
        filterByTime = .daily
        CheckViewSelectedRules(filterTime: filterByTime, filterType: filterByType)
        SetFilter(filterByTime: filterByTime, filterByType: filterByType)
    }
    
    @IBAction func eveningCheckTapped(_ sender: Any) {
        filterByTime = .evening
        CheckViewSelectedRules(filterTime: filterByTime, filterType: filterByType)
        SetFilter(filterByTime: filterByTime, filterByType: filterByType)
    }
    // By type Filter Group
    @IBAction func developmentCheckTapped(_ sender: Any) {
        filterByType = .development
        CheckViewSelectedRules(filterTime: filterByTime, filterType: filterByType)
        SetFilter(filterByTime: filterByTime, filterByType: filterByType)
    }
    
    @IBAction func managmentCheckTapped(_ sender: Any) {
        filterByType = .managment
        CheckViewSelectedRules(filterTime: filterByTime, filterType: filterByType)
        SetFilter(filterByTime: filterByTime, filterByType: filterByType)
    }
    
    @IBAction func saleCheckTapped(_ sender: Any) {
        filterByType = .sale
        CheckViewSelectedRules(filterTime: filterByTime, filterType: filterByType)
        SetFilter(filterByTime: filterByTime, filterByType: filterByType)
    }
    
    @IBAction func organisableCheckTapped(_ sender: Any) {
       filterByType = .organisable
        CheckViewSelectedRules(filterTime: filterByTime, filterType: filterByType)
        SetFilter(filterByTime: filterByTime, filterByType: filterByType)
    }
    
    func SetViewColorByTime(view : UIView?) {
        dailyView.backgroundColor = .white
        eveningView.backgroundColor = .white
        view?.backgroundColor = .green
    }
    
    func SetViewColorByType(view : UIView?) {
        developmentView.backgroundColor = .white
        managmentView.backgroundColor = .white
        saleView.backgroundColor = .white
        organisableView.backgroundColor = .white
        view?.backgroundColor = .green
    }
    
    func SetFilter(filterByTime : CourseFilterByTime?, filterByType : CourseFilterByType?) {
        if let nv = self.navigationController {
            let vc = nv.viewControllers[1] as! CoursesViewController
            vc.filterByTime = filterByTime
            vc.filterByType = filterByType
        }
    }
    
    func InitViewFrames() {
        //Set inside check view
        dailyView.clipsToBounds = true
        dailyView.layer.cornerRadius = dailyView.frame.width / 2 - 1
        eveningView.clipsToBounds = true
        eveningView.layer.cornerRadius = eveningView.frame.width / 2 - 1
        developmentView.clipsToBounds = true
        developmentView.layer.cornerRadius = developmentView.frame.width / 2 - 1
        managmentView.clipsToBounds = true
        managmentView.layer.cornerRadius = managmentView.frame.width / 2 - 1
        saleView.clipsToBounds = true
        saleView.layer.cornerRadius = saleView.frame.width / 2 - 1
        organisableView.clipsToBounds = true
        organisableView.layer.cornerRadius = organisableView.frame.width / 2 - 1
        //Set around check view
        dailyAroundView.clipsToBounds = true
        dailyAroundView.layer.cornerRadius = dailyAroundView.frame.width / 2 - 1
        dailyAroundView.layer.borderWidth = 2
        eveningAroundView.clipsToBounds = true
        eveningAroundView.layer.cornerRadius = eveningAroundView.frame.width / 2 - 1
        eveningAroundView.layer.borderWidth = 2
        developmentAroundView.clipsToBounds = true
        developmentAroundView.layer.cornerRadius = developmentAroundView.frame.width / 2 - 1
        developmentAroundView.layer.borderWidth = 2
        managmentAroundView.clipsToBounds = true
        managmentAroundView.layer.cornerRadius = managmentAroundView.frame.width / 2 - 1
        managmentAroundView.layer.borderWidth = 2
        saleAroundView.clipsToBounds = true
        saleAroundView.layer.cornerRadius = saleAroundView.frame.width / 2 - 1
        saleAroundView.layer.borderWidth = 2
        organisableAroundView.clipsToBounds = true
        organisableAroundView.layer.cornerRadius = organisableAroundView.frame.width / 2 - 1
        organisableAroundView.layer.borderWidth = 2
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clearFilterBarButtonTapped(_ sender: Any) {
        filterByTime = nil
        filterByType = nil
        dailyView.backgroundColor = .white
        eveningView.backgroundColor = .white
        developmentView.backgroundColor = .white
        managmentView.backgroundColor = .white
        saleView.backgroundColor = .white
        organisableView.backgroundColor = .white
        SetFilter(filterByTime: nil, filterByType: nil)
    }
}
