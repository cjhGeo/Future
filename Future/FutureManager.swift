import Foundation
import SwiftUI

class EventManager: ObservableObject {
    @Published var events: [Event] = [] {
        didSet {
            save()
        }
    }
    
    let sampleEvents: [Event] = []
    
    init() {
        load()
    }
    
    func getArchiveURL() -> URL {
        let plistName = "events.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedEvents = try? propertyListEncoder.encode(events)
        try? encodedEvents?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        
        var finalEvents: [Event]!
        
        if let retrievedEventData = try? Data(contentsOf: archiveURL),
            let decodedEvents = try? propertyListDecoder.decode([Event].self, from: retrievedEventData) {
            finalEvents = decodedEvents
        } else {
            finalEvents = sampleEvents
        }
        
        events = finalEvents
    }
}
