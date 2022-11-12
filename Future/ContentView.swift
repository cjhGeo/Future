import SwiftUI

struct ContentView: View {
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible())]
    
    @State var events = [
        Event(title: "Watch newest paw patrol release", status: RepeatType.annually, details: "new episode"),
        Event(title: "Dora's Birthday", status: RepeatType.annually),
        Event(title: "Go get free points in giveaways", status: RepeatType.annually)]
    
    @State var isSheetPresented = false
    
    //    @StateObject var todoManager = TodoManager()
    
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
                                        .foregroundColor(event.isCompleted ? .green : .blue)
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
            .navigationTitle("Countdowns")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isSheetPresented = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isSheetPresented) {
                EditStreakDetailView(events: $events)
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

