import XCTest
@testable import Derulo

final class DeruloTests: XCTestCase {

    func testExample() {
        //start with JSON
        var jasonJSON = [String : Any]()
        jasonJSON["id"] = 93
        jasonJSON["name"] = "Jason Derulo"
        jasonJSON["fav_song"] = "wiggle"
//    }
        //MARK: - To / From JSON

//    func testInit() {
        //parse into model object
        let jasonPerson = Person(json: jasonJSON)

        //convert to JSON
        let jasonPersonJSON = jasonPerson?.asJSON
        print(jasonPersonJSON ?? "")

        //make another json
        var jaySeanJSON = JSON()
        jaySeanJSON["id"] = 57
        jaySeanJSON["name"] = "Jay Sean"
//    }

    // MARK: - Arrays

//    func testArrays() {
        //start with JSON an array of json
        let jsonArray = [jasonJSON, jaySeanJSON]

        //parse into model object
        let people = JSONMapper<Person>().mapArray(json: jsonArray)

        //convert to JSON
        let peopleJSON = JSONConverter<Person>().jsonArray(fromArray: people)
        print(peopleJSON ?? "")
//    }

    // MARK: - Persistence

//    func testPersistence() {
        let persistenceKey = "people"

        //store on disk
        if let people = people {
            JSONPersistenceManager<Person>().store(array: people, withKey: persistenceKey)
        }

        //restore from disk
        let restoredPeople = JSONPersistenceManager<Person>().restoreArray(withKey: persistenceKey)
        print(restoredPeople ?? "")

        //delete from disk
        JSONPersistenceManager<Person>().removeObject(withKey: persistenceKey)
//    }

//    func testLoadingFromData() {
        //MARK: - From Data

        //start with Data
        guard let data = try? JSONSerialization.data(withJSONObject: jasonJSON, options: []) else { return }

        //map to object
        let jasonPersonFromData = JSONMapper<Person>().map(data: data)
        print(jasonPersonFromData ?? "")
    }
}
