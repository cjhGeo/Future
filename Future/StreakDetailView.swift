//
//  StreakDetailView.swift
//  Future
//
//  Created by T Krobot on 22/10/22.
//

import SwiftUI

struct StreakDetailView: View {
    
    @State var tf = true
    
    @Binding var event: Event
    
    var body: some View {
        VStack {
            Form {
                TextField("Title of countdown", text: $event.title)
                    .multilineTextAlignment(.center)
                Section() {
                    ZStack {
                        Circle()
                            .frame(height: 360)
                            .foregroundColor(.gray)
                        Text("300 days")
                            .font(.system(size: 60))
                            .foregroundColor(.white)
                    }
                    HStack() {
        
                        Text("Save")
                            .frame(width: 120, height: 60)
                            .background(.gray)
                            .cornerRadius(12)
                            .padding(.top)
                            .padding(.bottom)
//                            .onTapGesture {
//
//                            }
                        
                        Spacer()
                        
                        Text("Share")
                            .frame(width: 120, height: 60)
                            .background(.gray)
                            .cornerRadius(12)
                            .padding(.top)
                            .padding(.bottom)
//                            .onTapGesture {
//
//                            }
                    }
                }
            }
        }
    }
}

struct StreakDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StreakDetailView(event: .constant(Event(title: "Title", date: "7 Oct")))
    }
}
