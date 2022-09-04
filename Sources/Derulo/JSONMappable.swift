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
