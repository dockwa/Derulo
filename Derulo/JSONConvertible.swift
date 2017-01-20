//
//  JSONConvertible.swift
//  Derulo
//
//  Created by Christian Hatch on 1/19/17.
//
//

import Foundation


//MARK: - JSONConvertible

///JSONConvertible indicates the object can be converted into JSON.
protocol JSONConvertible {
    var asJSON: JSON { get }
}
