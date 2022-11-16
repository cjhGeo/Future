//
//  RepeatStreaks.swift
//  Future
//
//  Created by    wuniutian on 16/11/22.
//
import SwiftUI
//
//import UserNotifications
//
//let weekday = 1 //Sunday 19 Mar
//let calendar = NSCalendar.current
//var date = DateComponents()
//date.weekday = weekday
//date.hour = 1
//date.minute = 5
//
//let ultimateDate = calendar.date(from: date)
//
//let triggerWeekly = Calendar.current.dateComponents([.weekday, .hour, .minute], from:
//ultimateDate!)
//
//print(triggerWeekly) // hour: 1 minute: 5 second: 0 weekday: 2 isLeapMonth: false
//let trigger = UNCalendarNotificationTrigger(dateMatching: triggerWeekly, repeats: true)
//let identifier = "curso\(String(Index))"
//let request = UNNotificationRequest(identifier: identifier,
//                                        content: content, trigger: trigger)
//
//let trigger = UNCalendarNotificationTrigger(dateMatching: DateComponents(hour: 1, minute: 5, weekday: 2), repeats: true)
//print(trigger.nextTriggerDate() ?? "nil")
//
//let content = UNMutableNotificationContent()
//content.title = "title"
//content.body = "body"
//// make sure you give each request a unique identifier. (nextTriggerDate description)
//let request = UNNotificationRequest(identifier: "identify", content: content, trigger: trigger)
//UNUserNotificationCenter.current().add(request) { error in
//    if let error = error {
//        print(error)
//        return
//    }
//    print("scheduled")
//}
