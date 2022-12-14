//
//  CompletedView.swift
//  Future
//
//  Created by T Krobot on 16/11/22.
//

import SwiftUI

struct CompletedView: View {
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible())]
    
    
    @StateObject var eventManager = EventManager()
    
    //    @StateObject var todoManager = TodoManager()
    
    @State var dotdotdot = "..."
    
    @State var streakCompleted = false
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State var index = false
    
    var body: some View {
        NavigationView{
            ScrollView{
                GeometryReader { geometry in
                    VStack {
                        LazyVGrid(columns: columns, spacing: 50) {
                            ForEach($eventManager.events) { $event in
                                if display(event.date) {
                                    NavigationLink{
                                        StreakDetailView(events: $event)
                                    } label: {
                                        VStack {
                                            ZStack {
                                                Circle()
                                                    .foregroundColor(event.colour == "red" ? .red:event.colour == "blue" ? .blue:.green)
                                                    .opacity(0.5)
                                                    .frame(width: geometry.size.width/3 - 15 ,
                                                           height: geometry.size.width/3 - 15)
                                                
                                                Image(systemName: "seal")
                                                    .resizable()
                                                    .frame(width: 40, height: 40)
                                                    .foregroundColor(.white)
                                            }
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
                            .onReceive(timer, perform: { _ in
                                
                                index.toggle()
                            })
                        }
                    }
                    .padding()
                }
                .frame(height: 600)
                .navigationTitle("Past Countdowns")
                
                
                
                //else {
                // Fallback on earlier versions
                // }
            }
        }
    }
    
    func display(_ date: Date) -> Bool {
        let dist = Date.now.distance(to: date)
        let result = (dist > 0 ? false : true)
        
        return result
    }
    
}

struct CompletedView_Previews: PreviewProvider {
    static var previews: some View {
        CompletedView(eventManager: EventManager())
    }
}
