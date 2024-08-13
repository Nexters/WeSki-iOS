//
//  SplashView.swift
//  WeSki
//
//  Created by kokojong on 8/6/24.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .white], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack(alignment: .center) {
                Text("스플래시")
                    .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    SplashView()
}
