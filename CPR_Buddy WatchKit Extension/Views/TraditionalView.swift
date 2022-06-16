//
//  TraditionalView.swift
//  CPR_Buddy WatchKit Extension
//
//  Created by Angelina Tsuboi on 6/11/22.
//

import SwiftUI

struct TraditionalView: View {
    @Binding var isPresented: Bool
    @State private var presentTimerView = false
    @State private var presentTutorialView = false
    
    var body: some View {
        VStack {
            VStack {
                Text("**Traditional CPR**")
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding(.vertical, 5)
            
                
                Button("Start Timer") {
                    presentTimerView.toggle()
                }.buttonStyle(BorderedButtonStyle(tint: .blue))
                    .fullScreenCover(isPresented: $presentTimerView) {
                        TraditionalTimerView(isPresented: $presentTimerView).toolbar {
                            
                            ToolbarItem(placement: .cancellationAction) {
                                
                                Button("Close") {
                                    presentTimerView.toggle()
                                }
                                
                            }
                            
                        }
                    }.padding(.horizontal).buttonStyle(BorderedButtonStyle(tint: .blue)).padding(.top, 5)
                    .padding(.bottom, 10)
                
                
                Button("Tutorial") {
                    presentTutorialView.toggle()
                }.buttonStyle(BorderedButtonStyle(tint: .pink))
                    .fullScreenCover(isPresented: $presentTutorialView) {
                        TraditionalTutorialView(isPresented: $presentTutorialView).toolbar {
                            
                            ToolbarItem(placement: .cancellationAction) {
                                
                                Button("Close") {
                                    presentTutorialView.toggle()
                                }
                                
                            }
                            
                        }
                    }.padding(.horizontal).buttonStyle(BorderedButtonStyle(tint: .pink)).padding(.top, 5)
                
                
            }
            .opacity(0.8)
            .padding(1)
        }

        Spacer()
    }
}
