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
    
    @State var wakeUp = Date.now
    @State var title = ""
    @State var startingDate = ""
    @State var pin = false
    @State var repeats = ""
//    @Binding var events: [Event]
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
                
                VStack{
                    Section{
                        Toggle("Notifications", isOn: $showRequest)
                            .toggleStyle(SwitchToggleStyle(tint: .red))
                    }
                    //                    if showRequest {
                    //                        LocalNotificationView() = true
                    //                    }
                }




                   
                
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
                        
                        Text("300 days")
                            .font(.system(size: 52))
                            .foregroundColor(.black)
                    }
                    
                    HStack {
                        Spacer()
                        Button {
                        } label: {
                            Text("Save as image")
                                .font(.system(size: 20))
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
                    HStack{
                        Spacer()

                        Button{
                           // $events.items.remove(Event(title: title, date: wakeUp, status: RepeatType.never))
                            dismiss()
                        } label: {
                            Text("Delete Event")
                                .foregroundColor(.red)

                        }

                        Spacer()
                    }
                }
                
                
            }
        }
       
    }
   
    

        struct StreakDetailView_Previews: PreviewProvider {
            static var previews: some View {
                StreakDetailView (events: .constant(Event(title: "Watch newest paw patrol release", status: RepeatType.annually, details: "new episode")))
            }
        }
    }
    

