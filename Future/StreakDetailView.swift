//
//  StreakDetailView.swift
//  Future
//
//  Created by T Krobot on 22/10/22.
//

import SwiftUI

struct StreakDetailView: View {
    
    @Binding var event: Event
    
    let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter
        }()
    
    var body: some View {
        VStack {
            Form {
                Text(event.title)
                    .multilineTextAlignment(.center)
                
                HStack {
                    
                    Section() {
                        Text(event.date, formatter: dateFormatter)
                            .multilineTextAlignment(.center)
                        
                    }
                    
                    Text("|")
                    
                    Section() {
                        
                        Text(event.status.rawValue)
                            .multilineTextAlignment(.center)
                    }
                }
                
                Section() {
                    ZStack {
                        Circle()
                            .frame(height: 360)
                            .foregroundColor(.gray)
                        Text("300 days")
                            .font(.system(size: 60))
                            .foregroundColor(.white)
                        
                        Circle()
                            .stroke(lineWidth: 20.0)
                            .opacity(0.3)
                            .foregroundColor(Color.green)
                            .frame(height: 314)
                        
                        Circle()
                            .trim(from: 0.0, to: 60/360)
                            .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                            .foregroundColor(Color.green)
                            .rotationEffect(Angle(degrees: 270.0))
                            .frame(height: 314)
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
        StreakDetailView(event: .constant(Event(title: "Title",  status: RepeatType.annually)))
    }
}
