//
//  StreakDetailView.swift
//  Future
//
//  Created by T Krobot on 22/10/22.
//

import SwiftUI

struct StreakDetailView: View {
    
    @State var title = "Title"
    @State var tf = true
    
    var body: some View {
        VStack {
            Form {
                TextField("Title of countdown", text: $title)
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
                            .onTapGesture {
                                title = "Save"
                            }
                        
                        Spacer()
                        
                        Text("Share")
                            .frame(width: 120, height: 60)
                            .background(.gray)
                            .cornerRadius(12)
                            .padding(.top)
                            .padding(.bottom)
                            .onTapGesture {
                                title = "Share"
                            }
                    }
                }
            }
        }
    }
}

struct StreakDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StreakDetailView()
    }
}
