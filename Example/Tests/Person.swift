//
//  Person.swift
//  Derulo
//
//  Created by Christian Hatch on 1/19/17.
//  
//

import Foundation
import Derulo

struct Person: Identifiable {
    let identifier: Identifier
    let name: String
    let favoriteSong: Song?
}

extension Person: JSONMappable {
    
    init?(json: JSON?) {
        guard let json = json else { return nil }
        
        guard let id = IntToStringTransform().transform(fromJSON: json["id"]) else {
            print(#function, String(describing: Person.self), "JSON missing required properties")
            return nil
        }
        
        self.identifier = id
        self.name = json["name"] as? String ?? "No Name"
        self.favoriteSong = Song(jsonEntry: json["fav_song"])
    }
}


extension Person: JSONConvertible {
    
    var asJSON: JSON {
        var json = JSON()
        json["id"] = IntToStringTransform().transform(toJSON: identifier)
        json["name"] = name
        
        if let favoriteSong = favoriteSong {
            json["fav_song"] = favoriteSong.asJSONEntry
        }
        return json
    }
}


extension Person: JSONModel {}


extension Person: JSONPersistable {
    
    var asPersistenceJSON: JSON {
        return asJSON
    }
}



enum Song: String {
    case wiggle
    case talkDirty
}


extension Song: JSONEntryMappable, JSONEntryConvertible {

    init?(jsonEntry: JSONEntry?) {
        guard let jsonEntry = jsonEntry as? String else { return nil }
        self.init(rawValue: jsonEntry)
    }
    
    var asJSONEntry: String {
        return rawValue
    }
}
























