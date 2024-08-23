//
//  SnowQualityView.swift
//  WeSki
//
//  Created by kokojong on 8/13/24.
//

import SwiftUI
import SimpleToast

struct SnowQualityView: View {
    let key: Int
    @State private var selectedIndex = 0
    @State var showToast: Bool = false
    @State var showAlreadyVotedToast: Bool = false
    
    let options = ["괜찮을 것 같아요", "별로일 것 같아요"]
    let snowQualityOptions = ["상태가 좋아요", "나쁘지 않아요", "좋지 않아요"]
    @State private var totalCnt: Int = 0
    @State private var likeCnt: Int = 0
    @State private var dislikeCnt: Int = 0
    @State private var votedResult: Int = 0 // 0, 1, 2
    
    var body: some View {
        LazyVStack(alignment: .leading, spacing: 0) {
            Title3Text("오늘의 설질", weight: .semibold)
                .foregroundColor(.gray80)
            Spacer().frame(height: 24)
            H3Text(snowQualityOptions[votedResult], weight: .semibold)
                .foregroundColor(.gray80) // 상태에 따라 달라짐 -> 80%, 50%, 30%
            Spacer().frame(height: 4)
            HStack(spacing: 0) {
                Body1Text("\(totalCnt)명 중 ", weight: .semibold)
                    .foregroundColor(.gray60)
                Body1Text("\(likeCnt)", weight: .bold)
                    .foregroundColor(.main01)
                Body1Text("명이 긍정적으로 투표했어요", weight: .semibold)
                    .foregroundColor(.gray60)
            }
            Spacer().frame(height: 24)
            Title3Text("오늘같은 현장은 설질 괜찮을까요?", weight: .semibold).foregroundColor(.gray90)
            Spacer().frame(height: 20)
            VStack(spacing: 12) {
                ForEach(0..<options.count, id: \.self) { index in
                    HStack(spacing: 0) {
                        Body1Text(options[index], weight: .regular)
                            .foregroundColor(.gray60)
                        Spacer()
                        Image(.icnCheck)
                            .foregroundColor(selectedIndex == index ? Color.main01 : Color.clear)
                            .frame(width: 20, height: 20)
                    }
                    .padding(.vertical, 10)
                    .padding(.leading, 16)
                    .padding(.trailing, 12)
                    .frame(height: 40)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        selectedIndex = index
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(selectedIndex == index ? Color.main01 : Color.gray30, lineWidth: 1)
                    )
                    .padding(1)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                Spacer().frame(height: 8) // 간격 20 맞추기 위해
            }
            
            Button(action: {
                Task {
                    
                    let voteResult = UserDefaultsManager.shared.fetchVote(key: key)
                    
                    if voteResult {
                        
                        try await NetworkManager.shared.request(api: .vote(key, selectedIndex == 0))
                        
                        try await calculateSnowmaking()
                        
                        showToast = true
                        
                    } else {
                        showAlreadyVotedToast = true
                    }
                }
            }, label: {
                Title3Text("투표하기", weight: .semibold)
                    .frame(maxWidth: .infinity, minHeight: 52)
                    .clipShape(.rect(cornerRadius: 8))
                    .foregroundStyle(Color.gray10)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundStyle(Color.main01)
                    )
                    .buttonStyle(PressableButtonStyle(normalColor: Color.main01, pressedColor: Color.sub05))
                   
            })
        }
        .padding(.top, 32)
        .padding(.horizontal, 24)
        .simpleToast(isPresented: $showToast, options: .init(alignment: .bottom , hideAfter: 2)) {
            HStack(spacing: 6) {
                Image(.icnSmile).resizable().frame(width: 24, height: 24).foregroundColor(.gray10)
                Body1Text("고마워요! 투표의 결과가 반영되었어요", weight: .bold).foregroundColor(.white)
                Spacer()
            }
            .padding(.vertical, 13)
            .padding(.horizontal, 20)
            .background(Color(uiColor: UIColor(hex: 0x171D23, alpha: 0.8)))
            .clipShape(.rect(cornerRadius: 14))
            .padding(.horizontal, 24)
            .offset(y: 30)
        }
        .simpleToast(isPresented: $showAlreadyVotedToast, options: .init(alignment: .bottom , hideAfter: 2)) {
            HStack(spacing: 6) {
                Image(.icnSad).resizable().frame(width: 24, height: 24).foregroundColor(.gray10)
                Body1Text("오늘 투표를 이미 완료했어요", weight: .bold).foregroundColor(.white)
                Spacer()
            }
            .padding(.vertical, 13)
            .padding(.horizontal, 20)
            .background(Color(uiColor: UIColor(hex: 0x171D23, alpha: 0.8)))
            .clipShape(.rect(cornerRadius: 14))
            .padding(.horizontal, 24)
            .offset(y: 30)
        }
        .padding(.bottom, 80)
        .background(.white)
        .onAppear {
            Task {
                try await calculateSnowmaking()
            }
        }
    }
    
    func calculateSnowmaking() async throws {
        let snowmaking = try await NetworkManager.shared.request(type: Snowmaking.self, api: .voteResult(key))
        totalCnt = snowmaking.totalNum
        likeCnt = snowmaking.likeNum
        dislikeCnt = totalCnt - likeCnt
        let per: Float = Float(likeCnt) / Float(totalCnt) * 100
        if per >= 80 { votedResult = 0 }
        else if per >= 50 { votedResult = 1 }
        else { votedResult = 2 }
    }
}


#Preview {
    SnowQualityView(key: 1)
}
