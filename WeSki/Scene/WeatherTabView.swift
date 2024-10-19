//
//  WeatherTabView.swift
//  WeSki
//
//  Created by kokojong on 8/13/24.
//

import SwiftUI

struct WeatherTabView: View {
    var resortInfo: Resort
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading, spacing: 0) {
                VStack(alignment: .leading, spacing: 0) { // 상단 날씨 정보
                    Title3Text("실시간 날씨", weight: .semibold)
                        .foregroundStyle(Color.gray90)
                    Spacer().frame(height: 20)
                    H1Text("\(resortInfo.weatherDetail.todayWeather.currTm)°", weight: .semibold)
                        .foregroundStyle(Color.gray100)
                    Spacer().frame(height: 5)
                    Body1Text("체감 \(resortInfo.weatherDetail.todayWeather.currTm - 4)°", weight: .regular)
                        .foregroundStyle(Color.gray60)
                    Spacer().frame(height: 20)
                    H3Text("\(resortInfo.weather.first!.name.longText)", weight: .semibold)
                        .foregroundStyle(Color.gray90)
                    Spacer().frame(height: 6)
                    Body1Text("최고 \(resortInfo.weatherDetail.todayWeather.maxTm)° 최저 \(resortInfo.weatherDetail.todayWeather.minTm)°", weight: .regular)
                        .foregroundStyle(Color.gray60)
                }
                .padding(.horizontal, 24)
                
                Spacer().frame(height: 50)
                
                Rectangle().frame(height: 1).foregroundStyle(Color.gray30)
                    .padding(.horizontal, 24)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 24) { // Resort Weather
                        ForEach(0..<resortInfo.weatherDetail.dayWeather.count) { i in
                            VStack(spacing: 0) {
                                Body3Text("\(resortInfo.weatherDetail.dayWeather[i].timeName)", weight: .semibold)
                                    .foregroundColor(.gray50)
                                Spacer().frame(height: 13)
                                resortInfo.weatherDetail.dayWeather[i].weather.image
                                    .resizable()
                                    .frame(width: 32, height: 32)
                                Spacer().frame(height: 13)
                                Title3Text("\(resortInfo.weatherDetail.dayWeather[i].currTm)", weight: .semibold)
                                    .foregroundColor(.gray90) // 온도
                                Body3Text("\(resortInfo.weatherDetail.dayWeather[i].perRain)%")
                                    .foregroundColor(.gray60) // 강수확률
                            }
                        }
                    }
                }
                .padding(.top, 26)
                .padding(.bottom, 40)
                .padding(.horizontal, 24)
                
                Rectangle().frame(height: 6).foregroundColor(Color.gray20)
                
                VStack(spacing: 0) {
                    Title3Text("주간 예보", weight: .semibold)
                    Spacer().frame(height: 24)
                }
                .padding(.top, 32)
                .padding(.horizontal, 24)
                
                ForEach(0..<resortInfo.weatherDetail.weekWeather.count) { i in
                    HStack(alignment: .center, spacing: 0) {
                        Body1Text("\(resortInfo.weatherDetail.weekWeather[i].weekName)", weight: .semibold)
                        Spacer().frame(width: 5)
                        Body2Text("\(resortInfo.weatherDetail.weekWeather[i].name)")
                        Spacer()
                        
                        HStack(spacing: 0) {
//                            WeatherImage.random()
                            resortInfo.weatherDetail.weekWeather[i].weather.image
                                .resizable().frame(width: 24, height: 24)
                            Spacer().frame(width: 12)
                            VStack(spacing: 0) {
                                if i == 0 { Body3Text("강수").foregroundColor(.gray60) }
                                Body2Text("\(resortInfo.weatherDetail.weekWeather[i].perRain)%", weight: .semibold).foregroundColor(.gray70)
                            }
                        }.frame(width: 75)
                        Spacer().frame(width: 8)
                        HStack(spacing: 0) {
                            Title2Text("\(resortInfo.weatherDetail.weekWeather[i].maxTm)°").foregroundColor(.gray70)
                            Spacer().frame(width: 5)
                            Title2Text("/").foregroundColor(.gray50)
                            Spacer().frame(width: 3)
                            Title2Text("\(resortInfo.weatherDetail.weekWeather[i].minTm)°", weight: .semibold).foregroundColor(.main01)
                        }
                        .frame(width: 80) // MARK: 높은 온도
                        
                    }
                    .frame(height: 36)
                    .padding(.vertical, 6)
                    
                    Rectangle().frame(height: 1).foregroundColor(Color.gray20)
                }
                .padding(.horizontal, 24)
            } // vstack
            .padding(.top, 32)
//            .padding(.horizontal, 24)
        }
        .background(.white)
    }
}

//#Preview {
//    WeatherTabView()
//}
