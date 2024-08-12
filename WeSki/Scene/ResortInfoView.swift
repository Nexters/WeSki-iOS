//
//  ResortInfoView.swift
//  WeSki
//
//  Created by kokojong on 8/12/24.
//

import SwiftUI

struct ResortInfoView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("하이원 스키장")
                Text("운행중인 슬로프 3개")
                
            }
            Spacer()
            VStack {
                HStack {
                    Image(systemName: "cloud")
                        .resizable()
                        .frame(width: 54, height: 54)
                    Text("25 도씨")
                }
                Text("흐리고 비")
            }
        }
        .background(.pink)
        .padding()
    }
}

#Preview {
    ResortInfoView()
}
