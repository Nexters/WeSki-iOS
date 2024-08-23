//
//  NavToolbarModifier.swift
//  WeSki
//
//  Created by kokojong on 8/15/24.
//

import SwiftUI

struct NavToolbarModifier: ViewModifier {
    let key: Int
    
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden()
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    NavBackButtonView()
                }
                ToolbarItem(placement: .principal) {
                    Image(.weSkiNav).resizable().aspectRatio(contentMode: .fit).frame(height: 21).foregroundColor(.gray100)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    ShareLink(item: ResortEnum(rawValue: key)!.toShareURL()) {
                        Image(.icnShare).resizable().frame(width: 24, height: 24).foregroundColor(.gray90)
                    }
                }
            })
            .background(Color.gray90)
    }
}

struct NavigationBarModifier: ViewModifier {
    
    var backgroundColor: UIColor?
    var titleColor: UIColor?
    
    init(backgroundColor: UIColor?, titleColor: UIColor?) {
        self.backgroundColor = backgroundColor
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithTransparentBackground()
        coloredAppearance.backgroundColor = backgroundColor
        coloredAppearance.titleTextAttributes = [.foregroundColor: titleColor ?? .white]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: titleColor ?? .white]
        
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    }
    
    func body(content: Content) -> some View {
        ZStack{
            content
            VStack(spacing: 0) {
                GeometryReader { geometry in
                    Color(self.backgroundColor ?? .clear)
                        .frame(height: geometry.safeAreaInsets.top)
                        .edgesIgnoringSafeArea(.top)
                    Spacer()
                }
            }
        }
    }
}

struct NoAnimationButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(1.0)  // 눌렀을 때 크기 변화 제거
            .opacity(1.0)      // 눌렀을 때 불투명도 변화 제거
        
    }
}

// 커스텀 ButtonStyle
struct PressableButtonStyle: ButtonStyle {
    var normalColor: Color
    var pressedColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(configuration.isPressed ? pressedColor : normalColor)  // 눌린 상태에 따라 색상 변경
            .foregroundColor(.white)
            .cornerRadius(10)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)  // 눌렸을 때 살짝 크기를 줄이는 효과 (선택 사항)
    }
}
