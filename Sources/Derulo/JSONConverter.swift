import Foundation

//MARK: - JSONConverter

///Helps you to create JSON objects and JSON arrays from JSONConvertible objects and arrays of JSONConvertible objects.
public protocol JSONConversionHelper {
    associatedtype T

    func json(fromObject: T?) -> JSON?
    func json(fromObject: T) -> JSON
    func jsonArray(fromArray: [T]?) -> [JSON]?
}

///Converts the object to JSON or a JSON array.
public struct JSONConverter<T: JSONConvertible>: JSONConversionHelper {
    public init() {}

    public func json(fromObject: T?) -> JSON? {
        guard let object = fromObject else { return nil }
        return object.asJSON
    }

    public func json(fromObject: T) -> JSON {
        fromObject.asJSON
    }

    public func jsonArray(fromArray: [T]?) -> [JSON]? {
        guard let array = fromArray else { return nil }
        if array.isEmpty { return [] }
        let mapped = array.map{$0.asJSON}
        return mapped
    }
}
