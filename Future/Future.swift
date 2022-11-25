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
    var date = Date()
    var details = ""
    var isCompleted = false
    var colour = "blue"
    var distance = 0.0
}

extension String {

    var length: Int {
        return count
    }

    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }

    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }

    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }

    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}
