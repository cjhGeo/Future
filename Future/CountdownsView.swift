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
    
    @State var isSheetPresented = false
    
    @State var scam = false
    
    @Environment(\.editMode) private var editMode
    
    //    @StateObject var todoManager = TodoManager()
    
    var body: some View {
        NavigationView{
            
            GeometryReader { geometry in
                VStack {
                    LazyVGrid(columns: columns, spacing: 50) {
                        ForEach($events) { $event in
                            if !event.isCompleted {
                                NavigationLink{
                                    StreakDetailView(events: $event)
                                } label: {
                                    ZStack {
                                        Circle()
                                            .foregroundColor(event.colour == "red" ? .red : event.colour == "blue" ? .blue : .green)
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
                    EditButton()
                }
            }
            .sheet(isPresented: $isSheetPresented) {
                EditStreakDetailView(events: $events)
                
            }
            
            
            
            
            
            //else {
            // Fallback on earlier versions
            // }
        }
    }
}

struct CountdownsView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownsView(events: .constant([Event(title: "Watch newest paw patrol release", status: RepeatType.annually, details: "new episode")]))
    }
}
