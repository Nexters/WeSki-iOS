//
//  WeSkiApp.swift
//  WeSki
//
//  Created by kokojong on 7/17/24.
//

import SwiftUI

@main
struct WeSkiApp: App {
    @State private var showHomeView = false
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                if showHomeView {
                    MainView()
                }
                else {
                    SplashView()
                        .onAppear(perform: {
                            
                        })
                        .onAppear(perform: {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                showHomeView = true
                            }
                        })
                }
            }
        }
    }
}
