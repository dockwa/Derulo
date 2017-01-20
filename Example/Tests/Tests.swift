import UIKit
import XCTest
import Derulo


class Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        
        super.tearDown()
    }
    
    
    
    func testExample() {

        //start with JSON
        var jasonJSON = [String : Any]()
        jasonJSON["id"] = 93
        jasonJSON["name"] = "Jason Derulo"
        
        
        
        //MARK: - To / From JSON
        
        
        //parse into model object
        let jasonPerson = Person(json: jasonJSON)
        
        //convert to JSON
        let jasonPersonJSON = jasonPerson?.asJSON
        print(jasonPersonJSON ?? "")
        
        
        //make another json
        var jaySeanJSON = JSON()
        jaySeanJSON["id"] = 57
        jaySeanJSON["name"] = "Jay Sean"
        
        
        
        //MARK: - Arrays
        
        
        //start with JSON an array of json
        let jsonArray = [jasonJSON, jaySeanJSON]
        
        
        //parse into model object
        let people = JSONMapper<Person>().mapArray(json: jsonArray)
        
        //convert to JSON
        let peopleJSON = JSONConverter<Person>().jsonArray(fromArray: people)
        print(peopleJSON ?? "")
        
        
        //MARK: - Persistence
        
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
    }
    
}














