//
//  JSON.swift
//  Derulo
//
//  Created by Christian Hatch on 1/19/17.
//
//


import Foundation


//MARK: - JSON


typealias JSONKey = String
typealias JSONValue = Any


///JSON is the foundational type of Derulo. It is a Swift representation of a text-based JSON object.
typealias JSON = [JSONKey : JSONValue]



func == (lhs: JSON, rhs: JSON) -> Bool {
    let leftDict = NSDictionary(dictionary: lhs)
    let rightDict = NSDictionary(dictionary: rhs)
    return leftDict == rightDict
}
