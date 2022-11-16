
import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            CountdownsView()
                .tabItem {
                    Label("Countdowns", systemImage: "checkmark.circle.fill")
                }
            CompletedView()
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
