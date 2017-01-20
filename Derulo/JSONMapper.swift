//
//  JSONMapper.swift
//  Derulo
//
//  Created by Christian Hatch on 1/19/17.
//
//

import Foundation


//MARK: - JSONMapper

///JSONMapper allows you to create objects and Arrays of objects from JSON.
struct JSONMapper<T: JSONMappable> {
    
    func map(json: JSON?) -> T? {
        guard let json = json else { return nil }
        return JSONMapper<T>().map(json: json)
    }
    
    func map(json: JSON) -> T? {
        let mapped = T(json: json)
        return mapped
    }
    
    
    func mapArray(json: [JSON]?) -> [T]? {
        guard let json = json else { return nil }
        if json.isEmpty { return [] }
        let mapped = json.flatMap{T(json: $0)}
        return mapped
    }
}

