//
//  Future.swift
//  Future
//
//  Created by    wuniutian on 22/10/22.
//

import Foundation


struct Todo: Identifiable, Encodable, Decodable {
    let id = UUID()
    var title: String
    var isCompleted = false
    var details = ""
    
}

