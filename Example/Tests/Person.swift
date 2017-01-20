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
}

extension Person: JSONMappable {
    
    init?(json: JSON?) {
        guard let json = json else { return nil }
        
        guard let id = IntToStringTransform().transform(fromJSON: json["id"])
        else {
            print(#function, String(describing: Person.self), "JSON missing required properties")
            return nil
        }
        
        self.identifier = id
        self.name = json["name"] as? String ?? "No Name"
    }
}


extension Person: JSONConvertible {
    
    var asJSON: JSON {
        var json = JSON()
        json["id"] = identifier
        json["name"] = name
        return json
    }
}


extension Person: JSONModel {}


extension Person: JSONPersistable {
    
    var asPersistenceJSON: JSON {
        return asJSON
    }
}










