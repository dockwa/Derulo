//
//  JSONTransformers.swift
//  Derulo
//
//  Created by Christian Hatch on 1/19/17.
//
//

import Foundation


//MARK: - JSON Helpers

///A JSONTransform is a uniform way to represent a helper that transforms a native JSON type to a Swift type
protocol JSONTransform {
    associatedtype ObjectType
    associatedtype JSONType
    
    func transform(fromJSON value: Any?) -> ObjectType?
    func transform(toJSON value: ObjectType?) -> JSONType?
}



struct IntToStringTransform: JSONTransform {
    typealias ObjectType = String
    typealias JSONType = Int
    
    
    func transform(fromJSON value: Any?) -> String? {
        
        guard let value = value else {
            return nil
        }
        
        let string = "\(value)"
        return string
    }
    
    func transform(toJSON value: String?) -> Int? {
        
        guard let value = value else {
            return nil
        }
        
        let number = Int(value)
        return number
    }
}
