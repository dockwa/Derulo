import Foundation

//MARK: - JSON Helpers

///A uniform way to represent a helper that transforms a native JSON type to a Swift type
public protocol JSONTransform {
    associatedtype ObjectType
    associatedtype JSONType
    
    func transform(fromJSON value: Any?) -> ObjectType?
    func transform(toJSON value: ObjectType?) -> JSONType?
}

public struct IntToStringTransform: JSONTransform {
    public typealias ObjectType = String
    public typealias JSONType = Int
    
    public init() {}
    
    public func transform(fromJSON value: Any?) -> String? {
        guard let value = value else { return nil }
        
        let string = "\(value)"
        return string
    }
    
    public func transform(toJSON value: String?) -> Int? {
        guard let value = value else { return nil }
        
        let number = Int(value)
        return number
    }
}
