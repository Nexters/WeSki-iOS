//
//  ResortInfoView.swift
//  WeSki
//
//  Created by kokojong on 8/12/24.
//

import SwiftUI

struct ResortInfoView: View {
    var resortInfo: Resort
    
    var body: some View {
        HStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                Spacer().frame(height: 4)
                Title1Text("\(resortInfo.resort.koreanName)", weight: .bold)
                    .foregroundColor(.gray90)
                Spacer().frame(height: 5)
                Body1Text("운행중인 슬로프 \(resortInfo.slopeNum)개", weight: .medium)
                    .foregroundColor(.gray60)
            }
            Spacer()
            VStack(alignment: .trailing, spacing: 0) {
                HStack(spacing: 0) {
                    resortInfo.weather.first!.name.image
                        .resizable()
                        .frame(width: 32, height: 32)
                    Spacer().frame(width: 8)
                    H15Text("\(resortInfo.weatherDetail.todayWeather.currTm)°", weight: .semibold)
                        .foregroundColor(.gray100)
                }
                Spacer().frame(height: 6)
                Body1Text("\(resortInfo.weather.first!.name.rawValue)", weight: .semibold)
                    .foregroundColor(.gray60)
            }
        }
        .padding(.top, 35)
        .padding(.leading, 30)
        .padding(.trailing, 24)
    }
}

