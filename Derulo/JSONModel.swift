//
//  JSONModel.swift
//  Derulo
//
//  Created by Christian Hatch on 1/19/17.
//
//

import Foundation


//MARK: - JSONModel

///A composite type that is Identifiable and can be created from and transformed into JSON. Useful for objects that go to and from an API.
public protocol JSONModel: Identifiable, JSONMappable, JSONConvertible {}


