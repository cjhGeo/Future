
import SwiftUI

struct ContentView: View {
    
    
    @StateObject var eventManager = EventManager()
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.systemGray6
       }

    
    var body: some View {
        TabView {
            CountdownsView(eventManager: eventManager, eventsTwo: .constant(Event(title: "Watch newest paw patrol release", details: "new episode")))
                .tabItem {
                    Label("Scheduled", systemImage: "checkmark.circle.fill")
                }
            CompletedView(eventManager: eventManager)
                .tabItem {
                    Label("Passed", systemImage: "number.circle")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//            .environment(\.colorScheme, .dark)
    }
}
