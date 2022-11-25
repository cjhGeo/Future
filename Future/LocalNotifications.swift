import SwiftUI
import UserNotifications

struct LocalNotifications: View {
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
                content.subtitle = "Click here to repeat the Streak!"
                content.sound = UNNotificationSound.default
                content.interruptionLevel = .critical

                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)

                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                UNUserNotificationCenter.current().add(request)
            }

        }
    }
}

struct LocalNotifications_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//1) make the circular progress view smaller  2) add in delete button, then once pressed it will show a list 3) make all the fonts the same size
