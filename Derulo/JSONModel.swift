//
//  JSONModel.swift
//  Derulo
//
//  Created by Christian Hatch on 1/19/17.
//
//

import Foundation


//MARK: - JSONModel

///JSONModel is a composite type that is Identifiable and can be created from and transformed into JSON.
protocol JSONModel: Identifiable, JSONMappable, JSONConvertible {}


