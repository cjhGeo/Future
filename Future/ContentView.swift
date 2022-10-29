//
//  ContentView.swift
//  Future
//
//  Created by T Krobot on 22/10/22.
//

import SwiftUI

struct ContentView: View {
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible())]
    
    @State private var moves: [Move?] = Array(repeating: nil, count: 6)
    
    @State var events = [
        Event(title: "Watch newest paw patrol release", date: "7 Oct", details: "new episode"),
        Event(title: "Dora's Birthday", date: "15 Aug"),
        Event(title: "Go get free points in giveaways", date: "")]
    
    @State var isSheetPresented = false
    
    //    @StateObject var todoManager = TodoManager()
    
    enum Player {
        case human, computer
    }
    
    struct Move {
        let player: Player
        let boardIndex: Int
        
        
    }
    
    var body: some View {
        NavigationView{
            
            GeometryReader { geometry in
                VStack {
                    //                    Spacer()
                    LazyVGrid(columns: columns, spacing: 50) {
                        
                        ForEach($events) { $event in
                            NavigationLink{
                                StreakDetailView(event: $event)
                            } label: {
                                
                                
                                
                                ZStack {
                                    Circle()
                                        .foregroundColor(.blue).opacity(0.5)
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
            .navigationTitle("Welcome Back!")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                    // EditButton is a special thing to use directly
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isSheetPresented = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
