//
//  JSONConverter.swift
//  Derulo
//
//  Created by Christian Hatch on 1/19/17.
//
//

import Foundation



//MARK: - JSONConverter


///A JSONConverter allows you to create JSON objects and JSON arrays from JSONConvertible objects and arrays of JSONConvertible objects.
protocol JSONConverter {
    associatedtype T
    
    func json(fromObject: T?) -> JSON?
    func json(fromObject: T) -> JSON
    func jsonArray(fromArray: [T]?) -> [JSON]?
}


///Converts the object to JSON or a JSON array.
struct StandardJSONConverter<T: JSONConvertible>: JSONConverter {
    
    func json(fromObject: T?) -> JSON? {
        guard let object = fromObject else { return nil }
        return object.asJSON
    }
    
    func json(fromObject: T) -> JSON {
        return fromObject.asJSON
    }
    
    
    func jsonArray(fromArray: [T]?) -> [JSON]? {
        guard let array = fromArray else { return nil }
        if array.isEmpty { return [] }
        let mapped = array.map{$0.asJSON}
        return mapped
    }
}

