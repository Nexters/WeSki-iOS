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
            LinearGradient(colors: [.homeGradientTop, .homeGradientBottom],
                           startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
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
