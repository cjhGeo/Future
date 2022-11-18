//
//  LocalNotifications.swift
//  Future
//
//  Created by    wuniutian on 13/11/22.
//

import SwiftUI
import UserNotifications

struct LocalNotificationView: View {
    var body: some View {
        VStack {
            Button("Request Permisson") {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("All Set!")
                    } else if let error = error {
                        print(error.localizedDescription)
                    }
                }
            }
            Button("Scheduled Notification") {
                let content = UNMutableNotificationContent()
                content.title = "Check Your Streak's Progress!"
                content.subtitle = "Click here to repeat the Streak"
                content.sound = UNNotificationSound.default
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 86400, repeats: true)
                
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                UNUserNotificationCenter.current().add(request)
            }
            
        }
    }
}

struct LocalNotificationView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//1) make the circular progress view smaller  2) add in delete button, then once pressed it will show a list 3) make all the fonts the same size
