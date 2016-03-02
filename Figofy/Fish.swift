//
//  Fish.swift
//  Figofy
//
//  Created by Mohammed Joseph Petrelli Salameh on 02/03/16.
//  Copyright © 2016 Tommy. All rights reserved.
//

import Foundation

class Fish {
    
    enum Species: Int {
        case Laks = 0, Ørred, GuldLaks, Torsk, Hvilling, Kuller, Lange
        
        static var count: Int {return Lange.rawValue + 1}
        
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
    
    var fishPostKey: String {
        return _fishPostKey
    }
    
    init(imageStr: String, length: Int, weight: Int, species: Species) {
        self._imageStr = imageStr
        self._length = length
        self._weight = weight
        self._species = species
    }
    
    
    init(postKey: String,imageStr: String, length: Int, weight: Int, species: Species) {
        // TODO: POST TO FIREBASE
        
    }
    
}