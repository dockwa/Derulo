//
//  JSONFileManager.swift
//  Derulo
//
//  Created by Christian Hatch on 1/19/17.
//
//

import Foundation



///Helps you to persist, restore, and remove JSONPersistable objects from disk.
public struct JSONPersistenceManager<T: JSONPersistable> {
    public init() {}

    //MARK: - Objects
    
    public func restoreObject(withKey key: String) -> T? {
        
        guard let json = JSONFileManager.loadJSON(withFilename: key), let object = T(json: json) else {
            return nil
        }
        return object
    }
    
    public func store(object: T, withKey: String) {
        
        let json = object.asPersistenceJSON
        JSONFileManager.write(json: json, toFilename: withKey)
    }
    
    
    //MARK: - Arrays
    
    public func restoreArray(withKey key: String) -> [T]? {
        
        guard let json = JSONFileManager.loadJSONArray(withFilename: key) else {
            return nil
        }
        let array = JSONMapper<T>().mapArray(json: json)
        return array
    }
    
    public func store(array: [T], withKey: String) {
        
        guard let json = JSONPersistenceConverter<T>().jsonArray(fromArray: array) else { return }
        JSONFileManager.write(jsonArray: json, toFilename: withKey)
    }

    
    
    //MARK: - Remove
    
    public func removeObject(withKey key: String) {
        JSONFileManager.remove(filename: key)
    }
}










//MARK: - JSONFileManager

///Private implementation for JSONPersistenceManager
private struct JSONFileManager {
    
    
    //MARK: - Load 
    
    static func loadJSON(withFilename filename: String) -> JSON? {
        return load(withFilename: filename) as? JSON
    }
    
    static func loadJSONArray(withFilename filename: String) -> [JSON]? {
        return load(withFilename: filename) as? [JSON]
    }

    
    private static func load(withFilename filename: String) -> Any? {
        
        let path = self.path(forFilename: filename)
        
        guard let jsonData = try? Data(contentsOf: path) else {
            print(#function, "Couldn't create data from path \(path)")
            return nil
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: jsonData, options: .allowFragments)
            return json
        }
        catch {
            print(#function, "Error loading JSON from disk. ", error)
            return nil
        }
    }
    
    
    
    
    //MARK: - Write 
    
    static func write(json: JSON, toFilename: String) {
        write(validJSON: json, toFilename: toFilename)
    }
    
    static func write(jsonArray: [JSON], toFilename: String) {
        write(validJSON: jsonArray, toFilename: toFilename)
    }
    
    private static func write(validJSON json: Any, toFilename: String) {
        
        guard JSONSerialization.isValidJSONObject(json) else {
            print(#function, "Invalid JSON")
            return
        }
        
        let path = self.path(forFilename: toFilename)
        
        guard let data = try? JSONSerialization.data(withJSONObject: json, options: []) else {
            print(#function, "Could not create Data from JSON")
            return
        }
        
        do {
            try data.write(to: path, options: .atomic)
        }
        catch {
            print(#function, "Error writing data", error)
        }
    }
    
    
    //MARK: - Remove
    
    static func remove(filename: String) {
        let path = self.path(forFilename: filename)
        
        do {
            try FileManager().removeItem(at: path)
        }
        catch {
            print(#function, "Error removing file.", error)
        }
    }
    
    
    
    //MARK: - Private
    
    private static func path(forFilename filename: String) -> URL {
        return documentsDirectory.appendingPathComponent("\(filename)")
    }
    
    private static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
}










