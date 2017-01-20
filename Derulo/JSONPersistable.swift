//
//  JSONPersistable.swift
//  Derulo
//
//  Created by Christian Hatch on 1/19/17.
//
//

import Foundation


///JSONPersistable indicates that the object can be persisted to and restored from disk.
protocol JSONPersistable: JSONMappable {
    var asPersistenceJSON: JSON { get }
}
