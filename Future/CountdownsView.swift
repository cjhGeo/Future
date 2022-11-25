//
//  CountdownsView.swift
//  Future
//
//  Created by T Krobot on 16/11/22.
//

import SwiftUI

struct CountdownsView: View {
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible())]
    
    @StateObject var eventManager = EventManager()
    
    @Binding var eventsTwo: Event
    
    @State var isSheetPresented = false
    
    @State var currDate = Date.now
    
    @State var scam = false
    
    @State var editMode = EditMode.active
    
    @State var presentation = true
    
    @State var dotdotdot = "..."
    
    let endOfSmth = "."
    
    @State var distance = 0.0
    
    @State var plsWork = ""
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    @State var index = false
    
    //    @StateObject var todoManager = TodoManager()
    
    var body: some View {
        NavigationView{
            
            if presentation {
                GeometryReader { geometry in
                    VStack {
                        LazyVGrid(columns: columns, spacing: 50) {
                            ForEach($eventManager.events) { $event in
                                if display(event.date, title: event.title) {
                                    NavigationLink{
                                        StreakDetailView(events: $event)
                                    } label: {
                                        VStack {
                                            ZStack {
                                                Circle()
                                                    .foregroundColor(event.colour == "red" ? .red : event.colour == "blue" ? .blue : .green)
                                                    .opacity(0.6)
                                                    .frame(width: geometry.size.width/3 - 15 ,
                                                           height: geometry.size.width/3 - 15)
                                                    .shadow(radius: 15)
                                                
                                                Text("\(calcDistance(event.date))")
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 35))
                                                    .onReceive(timer, perform: { _ in
                                                        
                                                        index.toggle()
                                                    })
                                                
                                                
                                            }
//                                            .background(
//                                                .shadow(color: .purple, radius: 3, x: 0.5, y: 1))
                                            if event.title.count < 17 {
                                                Text(event.title)
                                                    .foregroundColor(.black)
                                            } else {
                                                Text("\(event.title.substring(toIndex: 15))\(dotdotdot)")
                                                    .foregroundColor(.black)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                }
                .frame(height: 600)
                .navigationTitle("Countdowns")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            isSheetPresented = true
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            presentation = false
                            editMode = EditMode.active
                        } label : {
                            Text("Edit")
                        }
                    }
                }
                .sheet(isPresented: $isSheetPresented) {
                    EditStreakDetailView(events: $eventManager.events)
                    
                }
                .environment(\.editMode, $editMode)
                
            } else {
                List {
                    ForEach($eventManager.events) { $event in
                        if !event.isCompleted {
                            NavigationLink{
                                StreakDetailView(events: $event)
                            } label: {
                                Text(event.title)
                            }
                        }
                    }
                    .onDelete { indexSet in
                        eventManager.events.remove(atOffsets: indexSet)
                    }
                    .onMove { originalOffset, newOffset in
                        eventManager.events.move(fromOffsets: originalOffset, toOffset: newOffset)
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            presentation = true
                            editMode = EditMode.inactive
                        } label : {
                            Text("Done")
                        }
                    }
                }
                .environment(\.editMode, $editMode)
            }
            
            
            
            
            //else {
            // Fallback on earlier versions
            // }
        }
    }
    
    func display(_ date: Date, title eventTitle: String) -> Bool {
        let dist = Date.now.distance(to: date)
        let result = (dist > 0 ? true : false)
        
        
        return result
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
    
    
    func timePeriodTest() -> DateComponents {
        let userDate = Calendar.current.dateComponents([.day, .month, .year], from: eventsTwo.date)
        
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

struct CountdownsView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownsView(eventManager: EventManager(),
                       
                       eventsTwo: .constant(Event(title: "Watch newest paw patrol release", details: "new episode")))
        
    }
}
