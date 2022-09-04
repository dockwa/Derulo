# Derulo
[![Powered by Dockwa](https://raw.githubusercontent.com/dockwa/openpixel/dockwa/by-dockwa.png)](https://engineering.dockwa.com/)

[![Version](https://img.shields.io/cocoapods/v/Derulo.svg?style=flat)](http://cocoapods.org/pods/Derulo)
[![License](https://img.shields.io/cocoapods/l/Derulo.svg?style=flat)](http://cocoapods.org/pods/Derulo)
[![Platform](https://img.shields.io/cocoapods/p/Derulo.svg?style=flat)](http://cocoapods.org/pods/Derulo)

A flexible collection of Swift protocols and helpers to organize and manage translating between JSON and native Swift objects.


## Designed to give your model objects a consistent JSON conversion / mapping / caching / offline strategy without getting in your way.

* Designed to be flexible enough to let you implement your models as your requirements dictate while giving you a general framework to organize your JSON parsing and caching strategy.

* A collection of composable but distinct features, so you can use the protocols and helpers that work for the use case at hand.
  
* Simple, straightforward, and lightweight; Derulo sits right between "I'll just implement it myself without a third party library" and "I don't really want to reinvent the wheel and implement a JSON strategy from scratch"


## Example

#### start with JSON

```swift
var jasonJSON = [String : Any]()
jasonJSON["id"] = 93
jasonJSON["name"] = "Jason Derulo"
jasonJSON["fav_song"] = "wiggle"
```

### From JSON

#### parse into model object
```swift
let jasonPerson = Person(json: jasonJSON)
```

### To JSON

#### convert to JSON
```swift
let jasonPersonJSON = jasonPerson.asJSON
```

### Arrays

#### make another json
```swift
var jaySeanJSON = JSON()
jaySeanJSON["id"] = 57
jaySeanJSON["name"] = "Jay Sean"
```

#### start with array of json
```swift
let jsonArray: [JSON] = [jasonJSON, jaySeanJSON]
```

#### parse into model object
```swift
let people: [Person] = JSONMapper<Person>().mapArray(json: jsonArray)
```

#### convert to JSON
```swift
let peopleJSON: [JSON] = JSONConverter<Person>().jsonArray(fromArray: people)
```

### Persistence

```swift
let persistenceKey = "people"
```

#### store to disk
```swift
JSONPersistenceManager<Person>().store(array: people, withKey: persistenceKey)
```

#### restore from disk
```swift
let restoredPeople: [Person] = JSONPersistenceManager<Person>().restoreArray(withKey: persistenceKey)
```

#### delete from disk
```swift
JSONPersistenceManager<Person>().removeObject(withKey: persistenceKey)
```

### From Data

#### start with Data
```swift
guard let data = try? JSONSerialization.data(withJSONObject: jasonJSON, options: []) else { return }
```

#### map to object
```swift
let jasonPersonFromData = JSONMapper<Person>().map(data: data)
print(jasonPersonFromData ?? "")
```

### Example Implementation

```swift
struct Person: Identifiable, JSONModel {
    let identifier: Identifier
    let name: String
    let favoriteSong: Song?
}

extension Person: JSONMappable {
    init?(json: JSON?) {
        guard let json = json else { return nil }

        guard let id = IntToStringTransform().transform(fromJSON: json["id"]) else {
            print(#function, String(describing: Person.self), "JSON missing required properties")
            return nil
        }

        self.identifier = id
        self.name = json["name"] as? String ?? "No Name"
        self.favoriteSong = Song(jsonEntry: json["fav_song"])
    }
}

extension Person: JSONConvertible {
    var asJSON: JSON {
        var json = JSON()
        json["id"] = IntToStringTransform().transform(toJSON: identifier)
        json["name"] = name

        if let favoriteSong = favoriteSong {
            json["fav_song"] = favoriteSong.asJSONEntry
        }
        return json
    }
}

extension Person: JSONPersistable {
    var asPersistenceJSON: JSON { asJSON }
}

enum Song: String {
    case wiggle
    case talkDirty
}

extension Song: JSONEntryMappable, JSONEntryConvertible {
    init?(jsonEntry: JSONEntry?) {
        guard let jsonEntry = jsonEntry as? String else { return nil }
        self.init(rawValue: jsonEntry)
    }

    var asJSONEntry: String { rawValue }
}
```

## Requirements

Swift 5.6

## Installation

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler.

Once you have your Swift package set up, adding AHDownloadButton as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/dockwa/Derulo", .upToNextMajor(from: "1.7.0"))
]
```

### CocoaPods

Derulo is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Derulo'
```

## Author

Christian Hatch, christianhatch@gmail.com

## License

Derulo is available under the MIT license. See the LICENSE file for more info.
