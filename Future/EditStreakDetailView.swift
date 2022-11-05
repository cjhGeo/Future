import SwiftUI

struct EditStreakDetailView: View {
    
    @State var wakeUp = Date.now
    
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
                    
                    @AppStorage("savedDate") var _: Date = Date()
                    
                    DatePicker("Date:", selection: $wakeUp, displayedComponents: .date)
                        .datePickerStyle(GraphicalDatePickerStyle())
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
                events.append(Event(title: title, date: wakeUp, status: RepeatType.never))
                dismiss()
            }
        }
    }
}

struct EditStreakDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EditStreakDetailView(events: .constant([]))
    }
}
