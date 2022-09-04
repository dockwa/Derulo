import Foundation

///Indicates that the object can be persisted to and restored from disk.
public protocol JSONPersistable: JSONMappable {
    var asPersistenceJSON: JSON { get }
}
