//
//  UserManager.swift
//  ITEA_Diploma
//
//  Created by Alex Marfutin on 5/27/19.
//  Copyright © 2019 ITEA. All rights reserved.
//

import Foundation
import UIKit

class UserManager {
    
    var userList = [User]()
    
    func GetUsers() -> [User] {
        userList.append(User(username: "Alex", password: "qwerty", name: "Alex", surname: "Virskiy", age: "21", city: "Kyiv", birthday: "22.11.93", email: "alexvirskiy@ukr.net", phone: "0667895432", currentCourse: "IOS", workPlacwe: "None", userFoto: UIImage(imageLiteralResourceName: "alex-icon"), lastCourses: ["C# Base","C# Adventure"]))
        userList.append(User(username: "Boris", password: "asdfgh", name: "Boris", surname: "Kornev", age: "23", city: "Vinniza", birthday: "06.07.91", email: "boriska32@ukr.net", phone: "0987653421", currentCourse: "C++", workPlacwe: "IT Snap", userFoto: UIImage(imageLiteralResourceName: "boris-icon"), lastCourses: ["C++ Base"]))
        userList.append(User(username: "Pavel", password: "zxcvbn", name: "Pavel", surname: "Konoval", age: "19", city: "Kharkiv", birthday: "17.09.97", email: "pavelkon87@gmail.com", phone: "0734568906", currentCourse: "C#", workPlacwe: "Studing", userFoto: UIImage(imageLiteralResourceName: "pavel-icon"), lastCourses: ["IOS Base","IOS Adventure","PHP base"]))
        return userList
    }
}
