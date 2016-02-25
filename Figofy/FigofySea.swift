//
//  FigofySea.swift
//  Figofy
//
//  Created by Mohammed Joseph Petrelli Salameh on 24/02/16.
//  Copyright © 2016 Tommy. All rights reserved.
//

import Foundation

class FigofySea {
    
    private var _seaPostKey: String!
    private var _seaName: String!
    private var _seaAddress: String?
    private var _seaStreetName: String!
    private var _seaStreetNumber: Int!
    private var _seaZipCode: Int!
    private var _seaCity: String!
    private var _seaCoverImgUrl: String?
    private var _seaProfileImgUrl: String?
    
    
    var seaName: String {
        return _seaName
    }
    
    var fullAddress: String? {
        return "\(_seaStreetName) \(_seaStreetNumber),\(_seaZipCode) \(_seaCity)"
    }
    
    var seaStreetName: String {
        return _seaStreetName
    }
    
    var seaStreetNumber: Int {
        return _seaStreetNumber
    }
    
    var seaZipCode: Int {
        return _seaZipCode
    }
    
    var seaCity: String {
        return _seaCity
    }
    
    var seaCoverImgUrl: String? {
        return _seaCoverImgUrl
    }
    
    var seaProfileImgUrl: String? {
        return _seaProfileImgUrl
    }
    
    init(name: String, streetName: String, streetNumber: Int, zipCode: Int, city: String) {
        self._seaName = name
        self._seaStreetName = streetName
        self._seaStreetNumber = streetNumber
        self._seaZipCode = zipCode
        self._seaCity = city
    }
    
    
    init(postKey: String, dictionary: Dictionary<String, AnyObject>) {
        self._seaPostKey = postKey
        
        if let name = dictionary["name"] as? String {
            self._seaName = name
        }
        
        if let address = dictionary["address"] as? Dictionary<String, AnyObject> {
            if let streetName = address["street"] as? String {
                self._seaStreetName = streetName
            }
            if let streetNumber = address["number"] as? Int {
                self._seaStreetNumber = streetNumber
            }
            if let zipCode = address["zipCode"] as? Int {
                self._seaZipCode = zipCode
            }
            if let city = address["city"] as? String {
                self._seaCity = city
            }
        }
    }
    
    
}