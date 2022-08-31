//
//  HandsOnlyView.swift
//  CPR_Buddy WatchKit Extension
//
//  Created by Angelina Tsuboi on 6/11/22.
//

import SwiftUI

struct HandsOnlyView: View {
    @Binding var isPresented: Bool
    @State private var presentTimerView = false
    @State private var clickTimer : Timer?
    @State private var progressTimer : Timer?
    @State private var presentTutorialView = false
    @EnvironmentObject private var userSettings: UserSettings
    @State private var presentSettingsWarningView = false
    @State private var selection: Tab = .tabOne
    
    enum Tab {
        case tabOne
        case tabTwo
    }
    
    var body: some View {
        TabView(selection: $selection) {
            VStack {
                VStack {
                    VStack {
                        Text("**Hands-Only CPR**")
                            .font(.headline)
                            .multilineTextAlignment(.center)
                            .padding(.vertical, 5)
                        
                        Button("Start Timer") {
                            presentTimerView.toggle()
                        }.buttonStyle(BorderedButtonStyle(tint: .blue))
                            .fullScreenCover(isPresented: $presentTimerView) {
                                HandsOnlyTimerView(isPresented: $presentTimerView, clickTimer: $clickTimer, progressTimer: $progressTimer).toolbar {
                                    
                                    ToolbarItem(placement: .cancellationAction) {
                                        
                                        
                                        Button(action: {
                                            presentTimerView.toggle()
                                            progressTimer?.invalidate()
                                            clickTimer?.invalidate()
                                        }) {
                                            Image(systemName: "arrow.left.circle.fill").foregroundColor(.gray)
                                        }
                                        
                                    }
                                    
                                }
                            }.padding(.horizontal).buttonStyle(BorderedButtonStyle(tint: .blue)).padding(.top, 5)
                            .padding(.bottom, 10)
                        
                        Button("Tutorial") {
                            presentTutorialView.toggle()
                        }.buttonStyle(BorderedButtonStyle(tint: .pink))
                            .fullScreenCover(isPresented: $presentTutorialView) {
                                HandsOnlyTutorialView(isPresented: $presentTutorialView).toolbar {
                                    
                                    ToolbarItem(placement: .cancellationAction) {
                                        
                                        Button(action: {
                                            presentTutorialView.toggle()
                                        }) {
                                            Image(systemName: "arrow.left.circle.fill").foregroundColor(.gray)
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
            
            VStack {
                TraditionalSettingsWarningView()
            }
            
        }.tabViewStyle(PageTabViewStyle())
    }
}
