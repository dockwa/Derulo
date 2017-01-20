//
//  JSON.swift
//  Derulo
//
//  Created by Christian Hatch on 1/19/17.
//
//


import Foundation


//MARK: - JSON

public typealias JSONKey = String
public typealias JSONValue = Any


///JSON is the foundational type of Derulo. It is a Swift representation of a text-based JSON object.
public typealias JSON = [JSONKey : JSONValue]



public func == (lhs: JSON, rhs: JSON) -> Bool {
    let leftDict = NSDictionary(dictionary: lhs)
    let rightDict = NSDictionary(dictionary: rhs)
    return leftDict == rightDict
}




public func += <K, V> (left: inout [K:V], right: [K:V]) {
    for (k, v) in right {
        left.updateValue(v, forKey: k)
    }
}
