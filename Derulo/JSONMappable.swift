//
//  JSONMappable.swift
//  Derulo
//
//  Created by Christian Hatch on 1/19/17.
//
//

import Foundation



//MARK: - JSONMappable

///JSONMappable indicates the object can be created from JSON
public protocol JSONMappable {
    init?(json: JSON?)
}
