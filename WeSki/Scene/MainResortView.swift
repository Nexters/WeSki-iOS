//
//  MainSkiView.swift
//  WeSki
//
//  Created by kokojong on 8/7/24.
//

import SwiftUI

struct MainResortView: View {
    
    var resort: Resort
    
    let today = Date.now
    
    var body: some View {
        VStack(spacing: 0) {
            ResortInfoView(resortInfo: resort)
            Spacer().frame(height: 23)
            Rectangle().frame(height: 1)
                .foregroundColor(.gray80)
                .padding(.horizontal, 24)
                .opacity(0.1)
            Spacer().frame(height: 14)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 2) { // Resort Weather
                    Spacer().frame(width: 22) // spacer 2
                    
                    ForEach(0..<resort.weather.count) { i in
                        VStack(spacing: 0) {
                            Body3Text("\(today.nextDay(i).koreanWeekday())")
                                .foregroundColor(.gray60)
                            Spacer().frame(height: 7)
                            resort.weather[i].name.image
                                .resizable()
                                .frame(width: 32, height: 32)
                            Spacer().frame(height: 12)
                            Title3Text("\(resort.weatherDetail.weekWeather[i].minTm)°", weight: .semibold)
                                .foregroundColor(.gray90) // 최저온도
                            Body3Text("\(resort.weatherDetail.weekWeather[i].maxTm)°")
                                .foregroundColor(.gray60) // 현재온도
                        }
                        .padding(.all, 16)
                        .background(i == 0 ? Color.main05 : Color.white)
                        .cornerRadius(40)
                        .overlay {
                            if i == 0 {
                                RoundedRectangle(cornerRadius: 40)
                                    .stroke(Color.main01, lineWidth: 1)
                            }
                        }
                    }
                    
                    Spacer().frame(width: 22)
                }
                .padding(.all, 1)
            }
            .padding(.bottom, 17)
        }
    }
}

//#Preview {
//    MainResortView(resort: ResortEnum.곤지암)
//}
