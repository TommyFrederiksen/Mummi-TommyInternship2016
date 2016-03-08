//
//  Fish.swift
//  Figofy
//
//  Created by Mohammed Joseph Petrelli Salameh on 02/03/16.
//  Copyright © 2016 Tommy. All rights reserved.
//

import Foundation
import Firebase

class Fish {
    
    enum Species: Int, CustomStringConvertible {
        case Laks = 0, Ørred, GuldLaks, Torsk, Hvilling, Kuller, Lange
        
        static var count: Int {return Lange.rawValue + 1}
        
        static var array = [Laks,Ørred,GuldLaks,Torsk,Hvilling,Kuller,Lange]
        
        var description: String {
            switch self {
            case Laks: return "Laks"
            case Ørred: return "Ørred"
            case GuldLaks: return "GuldLaks"
            case Torsk: return "Torsk"
            case Hvilling: return "Hvilling"
            case Kuller: return "Kuller"
            case Lange: return "Lange"
            }
        }
        
        var value: Int {
            switch self {
            case .Laks: return 0
            case .Ørred: return 1
            case .GuldLaks: return 2
            case .Torsk: return 3
            case .Hvilling: return 4
            case .Kuller: return 5
            case .Lange: return 6
            }
        }
        
        init?(value: Int) {
            switch value {
            case 0 : self = .Laks
            case 1 : self = .Ørred
            case 2 : self = .GuldLaks
            case 3 : self = .Torsk
            case 4 : self = .Hvilling
            case 5 : self = .Kuller
            case 6 : self = .Lange
            default : return nil
            }
        }
    }
    
    private var _fishPostKey: String!
    private var _imageStr: String?
    private var _length: Int!
    private var _weight: Int!
    private var _species: Species!
    private var _bait: String!
    private var _method: String!
    private var _note: String!
    private var _fishRef: Firebase!
    
    var imageStr: String? {
        return _imageStr
    }
    
    var length: Int {
        return _length
    }
    
    var weight: Int {
        return _weight
    }
    
    var species: Species {
        return _species
    }
    
    var bait: String {
        return _bait
    }
    
    var method: String {
        return _method
    }
    
    var note: String {
        return _note
    }
    
    var fishPostKey: String {
        return _fishPostKey
    }
    
    init(imageStr: String, length: Int, weight: Int, species: Species) {
        self._imageStr = imageStr
        self._length = length
        self._weight = weight
        self._species = species
    }
    
    
    init(postKey: String, dictionary: Dictionary<String,AnyObject>) {
        self._fishPostKey = postKey
        
        if let imgStr = dictionary["imageStr"] as? String {
            self._imageStr = imgStr
        }
        
        if let length = dictionary["length"] as? Int {
            self._length = length
        }
        
        if let kind = dictionary["species"] as? Species {
            self._species = kind
        }
        
        if let weight = dictionary["weight"] as? Int {
            self._weight = weight
        }
        
        if let catched = dictionary["catched"] as? Dictionary<String, AnyObject> {
            
            if let bait = catched["bait"] as? String {
                self._bait = bait
            }
            
            if let method = catched["method"] as? String {
                self._method = method
            }
            
            if let note = catched["note"] as? String {
                self._note = note
            }
        }
    }
    
}