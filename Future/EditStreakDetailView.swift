import SwiftUI

struct EditStreakDetailView: View {
    
    @State var wakeUp = Date.now
    
    @State var title = ""
    @State var startingDate = ""
    @State var pin = false
    
    @State var repeats = ""
    
    @Binding var events: [Event]
    
    @Environment(\.dismiss) var dismiss
    
    @State private var date = Date()
    
    var body: some View {
        
        VStack{
            Form{
                Section{
                    TextField("Title", text: $title)
                        .multilineTextAlignment(.leading)
                }
                
                Section{
                    Text("\(timePeriodTest().day!) Days Left")
                        .font(.body)
                    
                }
                
                
                if #available(iOS 14.0, *) {
                    DatePicker("Choose the day", selection: $date)
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .frame(maxHeight: 400)
                } else {
                    DatePicker("Choose the day", selection: $date)
                        .frame(maxHeight: 400)
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
                HStack {
                    Spacer()
                    
                    Button("SAVE EVENT"){
                        events.append(Event(title: title, date: wakeUp, status: RepeatType.never))
                        dismiss()
                    }
                    .padding()
                    
                    Spacer()
                }
            }
        }
    }
    
    func timePeriodTest() -> DateComponents {
        let userDate = Calendar.current.dateComponents([.day, .month, .year], from: date)
        
        let userDateComponents = DateComponents(calendar: Calendar.current, year: userDate.year!, month: userDate.month!, day: userDate.day!).date!
        
        let daysUntil = Calendar.current.dateComponents([.day], from: Date(), to: userDateComponents)
        
        
        return daysUntil
        
        
        
        struct EditStreakDetailView_Previews: PreviewProvider {
            static var previews: some View {
                EditStreakDetailView(events: .constant([]))
            }
        }
        
    }
}
