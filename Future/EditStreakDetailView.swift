//
//  editStreakDetail.swift
//  Future
//
//  Created by hazh2025 on 22/10/22.
//

import SwiftUI


struct editStreakDetail: View {
    
    @State private var date = Date()
    
    @State var title = ""
    @State var startingDate = ""
    @State var pin = false
    
    
    
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
            }
            Button("Save Event"){}
            
            
            
        }
        //            Button("Pick A Date"){
        //                pickADate()
        //            }
        
    }
    
}
//func pickADate(){
//        DatePicker(
//                "Start Date",
//                selection: $date,
//                displayedComponents: [.date]
//            )
//        .datePickerStyle(.graphical)
//    }

struct editStreakDetail_Previews: PreviewProvider {
    static var previews: some View {
        editStreakDetail()
    }
}
