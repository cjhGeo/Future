import SwiftUI

struct EditStreakDetailView: View {
    
    @State private var date = Date()
    
    @State var title = ""
    @State var startingDate = ""
    @State var pin = false
    
    @State var repeats = ""

    @Binding var events: [Event]
    
    @Environment(\.dismiss) var dismiss

    var body: some View {
        
        VStack{
            Form{
                Section{
                    TextField("Title", text: $title)
                        .multilineTextAlignment(.leading)
                }
                Section{
                    TextField("Starting Date", text: $startingDate)
                        .multilineTextAlignment(.leading)
                }
                Section{
                    HStack {
                        Button("Option"){print(1)}
                        
                        Spacer()
                        
                        Text("Yes")
                            .foregroundColor(.blue)
                            .onTapGesture {
                                pin = true
                            }
                        Text("/")
                        Text("No")
                            .foregroundColor(.blue)
                            .onTapGesture {
                                pin = false
                            }
                    }
                }
                Section(header: Text("REPEATS")){
                    Picker("Repeat", selection: $repeats) {
                        Text("Never")
                            .tag(RepeatType.never)
                        Text("Weekly")
                            .tag(RepeatType.weekly)
                        Text("Monthly")
                            .tag(RepeatType.monthly)
                        Text("Annually")
                            .tag(RepeatType.annually)
                    }.pickerStyle(MenuPickerStyle())
                }
            }
            
            Button("Save Event"){
                
            }
        }
    }
}

struct EditStreakDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EditStreakDetailView(events: .constant([]))
    }
}
