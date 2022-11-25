//
//  StreakDetailView.swift
//  Future
//
//  Created by T Krobot on 22/10/22.




import SwiftUI

struct StreakDetailView: View {
    
    @Binding var events: Event
    
    @State private var showRequest = true
    @State var LocalNotificationView = false
    
    @State var currDate = Date.now
    @State var title = ""
    @State var startingDate = ""
    @State var pin = false
    @State var repeats = ""
    
    @Environment(\.dismiss) var dismiss
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
    //    if showRequest = true {
    //        LocalNotificationView() = true
    //    }
    
    var body: some View {
        VStack {
            Form {
                Text(events.title)
                    .multilineTextAlignment(.center)
                HStack {
                    
                    Section() {
                        Text(events.date, formatter: dateFormatter)
                            .multilineTextAlignment(.center)
                    }
                    
                    Text("|")
                    
                    Section() {
                        
                        Text(events.status.rawValue)
                            .multilineTextAlignment(.center)
                    }
                }
                
                //                VStack{
                //                    Section{
                //                        Button {
                //                            LocalNotificationView()
                //                        } label: {
                //                            Text("Notifications")
                //                        }
                //                    }
                //                }
                //                                            Toggle("Notifications", isOn: $showRequest)
                //                                                .toggleStyle(SwitchToggleStyle(tint: .red))
                //                                        }
                //                                        if showRequest = true  {
                //                                           LocalNotificationView()
                //                                        }
                //                                    }
                
                
                
                
                
                
                Section() {
                    ZStack {
                        Circle()
                            .frame(height: 330)
                            .opacity(0)
                        
                        Circle()
                            .stroke(lineWidth: 20.0)
                            .opacity(0.3)
                            .foregroundColor(Color.green)
                            .frame(height: 270)
                        
                        Circle()
                            .trim(from: 0.0, to: 60/100)
                            .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                            .foregroundColor(Color.green)
                            .rotationEffect(Angle(degrees: 270.0))
                            .frame(height: 270)
                        
                        Text("\(calcDistance(events.date)) left")
                            .font(.system(size: 40))
                            .foregroundColor(.black)
                    }
                    
                    HStack {
                        Spacer()
                        Button {
                        } label: {
                            Text("Save as image")
                                .foregroundColor(.blue)
                        }
                        Spacer()
                    }
                }
                
                //                VStack{
                //                    Section{
                //                        Toggle("Notifications", isOn: $showRequest)
                //                            .toggleStyle(SwitchToggleStyle(tint: .red))
                //                    }
                //                    //                    if showRequest {
                //                    //                        LocalNotificationView() = true
                //                    //                    }
                //                }
                //
                //
                //
                
                Section {
                    HStack {
                        Spacer()
                        
                        Button{
                            withAnimation{
                                events.isCompleted.toggle()
                            }
                        } label: {
                            Text("Mark as \(events.isCompleted ? "Incompleted" : "Completed")")
                                .foregroundColor(events.isCompleted ? .red : .blue)
                        }
                        Spacer()
                        
                    }
                }
                
                
            }
        }
        
    }
    
    func calcDistance(_ date: Date) -> String {
        var dist = Date.now.distance(to: date)
        var result = 0
        var time = ""
        if dist/86400 > 1 {
            result = Int(dist/86400) + 1
            time = "d"
        } else if dist/3600 > 1 {
            result = Int(dist/3600) + 1
            time = "h"
        } else if dist/60 > 1 {
            result = Int(dist/60) + 1
            time = "m"
        } else {
            result = Int(dist)
            time = "s"
        }
        
        result = (result < 0 ? 0:result)
        
        return String(result) + time
    }
    
    func timePeriodTest() -> DateComponents {
        let userDate = Calendar.current.dateComponents([.day, .month, .year], from: events.date)
        
        let userDateComponents = DateComponents(calendar: Calendar.current, year: userDate.year!, month: userDate.month!, day: userDate.day!).date!
        
        var daysUntil = Calendar.current.dateComponents([.day], from: userDateComponents, to: Date())
        
        
        let userDateComponentsTwo = DateComponents(calendar: Calendar.current, year: userDate.year!, month: userDate.month!, day: userDate.day! + 1).date!
        
        let daysUntilButNot = Calendar.current.dateComponents([.day], from: Date(), to: userDateComponentsTwo)
        
        if userDateComponents != Date() {
            daysUntil = daysUntilButNot
        }
        
        return daysUntil
        
    }

    
}


struct StreakDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StreakDetailView (events: .constant(Event(title: "Watch newest paw patrol release", status: RepeatType.annually, details: "new episode")))
    }
}

