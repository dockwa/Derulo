//
//  JSON.swift
//  Derulo
//
//  Created by Christian Hatch on 1/19/17.
//
import Foundation

//MARK: - JSON

public typealias JSONKey = String
public typealias JSONEntry = Any

///JSON is the foundational type of Derulo. It is a Swift representation of a text-based JSON object.
public typealias JSON = [JSONKey : JSONEntry]

///Equality for JSON objects.
public func ==(lhs: JSON, rhs: JSON) -> Bool {
    let leftDict = NSDictionary(dictionary: lhs)
    let rightDict = NSDictionary(dictionary: rhs)
    return leftDict == rightDict
}

///Merges two JSON objects, adding or overwriting the left-hand JSON entries with values from the right-hand JSON.
public func += <K, V> (left: inout [K:V], right: [K:V]) {
    for (k, v) in right {
        left.updateValue(v, forKey: k)
    }
}
