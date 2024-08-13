//
//  WebCamView.swift
//  WeSki
//
//  Created by kokojong on 8/12/24.
//

import SwiftUI
import SlidingTabView
import WebKit

struct WebCamTabView: View {
    @State private var selectedTabIndex = 0
    @State private var webViewHeight: CGFloat = .zero
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .white], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            ScrollView(.vertical) {
                VStack {
                    ResortInfoView()
                        .background(.white)
                        .cornerRadius(15)
                        .padding()
                    
                    SlidingTabView(selection: self.$selectedTabIndex, tabs: ["웹캠 정보", "날씨", "슬로프"], activeAccentColor: .black, inactiveAccentColor: .red, selectionBarColor: .black)
                    switch self.selectedTabIndex {
                    case 0:
                        WebView(url: "https://www.naver.com", height: $webViewHeight)
                            .frame(height: webViewHeight) // 웹뷰의 높이를 동적으로 설정
                    case 1:
                        Text("Second View")
                    case 2:
                        Text("Third View")
                    default:
                        EmptyView()
                    }
                    SnowQualityTabView()
                }
            }
        }
    }
}

struct WebView: UIViewRepresentable {
    let url: String
    @Binding var height: CGFloat
    
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView
        
        init(parent: WebView) {
            self.parent = parent
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            webView.evaluateJavaScript("document.documentElement.scrollHeight") { result, error in
                if let height = result as? CGFloat {
                    DispatchQueue.main.async {
                        self.parent.height = height
                    }
                }
            }
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: URL(string: url)!)
        uiView.load(request)
    }
}

#Preview {
    WebCamTabView()
}
