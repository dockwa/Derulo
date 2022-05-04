//
//  JSONMappable.swift
//  Derulo
//
//  Created by Christian Hatch on 1/19/17.
//
import Foundation

//MARK: - JSONMappable

///Indicates the object can be created from JSON
public protocol JSONMappable {
    init?(json: JSON?)
}

///Indicates the object can be created from a JSONEntry
public protocol JSONEntryMappable {
    init?(jsonEntry: JSONEntry?)
}
