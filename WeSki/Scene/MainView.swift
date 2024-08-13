//
//  MainView.swift
//  WeSki
//
//  Created by kokojong on 8/6/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .white], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            NavigationView {
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack {
                        ForEach(0..<7) { i in
                            NavigationLink(destination: WebCamTabView()) {
                                MainResortView()
                                    .background(.green)
                                    .cornerRadius(15)
                                    .padding()
                            }
                        }
                    }
                    .background(.blue)
                }
                .background(.purple)
            }
        }
    }
}

#Preview {
    MainView()
}
