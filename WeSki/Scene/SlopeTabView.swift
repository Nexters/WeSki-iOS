//
//  SlopeTabView.swift
//  WeSki
//
//  Created by kokojong on 8/18/24.
//

import SwiftUI

struct SlopeTabView: View {
    let today = Calendar.current.dateComponents([.month, .day], from: .now)
    
    var body: some View {
        VStack(spacing: 26) {
            HStack(spacing: 0) {
                Title3Text("인기 시간대", weight: .semibold).foregroundColor(.gray90)
                Spacer().frame(width: 4)
                Image(.icnInfo).resizable().frame(width: 18, height: 18).foregroundColor(.gray40)
                Spacer()
                Body1Text("TMAP · \(today.month!)월 \(today.day!)일 업데이트", weight: .medium).foregroundColor(.gray50)
            }
            Image(.emptyArea)
        }
        .padding(.vertical, 32)
        .padding(.horizontal, 20)
        .background(.white)
        
    }
}

#Preview {
    SlopeTabView()
}
