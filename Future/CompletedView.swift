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
    
    
    @State var completedEvents = [
        Event(title: "Watch newest paw patrol release", status: RepeatType.annually, details: "new episode"),
        Event(title: "Dora's Birthday", status: RepeatType.annually),
        Event(title: "Go get free points in giveaways", status: RepeatType.annually)]
    
    //    @StateObject var todoManager = TodoManager()
    
    @State var streakCompleted = false
    
    var body: some View {
        NavigationView{
            
            GeometryReader { geometry in
                VStack {
                    LazyVGrid(columns: columns, spacing: 50) {
                        ForEach($completedEvents) { $event in
                            NavigationLink{
                                StreakDetailView(events: $event)
                            } label: {
                                ZStack {
                                    Circle()
                                        .foregroundColor(event.colour == "red" ? .red:event.colour == "blue" ? .blue:.green)
                                        .opacity(0.5)
                                        .frame(width: geometry.size.width/3 - 15 ,
                                               height: geometry.size.width/3 - 15)
                                    
                                    Image(systemName: "pencil.circle.fill")
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                        .foregroundColor(.white)
                                }
                            }
                        }
                    }
                }
                .padding()
            }
            .frame(height: 600)
            .navigationTitle("Completed")
            
            
            
            //else {
            // Fallback on earlier versions
            // }
        }
    }

}

struct CompletedView_Previews: PreviewProvider {
    static var previews: some View {
        CompletedView()
    }
}
