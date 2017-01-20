//
//  JSONConvertible.swift
//  Derulo
//
//  Created by Christian Hatch on 1/19/17.
//
//

import Foundation


//MARK: - JSONConvertible

///Indicates the object can be converted into JSON.
public protocol JSONConvertible {
    var asJSON: JSON { get }
}


///Indicates the object can be converted into a JSONEntry inside a JSON object. Useful for when a property of a model is a native Swift object that needs to be represented inside the model's JSON.
public protocol JSONEntryConvertible {
    var asJSONEntry: String { get }
}
