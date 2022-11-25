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
    
    @State var dateEdit = false
    
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
            List {
                HStack {
                    TextField("Title", text: $events.title)
                        .multilineTextAlignment(.center)
                }
                
                HStack {
                    Spacer()
                    
                    Text(events.date, formatter: dateFormatter)
                    
                    Spacer()
                }
                .onTapGesture {
                    dateEdit.toggle()
                }
                
                if dateEdit {
                    if #available(iOS 14.0, *) {
                        DatePicker("Choose the day", selection: $events.date)
                            .datePickerStyle(GraphicalDatePickerStyle())
                            .frame(maxHeight: 400)
                    } else {
                        DatePicker("Choose the day", selection: $events.date)
                            .frame(maxHeight: 400)
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
                            .trim(from: 0.0, to: (events.distance - calcDistanceButDouble(events.date))/events.distance)
                            .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                            .foregroundColor(Color.green)
                            .rotationEffect(Angle(degrees: 270.0))
                            .frame(height: 270)
                        
                        Text("\(calcDistance(events.date)) left")
                            .font(.system(size: 40))
                            .foregroundColor(.black)
                    }
                    
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
            
            
        }
        //            .sheet(isPresented: $isSheetPresented) {
        //                EditStreakDetailView(events: $eventsTwo)
        //
        //            }
    }
    
    
    
    func calcDistance(_ date: Date) -> String {
        let dist = Date.now.distance(to: date)
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
    
    func calcDistanceButDouble(_ date: Date) -> Double {
        let dist = Date.now.distance(to: date)
        var result = dist
        
        result = (result < 0.0 ? 0.0 : result)
        
        return result
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
        StreakDetailView (events: .constant(Event(title: "Watch newest paw patrol release", details: "new episode")))
    }
}

