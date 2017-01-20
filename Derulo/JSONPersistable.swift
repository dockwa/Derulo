//
//  JSONPersistable.swift
//  Derulo
//
//  Created by Christian Hatch on 1/19/17.
//
//

import Foundation


///Indicates that the object can be persisted to and restored from disk.
public protocol JSONPersistable: JSONMappable {
    var asPersistenceJSON: JSON { get }
}
