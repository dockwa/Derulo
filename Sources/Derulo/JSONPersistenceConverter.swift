import Foundation

///Helper for persisting objects to disk. Converts the object to JSON or a JSON array.
public struct JSONPersistenceConverter<T: JSONPersistable>: JSONConversionHelper {
    public init() {}

    public func json(fromObject: T?) -> JSON? {
        guard let object = fromObject else { return nil }
        return object.asPersistenceJSON
    }
    
    public func json(fromObject: T) -> JSON {
        fromObject.asPersistenceJSON
    }
    
    public func jsonArray(fromArray: [T]?) -> [JSON]? {
        guard let array = fromArray else { return nil }
        if array.isEmpty { return [] }
        let mapped = array.map{$0.asPersistenceJSON}
        return mapped
    }
}
