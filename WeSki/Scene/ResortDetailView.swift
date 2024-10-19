//
//  WebCamView.swift
//  WeSki
//
//  Created by kokojong on 8/12/24.
//

import SwiftUI
import SlidingTabView
import WebKit
import SpriteKit

struct ResortDetailView: View {
    @State private var selectedTabIndex = 0
    @State private var webViewHeight: CGFloat = 700 // 최초에 웹뷰를 보여주려고
    
    @State private var scrollViewOffset: CGFloat = 0
    @State private var startOffset: CGFloat = 0
    
    @State private var isNavBarHidden: Bool = false
    
    var resortInfo: Resort
    
    var scene: SKScene {
        let scene = SnowScene()
        scene.scaleMode = .resizeFill
        scene.backgroundColor = .clear
        return scene
    }
    
    var body: some View {
        ZStack {
            Image(.bg01).resizable().ignoresSafeArea()
            
            SpriteView(scene: scene, options: [.allowsTransparency])
                .ignoresSafeArea()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            
            ScrollViewReader(content: { proxyReader in
                ScrollView(.vertical) {
                    VStack(spacing: 0) {
                        ResortInfoView(resortInfo: resortInfo)
                            .padding(.bottom, 30)
                            .background(.white)
                            .cornerRadius(15)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 28)
                        
                        
                        SlidingTabView(selection: self.$selectedTabIndex, tabs: ["웹캠 정보", "날씨", "슬로프"], font: WeSkiFontStyle.title3(.semibold).font, activeAccentColor: .gray90, inactiveAccentColor: .gray90, selectionBarColor: .gray90)
                            .background(.white)
                            
                        
                        switch self.selectedTabIndex {
                        case 0:
                            WebView(url: resortInfo.resort.toWebcamURL().absoluteString, height: $webViewHeight)
                                .frame(height: webViewHeight) // 웹뷰의 높이를 동적으로 설정
                                .offset(y: -7)
                        case 1:
                            WeatherTabView(resortInfo: resortInfo)
                        case 2:
                            SlopeTabView()
                            Rectangle().frame(height: 6).foregroundColor(Color.gray20)
                            Rectangle().frame(height: 34).foregroundStyle(.white)
                            WebView(url: resortInfo.resort.toSlopeURL().absoluteString, height: $webViewHeight)
                                .frame(height: webViewHeight)
                        default:
                            EmptyView()
                        }
                        Rectangle().frame(height: 6).foregroundColor(Color.gray20)
                        SnowQualityView(key: resortInfo.key)
                    }
                    .id("SCROLL_TO_TOP")
                    .overlay(
                        GeometryReader{ proxy -> Color in
                            DispatchQueue.main.async {
                                //startOffset을 정해줌
                                if startOffset == 0 {
                                    self.startOffset = proxy.frame(in: .global).minY
                                }
                                let offset = proxy.frame(in: .global).minY
                                self.scrollViewOffset = offset - startOffset
                                self.isNavBarHidden = -scrollViewOffset > 20
                            }
                            return Color.clear
                        }.frame(width: 0, height: 0)
                        ,alignment: .top
                    )
                }
                .overlay(
                    Button(action: {
                        withAnimation(.default) {
                            proxyReader.scrollTo("SCROLL_TO_TOP", anchor: .top)
                        }
                    }, label: {
                        Image(.icnArrowUp)
                            .resizable()
                            .frame(width: 18, height: 18)
                            .foregroundColor(.gray60)
                            .padding(12)
                            .background(.white)
                            .clipShape(Circle())
                            .shadow(radius: 24)
                    })
                    .padding(.trailing, 20)
                    //베젤이 있는 기종이면 패딩 12, 아니라면 0
                        .padding(.bottom,getSafeArea().bottom == 0 ? 12 : 0)
                        .opacity(-scrollViewOffset > 10 ? 1 : 0)
                        .animation(Animation.easeIn)
                    ,alignment: .bottomTrailing
                )
            }) // ScrollViewReader
        }
        .background(.white)
        .modifier(NavToolbarModifier(key: resortInfo.key))
        .navigationBarTitleDisplayMode(.inline)
//        .navigationTitle("WeSki")
        .font(WeSkiFontStyle.h3(.bold).font)
        .foregroundColor(.gray100)
        .navigationBarColor(backgroundColor: .clear, titleColor: .gray100)
        .navigationBarHidden(isNavBarHidden)
        .animation(.easeIn, value: isNavBarHidden)
    }
}



//#Preview {
//    ResortDetailView(resort: .곤지암)
//}
