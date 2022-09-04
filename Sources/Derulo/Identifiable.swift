import Foundation

//MARK: - Identifiable

public typealias Identifier = String

///Indicates the object has a String property called `identifier` that is unique amongst objects. Helpful for objects coming back from an API.
public protocol Identifiable {
    var identifier: Identifier { get }
}

///Equality for Identifiable objects.
public func == (lhs: Identifiable, rhs: Identifiable) -> Bool {
    return lhs.identifier == rhs.identifier
}
