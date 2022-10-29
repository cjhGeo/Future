////
////  FutureData.swift
////  Future
////
////  Created by    wuniutian on 22/10/22.
////
//
//import Foundation
//
//import Foundation
//import SwiftUI
//
//class TodoManager: ObservableObject {
//    @Published var todos: [Todo] = [] {
//        didSet {
//            save()
//        }
//    }
//    
//    let sampleTodos: [Todo] = []
//    
//    init() {
//        load()
//    }
//    
//    func getArchiveURL() -> URL {
//        let plistName = "todos.plist"
//        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//        
//        return documentsDirectory.appendingPathComponent(plistName)
//    }
//    
//    func save() {
//        let archiveURL = getArchiveURL()
//        let propertyListEncoder = PropertyListEncoder()
//        let encodedTodos = try? propertyListEncoder.encode(todos)
//        try? encodedTodos?.write(to: archiveURL, options: .noFileProtection)
//    }
//    
//    func load() {
//        let archiveURL = getArchiveURL()
//        let propertyListDecoder = PropertyListDecoder()
//        
//        var finalTodos: [Todo]!
//        
//        if let retrievedTodoData = try? Data(contentsOf: archiveURL),
//            let decodedTodos = try? propertyListDecoder.decode([Todo].self, from: retrievedTodoData) {
//            finalTodos = decodedTodos
//        } else {
//            finalTodos = sampleTodos
//        }
//        
//        todos = finalTodos
//    }
//}
//
