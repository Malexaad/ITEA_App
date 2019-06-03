//
//  UserModel.swift
//  ITEA_Diploma
//
//  Created by Alex Marfutin on 5/27/19.
//  Copyright © 2019 ITEA. All rights reserved.
//

import Foundation
import UIKit

class User {
    
    var username : String
    var password : String
    var name : String
    var surname : String
    var age : String
    var city : String
    var birthday : String
    var email : String
    var phone : String
    var currentCourse :  String
    var workPlacwe : String
    var userFoto : UIImage
    var lastCourses : [String]
    
    init(username : String, password : String , name : String, surname : String, age : String, city : String, birthday : String, email : String, phone : String, currentCourse :  String, workPlacwe : String, userFoto : UIImage, lastCourses : [String]) {
        self.username = username
        self.password = password
        self.name = name
        self.surname = surname
        self.age = age
        self.city = city
        self.birthday = birthday
        self.email = email
        self.phone = phone
        self.currentCourse = currentCourse
        self.workPlacwe = workPlacwe
        self.userFoto = userFoto
        self.lastCourses = lastCourses
    }
}
