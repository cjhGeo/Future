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
    
    @State var todos = [
        Todo(title: "Watch some paw patrol!", isCompleted: true, details: "Episode 5 - 10"),
        Todo(title: "Pay attention to YJ in class"),
        Todo(title: "Go get free points in giveaways")]
    
    @State var isSheetPresented = false
    
    @StateObject var todoManager = TodoManager()
    
    enum Player {
        case human, computer
    }
    
    struct Move {
        let player: Player
        let boardIndex: Int
        
        
    }
    
    var body: some View {
        NavigationView{
            
            List {
                ForEach($todoManager.todos) { $todo in
                    NavigationLink{
                        //                        ToDoDetailView(todo: $todo)
                    } label: {
                        
                    }
                }
                GeometryReader { geometry in
                    VStack {
                        //                            Spacer()
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(0..<10) { i in
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
                            .onDelete { indexSet in
                                todoManager.todos.remove(atOffsets: indexSet)
                            }
                            .onMove { indices, newOffset in
                                todoManager.todos.move(fromOffsets: indices, toOffset: newOffset)
                                
                            }
                        }
                        .padding()
                    }
                }
                .frame(height: 600)
            }
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
