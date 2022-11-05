//
//  Future.swift
//  Future
//
//  Created by    wuniutian on 22/10/22.
//

import Foundation


struct Event: Identifiable, Encodable, Decodable {
    var id = UUID()
    var title: String
    var date: String
    var status: RepeatType
    var details = ""
    
}

enum RepeatType: String, Codable{
    case never = "Never"
    case weekly = "Weekly"
    case monthly = "Monthly"
    case annually = "Annually"
}
