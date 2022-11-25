import SwiftUI
import UserNotifications

struct EditStreakDetailView: View {
    
    @State var currDate = Date.now
    
    @State var availableDate = Date()...
    
    @State var title = ""
    @State var startingDate = ""
    @State var pin = false
    
    @State var repeats = ""
    
    @State var colours = "red"
    
    @Binding var events: [Event]
    
    @State var distance = 0.0
    
    
    @Environment(\.dismiss) var dismiss
    
    @State private var date = Date()
    
    @State private var showRequest = true
    @State var LocalNotificationView = false
    
    var body: some View {
        
        VStack{
            Form{
                Section{
                    TextField("Title", text: $title)
                        .multilineTextAlignment(.leading)
                }
                
                Section{
                    Text("\(timePeriodTest().day!) Days Left")
                        .font(.body)
                    
                }
                
                
                if #available(iOS 14.0, *) {
                    DatePicker("Pick a date", selection: $date, in: availableDate)
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .frame(maxHeight: 400)
                    
                } else { 
                    DatePicker("Pick a date", selection: $date, in: availableDate)
                        .frame(maxHeight: 400)
                }
                
                Section{
                    HStack {
                        
                        Picker("Colour:", selection: $colours) {
                            Text("Red")
                                .tag("red")
                            Text("Green")
                                .tag("green")
                            Text("Blue")
                                .tag("blue")
                        }.pickerStyle(MenuPickerStyle())
                    }
                }
                
                
                //                                Section {
                //                                    Toggle("Notifictions", isOn: $showRequest)
                //                                        .toggleStyle(SwitchToggleStyle(tint: .red))
                //                                }
                //
                //                                           if showRequest {
                //                                               LocalNotificationView() = true
                //                                           }
                
                HStack {
                    Spacer()
                    
                    Button("Save Event"){
                        distance = Date.now.distance(to: date)
                        
                        if distance > 0 {
                            events.append(Event(title: title, date: date, colour: colours, distance: distance))
                            dismiss()
                            
                            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                                if success {
                                    print("All Set!")
                                } else if let error = error {
                                    print(error.localizedDescription)
                                }
                                
                                let content = UNMutableNotificationContent()
                                content.title = title
                                content.subtitle = ""
                                content.sound = UNNotificationSound.default
                                content.interruptionLevel = .critical
                                
                                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(Int(distance)), repeats: false)
                                
                                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                                
                                UNUserNotificationCenter.current().add(request)
                            }
                            //
                            //                        let content = UNMutableNotificationContent()
                            //                        content.title = "title"
                            //                        content.sound = UNNotificationSound.default
                            //                        content.interruptionLevel = .critical
                            //
                            //                        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
                            //
                            //                        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                            //
                            //                        UNUserNotificationCenter.current().add(request)
                        }
                    }
                    //                    .padding()
                    
                    Spacer()
                }
            }
        }
    }
    
    func timePeriodTest() -> DateComponents {
        let userDate = Calendar.current.dateComponents([.day, .month, .year], from: date)
        
        let userDateComponents = DateComponents(calendar: Calendar.current, year: userDate.year!, month: userDate.month!, day: userDate.day!).date!
        
        var daysUntil = Calendar.current.dateComponents([.day], from: Date(), to: userDateComponents)
        
        
        
        let userDateComponentsTwo = DateComponents(calendar: Calendar.current, year: userDate.year!, month: userDate.month!, day: userDate.day! + 1).date!
        
        let daysUntilButNot = Calendar.current.dateComponents([.day], from: Date(), to: userDateComponentsTwo)
        
        if userDateComponents != Date() {
            daysUntil = daysUntilButNot
        }
        return daysUntil
        
    }
}


struct EditStreakDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EditStreakDetailView(events: .constant([]))
            .previewInterfaceOrientation(.portrait)
        
    }
}
