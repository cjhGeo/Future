
import SwiftUI

struct ContentView: View {
    
    @State var events = [
        Event(title: "Watch newest paw patrol release", status: RepeatType.annually, details: "new episode", isCompleted: true),
        Event(title: "Dora's Birthday", status: RepeatType.annually),
        Event(title: "Go get free points in giveaways", status: RepeatType.annually)]
    
    var body: some View {
        TabView {
            CountdownsView(events: $events, eventsTwo: .constant(Event(title: "Watch newest paw patrol release", status: RepeatType.annually, details: "new episode")))
                .tabItem {
                    Label("Scheduled", systemImage: "checkmark.circle.fill")
                }
            CompletedView(events: $events)
                .tabItem {
                    Label("Completed", systemImage: "number.circle")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
