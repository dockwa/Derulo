//
//  PersistenceJSONConverter.swift
//  Pods
//
//  Created by Christian Hatch on 1/19/17.
//
//

import Foundation


///A JSONConverter for persisting objects to disk. Converts the object to JSON or a JSON array.
struct PersistenceJSONConverter<T: JSONPersistable>: JSONConverter {
    
    func json(fromObject: T?) -> JSON? {
        guard let object = fromObject else { return nil }
        return object.asPersistenceJSON
    }
    
    func json(fromObject: T) -> JSON {
        return fromObject.asPersistenceJSON
    }
    
    
    func jsonArray(fromArray: [T]?) -> [JSON]? {
        guard let array = fromArray else { return nil }
        if array.isEmpty { return [] }
        let mapped = array.map{$0.asPersistenceJSON}
        return mapped
    }
}
