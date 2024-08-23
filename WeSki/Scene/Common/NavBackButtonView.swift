//
//  NavBackButtonView.swift
//  WeSki
//
//  Created by kokojong on 8/15/24.
//

import SwiftUI

struct NavBackButtonView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        Button{
            self.presentationMode.wrappedValue.dismiss()
        } label: {
            HStack(spacing: 0) {
                Image(.icnChevronLeft) // 화살표 Image
                    .resizable()
                    .frame(width: 26, height: 26)
                    .foregroundStyle(Color.gray90)
            }
        }
    }

}
