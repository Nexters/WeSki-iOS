//
//  SnowQualityView.swift
//  WeSki
//
//  Created by kokojong on 8/13/24.
//

import SwiftUI

struct SnowQualityTabView: View {
    @State private var selectedIndex = 0
    
    let options = ["괜찮아요", "별로에요"]
    
    var body: some View {
        LazyVStack(alignment: .leading) {
            Text("오늘의 설질")
            Text("상태가 좋아요") // 상태에 따라 달라짐 -> 80%, 50%, 30%
            Text("34명중 12명이 설질에 대해 투표했어요")
            
            Text("오늘같은 현장은 설질 괜찮을까요?")
            
            List {
                ForEach(0..<options.count, id: \.self) { index in
                    HStack {
                        Text(options[index])
                        Spacer()
                        Image(systemName: "checkmark")
                            .foregroundColor(selectedIndex == index ? Color.purple : Color.clear)
                    }
                    .padding()
                    .background(
                        selectedIndex == index ? Color.clear : Color.clear
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(selectedIndex == index ? Color.blue : Color.clear, lineWidth: 2)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .onTapGesture {
                        selectedIndex = index
                    }
                }
                .listRowSeparator(.hidden)
            }
            .frame(height: 180)
            .background(.yellow)
            .listStyle(.plain)
            
            Button(action: {
                print(selectedIndex)
            }, label: {
                Text("투표하기")
//                    .frame(maxWidth: .infinity, maxHeight: 46)
                    .frame(maxWidth: .infinity, minHeight: 46)
                    .clipShape(.rect(cornerRadius: 12))
                    .foregroundStyle(.white)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundStyle(Color.purple)
                    )
            })
        }
    }
}

#Preview {
    SnowQualityTabView()
}
