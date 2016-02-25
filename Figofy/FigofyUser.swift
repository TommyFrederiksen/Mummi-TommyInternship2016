//
//  FigofyUser.swift
//  Figofy
//
//  Created by Mohammed Joseph Petrelli Salameh on 24/02/16.
//  Copyright © 2016 Tommy. All rights reserved.
//

import Foundation

enum Gender: String {
    case Female = "female"
    case Male = "Male"
}

class FigofyUser {
    
    
    // MARK: Variables
    private var _firstName: String!
    private var _middleName: String?
    private var _lastName: String!
    private var _gender: Gender!
    private var _birthday: NSDate
    private var _dateCreated: NSDate
    
    
    var userFirstName: String {
        return _firstName
    }
    
    var userMiddleName: String? {
        return _middleName
    }
    
    var userLastName: String {
        return _lastName
    }
    
    var userGender: String {
        return _gender.rawValue
    }
    
    var userBirthday: NSDate {
        return _birthday
    }
    
    
    
    var userMemberLength: NSDate {
        return _dateCreated
    }
    
    
    
    init(firstname: String, lastname: String, gender: Gender, birthday: NSDate) {
        self._firstName = firstname
        self._lastName = lastname
        self._gender = gender
        self._birthday = birthday
        self._dateCreated = NSDate()
    }
    
    
    
    // MARK: Custom Methods
    func ageFromBirthday(birthday: NSDate) -> Int {
        return 1
    }
    
    
    
}