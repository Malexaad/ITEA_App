//
//  CourseModel.swift
//  ITEA_Diploma
//
//  Created by Alex Marfutin on 5/27/19.
//  Copyright © 2019 ITEA. All rights reserved.
//

import Foundation
import UIKit

class Course {
    
    var courseImage : String
    var courseName : String
    var courseCategory : [Category]
    var time : CourseFilterByTime
    var type : CourseFilterByType
    
    init(courseImage : String, courseName : String, courseCategory : [Category], time : CourseFilterByTime, type : CourseFilterByType) {
        self.courseImage = courseImage
        self.courseName = courseName
        self.courseCategory = courseCategory
        self.time = time
        self.type = type
    }
}

class Category {
    
    var categoryName : String
    var about : String
    var afterCourse : String
    var more : String
    
    init(categoryName : String, about : String, afterCourse : String, more : String) {
        self.categoryName = categoryName
        self.about = about
        self.afterCourse = afterCourse
        self.more = more
    }
}
