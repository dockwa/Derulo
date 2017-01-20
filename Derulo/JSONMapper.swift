//
//  JSONMapper.swift
//  Derulo
//
//  Created by Christian Hatch on 1/19/17.
//
//

import Foundation


//MARK: - JSONMapper

///Helps you to create objects and Arrays of objects from JSON.
public struct JSONMapper<T: JSONMappable> {
    public init() {}
    
    
    //MARK: - Map from JSON
    
    public func map(json: JSON?) -> T? {
        guard let json = json else { return nil }
        return JSONMapper<T>().map(json: json)
    }
    
    public func map(json: JSON) -> T? {
        let mapped = T(json: json)
        return mapped
    }
    
    
    //MARK: - Map from JSON Array
    
    public func mapArray(json: [JSON]?) -> [T]? {
        guard let json = json else { return nil }
        if json.isEmpty { return [] }
        let mapped = json.flatMap{T(json: $0)}
        return mapped
    }
    
    
    
    //MARK: - Map from Data
    
    public func map(data: Data?) -> T? {
        guard let data = data else { return nil }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? JSON
            return map(json: json)
        }
        catch {
            print(#function, "Couldn't create JSON from Data \(data)")
            return nil
        }
    }
    
    public func mapArray(data: Data?) -> [T]? {
        guard let data = data else { return nil }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [JSON]
            return mapArray(json: json)
        }
        catch {
            print(#function, "Couldn't create JSON from Data \(data)")
            return nil
        }
    }
}



















