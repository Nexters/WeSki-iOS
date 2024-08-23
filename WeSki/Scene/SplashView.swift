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
            Image(.splash)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    SplashView()
}
