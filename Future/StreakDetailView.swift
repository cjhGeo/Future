//
//  StreakDetailView.swift
//  Future
//
//  Created by T Krobot on 22/10/22.
//

import SwiftUI

struct StreakDetailView: View {
    
    @Binding var event: Event
    
    var body: some View {
        VStack {
            Form {
                TextField("Title of countdown", text: $event.title)
                    .multilineTextAlignment(.center)
                
                HStack {
                    
                    TextField("Title of countdown", text: $event.date)
                        .multilineTextAlignment(.center)
                    
                    Text("|")
                    
                    TextField("Title of countdown", text: $event.status)
                        .multilineTextAlignment(.center)
                }
                
                Section() {
                    ZStack {
                        Circle()
                            .frame(height: 360)
                            .foregroundColor(.gray)
                        Text("300 days")
                            .font(.system(size: 60))
                            .foregroundColor(.white)
                    }
                    
                    HStack {
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Text("Save as image")
                                .font(.system(size: 20))
                        }
                        
                        Spacer()
                        
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
