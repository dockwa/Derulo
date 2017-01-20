//
//  Identifiable.swift
//  Derulo
//
//  Created by Christian Hatch on 1/19/17.
//
//

import Foundation


//MARK: - Identifiable

typealias Identifier = String


///Identifiable indicates the object has a String property called `identifier` that is unique amongst objects. Helpful for objects coming back from an API.
protocol Identifiable {
    var identifier: Identifier { get }
}


func == (lhs: Identifiable, rhs: Identifiable) -> Bool {
    return lhs.identifier == rhs.identifier
}