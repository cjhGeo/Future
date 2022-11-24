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
    
    @Binding var events: [Event]
    
    @Binding var eventsTwo: Event
    
    @State var isSheetPresented = false
    
    @State var scam = false
    
    @State var editMode = EditMode.active
    
    @State var presentation = true
    
    let endOfSmth = "."
    
    
    
    //    @StateObject var todoManager = TodoManager()
    
    var body: some View {
        NavigationView{
            
            if presentation {
                GeometryReader { geometry in
                    VStack {
                        LazyVGrid(columns: columns, spacing: 50) {
                            ForEach($events) { $event in
                                if !event.isCompleted {
                                    NavigationLink{
                                        StreakDetailView(events: $event)
                                    } label: {
                                        VStack {
                                            ZStack {
                                                Circle()
                                                    .foregroundColor(event.colour == "red" ? .red : event.colour == "blue" ? .blue : .green)
                                                    .opacity(0.5)
                                                    .frame(width: geometry.size.width/3 - 15 ,
                                                           height: geometry.size.width/3 - 15)
                                                
                                                Text("\(calcDistance(eventsTwo.distance))")
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 50))
                                            }
                                            if event.title.count < 17 {
                                                Text(event.title)
                                            } else {
                                                Text("\(event.title.substring(toIndex: 15))...")
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
                    EditStreakDetailView(events: $events)
                    
                }
                .environment(\.editMode, $editMode)
                
            } else {
                List {
                    ForEach($events) { $event in
                        if !event.isCompleted {
                            NavigationLink{
                                StreakDetailView(events: $event)
                            } label: {
                                Text(event.title)
                            }
                        }
                    }
                    .onDelete { indexSet in
                        events.remove(atOffsets: indexSet)
                    }
                    .onMove { originalOffset, newOffset in
                        events.move(fromOffsets: originalOffset, toOffset: newOffset)
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
    
    func calcDistance(_ dist: Double) -> Int {
        var result = 0
        if dist/86400 > 1 {
            result = Int(dist/86400) + 1
        } else if dist/3600 > 1 {
            result = Int(dist/3600) + 1
        } else if dist/60 > 1 {
            result = Int(dist/60) + 1
        } else {
            result = Int(dist)
        }
        
        return result
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
        CountdownsView(events: .constant([Event(title: "Watch newest paw patrol release", status: RepeatType.annually, details: "new episode")]),
                       
                       eventsTwo: .constant(Event(title: "Watch newest paw patrol release", status: RepeatType.annually, details: "new episode")))
        
    }
}
