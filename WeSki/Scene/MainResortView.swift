//
//  MainSkiView.swift
//  WeSki
//
//  Created by kokojong on 8/7/24.
//

import SwiftUI

struct MainResortView: View {
    var body: some View {
        VStack {
            ResortInfoView()
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(0..<7) { i in
                        VStack {
                            Text("\(i)요일")
                            Image(systemName: "cloud")
                                .resizable()
                                .frame(width: 54, height: 54)
                            Text("-\(i) 도씨")
                            Text("\(i) 도씨")
                        }
                        .background(.yellow)
                    }
                }
            }
            
        }
        .padding()
        
    }
}

#Preview {
    MainResortView()
}
