//
//  MainView.swift
//  WeSki
//
//  Created by kokojong on 8/6/24.
//

import SwiftUI
import SpriteKit

struct MainView: View {
    
    let resortList: [Resort] = Resort.mockData
    
    var scene: SKScene {
        let scene = SnowScene()
        scene.scaleMode = .resizeFill
        scene.backgroundColor = .clear
        return scene
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Image(.bg01).resizable().ignoresSafeArea()
                
                SpriteView(scene: scene, options: [.allowsTransparency])
                    .ignoresSafeArea()
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 0) {
                        
                        Image(.weSkiNav).resizable().aspectRatio(contentMode: .fit).frame(height: 21).foregroundColor(.gray100)
                        
                        Spacer().frame(height: 33)
                        
                        VStack(spacing: 16) {
                            ForEach(0..<resortList.count) { i in
                                NavigationLink(destination: ResortDetailView(resortInfo: resortList[i])) {
                                    MainResortView(resort: resortList[i])
                                        .background(Color.white)
                                        .cornerRadius(15)
                                }.buttonStyle(NoAnimationButtonStyle())
                            }
                        }
                    }
                }
                .padding(.horizontal, 20)
            } // ZStack
        }
        //        .navigationBarColor(backgroundColor: .main04, titleColor: .gray100)
    }
}

#Preview {
    MainView()
}

// 커스텀 네비게이션 기능 구현
extension View {
    func navigate(to destination: @escaping () -> some View) -> some View {
        self.background(
            NavigationLink(destination: destination(), label: {
                EmptyView()
            }).hidden()
        )
    }
}
