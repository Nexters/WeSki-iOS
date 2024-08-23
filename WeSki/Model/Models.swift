//
//  Models.swift
//  WeSki
//
//  Created by kokojong on 8/20/24.
//

import Foundation
import SwiftUI

struct Resort: Codable {
    let key: Int
    let resort: ResortEnum
    let slopeNum: Int
    let weather: [Weather]
    let weatherDetail: WeatherDetail
    
    init(key: Int, slopeNum: Int, weather: [Weather], weatherDetail: WeatherDetail) {
        self.key = key
        self.resort = ResortEnum(rawValue: key)!
        self.slopeNum = slopeNum
        self.weather = weather
        self.weatherDetail = weatherDetail
    }
}

struct Weather: Codable {
    let dayName: String
    let name: WeatherEnum // 날씨 별 이름?
//    let weatherImage: Image
    let maxTm: Int
    let minTm: Int
    let perRain: Int // 강수확률
    
    init(dayName: String, name: WeatherEnum, maxTm: Int, minTm: Int, perRain: Int) {
        self.dayName = dayName
        self.name = name
//        self.weatherImage = name.image
        self.maxTm = maxTm
        self.minTm = minTm
        self.perRain = perRain
    }
}

enum WeatherEnum: String, Codable {
    case 맑음 = "맑음"
    case 구름 = "구름많음"
    case 안개 = "흐림"
    case 눈 = "구름많고 눈"
    case 비 = "비"
    case 눈비 = "눈비"
    
    var longText: String {
        switch self {
        case .맑음:
            "화창하고 다소 더워요"
        case .구름:
            "구름이 많고 다소 더워요"
        case .안개:
            "흐리고 다소 더워요"
        case .눈:
            "눈이 오고 다소 더워요"
        case .비:
            "비가 오고 다소 더워요"
        case .눈비:
            "눈비가 내리고 다소 더워요"
        }
    }
    
    var image: Image {
        switch self {
        case .맑음:
                .init(.iconWeather2)
        case .구름:
                .init(.iconWeather5)
        case .안개:
                .init(.iconWeather1)
        case .눈:
                .init(.iconWeather4)
        case .비:
                .init(.iconWeather3)
        case .눈비:
                .init(.iconWeather6)
        }
    }
}

struct WeatherDetail: Codable {
    let todayWeather: TodayWeather
    let dayWeather: [DayWeather]
    let weekWeather: [WeekWeather]
}

struct TodayWeather: Codable {
    let fullDescription: String
    let currTm: Int
    let maxTm: Int
    let minTm: Int
    let perRain: Int
}

struct DayWeather: Codable {
    let timeName: String
    let currTm: Int
    let perRain: Int
    let weather: WeatherEnum
}

struct WeekWeather: Codable {
    let weekName: String
    let name: String
    let maxTm: Int
    let minTm: Int
    let perRain: Int
    let weather: WeatherEnum
}

// 설질 투표 결과
struct Snowmaking: Codable {
    let totalNum: Int
    let likeNum: Int
}

// 2, 8, 5, 7, 9, 1, 3, 4, 6, 10
extension Resort {
    static let mockData: [Resort] = [
        Resort(key: 2, slopeNum: 0,
               weather: [
                .init(dayName: Date.now.koreanWeekday(), name: .맑음, maxTm: 31, minTm: 25, perRain: 0),
                .init(dayName: Date.now.nextDay(1).koreanWeekday(), name: .맑음, maxTm: 31, minTm: 25, perRain: 0),
                .init(dayName: Date.now.nextDay(2).koreanWeekday(), name: .맑음, maxTm: 30, minTm: 26, perRain: 0),
                .init(dayName: Date.now.nextDay(3).koreanWeekday(), name: .구름, maxTm: 31, minTm: 25, perRain: 10),
                .init(dayName: Date.now.nextDay(4).koreanWeekday(), name: .맑음, maxTm: 30, minTm: 25, perRain: 10),
                .init(dayName: Date.now.nextDay(5).koreanWeekday(), name: .맑음, maxTm: 30, minTm: 25, perRain: 0),
                .init(dayName: Date.now.nextDay(6).koreanWeekday(), name: .맑음, maxTm: 29, minTm: 25, perRain: 0),
               ],
               weatherDetail: WeatherDetail(todayWeather: TodayWeather(fullDescription: "비었음", currTm: 26, maxTm: 31, minTm: 25, perRain: 0), dayWeather: [
                DayWeather.init(timeName: "오전 8시", currTm: 26, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오전 10시", currTm: 26, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 12시", currTm: 30, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 2시", currTm: 31, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 4시", currTm: 31, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 6시", currTm: 28, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 8시", currTm: 28, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 10시", currTm: 25, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오전 12시", currTm: 25, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오전 2시", currTm: 25, perRain: 0, weather: .맑음),
               ], weekWeather: [
                WeekWeather.init(weekName: "오늘", name: Date.now.shortDate(), maxTm: 31, minTm: 25, perRain: 0, weather: .맑음),
                WeekWeather.init(weekName: Date.now.nextDay(1).koreanWeekday(), name: Date.now.nextDay(1).shortDate(), maxTm: 31, minTm: 25, perRain: 0, weather: .맑음),
                WeekWeather.init(weekName: Date.now.nextDay(2).koreanWeekday(), name: Date.now.nextDay(2).shortDate(), maxTm: 31, minTm: 24, perRain: 0, weather: .맑음),
                WeekWeather.init(weekName: Date.now.nextDay(3).koreanWeekday(), name: Date.now.nextDay(3).shortDate(), maxTm: 31, minTm: 23, perRain: 0, weather: .맑음),
                WeekWeather.init(weekName: Date.now.nextDay(4).koreanWeekday(), name: Date.now.nextDay(4).shortDate(), maxTm: 30, minTm: 24, perRain: 10, weather: .구름),
                WeekWeather.init(weekName: Date.now.nextDay(5).koreanWeekday(), name: Date.now.nextDay(5).shortDate(), maxTm: 30, minTm: 24, perRain: 10, weather: .맑음),
                WeekWeather.init(weekName: Date.now.nextDay(6).koreanWeekday(), name: Date.now.nextDay(6).shortDate(), maxTm: 29, minTm: 22, perRain: 0, weather: .맑음),
               ])),
        
        Resort(key: 8, slopeNum: 0,
               weather: [
                .init(dayName: Date.now.koreanWeekday(), name: .구름, maxTm: 31, minTm: 26, perRain: 0),
                .init(dayName: Date.now.nextDay(1).koreanWeekday(), name: .맑음, maxTm: 31, minTm: 26, perRain: 0),
                .init(dayName: Date.now.nextDay(2).koreanWeekday(), name: .맑음, maxTm: 30, minTm: 25, perRain: 0),
                .init(dayName: Date.now.nextDay(3).koreanWeekday(), name: .구름, maxTm: 31, minTm: 25, perRain: 20),
                .init(dayName: Date.now.nextDay(4).koreanWeekday(), name: .맑음, maxTm: 30, minTm: 24, perRain: 20),
                .init(dayName: Date.now.nextDay(5).koreanWeekday(), name: .맑음, maxTm: 30, minTm: 24, perRain: 0),
                .init(dayName: Date.now.nextDay(6).koreanWeekday(), name: .맑음, maxTm: 29, minTm: 24, perRain: 0),
               ],
               weatherDetail: WeatherDetail(todayWeather: TodayWeather(fullDescription: "비었음", currTm: 27, maxTm: 31, minTm: 25, perRain: 0), dayWeather: [
                DayWeather.init(timeName: "오전 8시", currTm: 26, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오전 10시", currTm: 27, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 12시", currTm: 30, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 2시", currTm: 31, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 4시", currTm: 31, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 6시", currTm: 29, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 8시", currTm: 28, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 10시", currTm: 26, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오전 12시", currTm: 25, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오전 2시", currTm: 25, perRain: 0, weather: .맑음),
               ], weekWeather: [
                WeekWeather.init(weekName: "오늘", name: Date.now.shortDate(), maxTm: 31, minTm: 25, perRain: 0, weather: .맑음),
                WeekWeather.init(weekName: Date.now.nextDay(1).koreanWeekday(), name: Date.now.nextDay(1).shortDate(), maxTm: 31, minTm: 25, perRain: 0, weather: .맑음),
                WeekWeather.init(weekName: Date.now.nextDay(2).koreanWeekday(), name: Date.now.nextDay(2).shortDate(), maxTm: 31, minTm: 25, perRain: 0, weather: .맑음),
                WeekWeather.init(weekName: Date.now.nextDay(3).koreanWeekday(), name: Date.now.nextDay(3).shortDate(), maxTm: 31, minTm: 23, perRain: 20, weather: .맑음),
                WeekWeather.init(weekName: Date.now.nextDay(4).koreanWeekday(), name: Date.now.nextDay(4).shortDate(), maxTm: 30, minTm: 24, perRain: 20, weather: .구름),
                WeekWeather.init(weekName: Date.now.nextDay(5).koreanWeekday(), name: Date.now.nextDay(5).shortDate(), maxTm: 30, minTm: 25, perRain: 0, weather: .맑음),
                WeekWeather.init(weekName: Date.now.nextDay(6).koreanWeekday(), name: Date.now.nextDay(6).shortDate(), maxTm: 30, minTm: 24, perRain: 0, weather: .맑음),
               ])),
        
        Resort(key: 5, slopeNum: 0,
               weather: [
                .init(dayName: Date.now.koreanWeekday(), name: .맑음, maxTm: 31, minTm: 25, perRain: 0),
                .init(dayName: Date.now.nextDay(1).koreanWeekday(), name: .맑음, maxTm: 31, minTm: 25, perRain: 10),
                .init(dayName: Date.now.nextDay(2).koreanWeekday(), name: .구름, maxTm: 30, minTm: 26, perRain: 0),
                .init(dayName: Date.now.nextDay(3).koreanWeekday(), name: .구름, maxTm: 31, minTm: 25, perRain: 0),
                .init(dayName: Date.now.nextDay(4).koreanWeekday(), name: .맑음, maxTm: 30, minTm: 25, perRain: 10),
                .init(dayName: Date.now.nextDay(5).koreanWeekday(), name: .맑음, maxTm: 30, minTm: 25, perRain: 0),
                .init(dayName: Date.now.nextDay(6).koreanWeekday(), name: .맑음, maxTm: 30, minTm: 25, perRain: 0),
               ],
               weatherDetail: WeatherDetail(todayWeather: TodayWeather(fullDescription: "비었음", currTm: 28, maxTm: 31, minTm: 25, perRain: 0), dayWeather: [
                DayWeather.init(timeName: "오전 8시", currTm: 27, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오전 10시", currTm: 28, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 12시", currTm: 30, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 2시", currTm: 31, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 4시", currTm: 31, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 6시", currTm: 28, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 8시", currTm: 28, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 10시", currTm: 26, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오전 12시", currTm: 25, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오전 2시", currTm: 25, perRain: 0, weather: .맑음),
               ], weekWeather: [
                WeekWeather.init(weekName: "오늘", name: Date.now.shortDate(), maxTm: 31, minTm: 25, perRain: 0, weather: .맑음),
                WeekWeather.init(weekName: Date.now.nextDay(1).koreanWeekday(), name: Date.now.nextDay(1).shortDate(), maxTm: 30, minTm: 25, perRain: 10, weather: .맑음),
                WeekWeather.init(weekName: Date.now.nextDay(2).koreanWeekday(), name: Date.now.nextDay(2).shortDate(), maxTm: 30, minTm: 25, perRain: 0, weather: .맑음),
                WeekWeather.init(weekName: Date.now.nextDay(3).koreanWeekday(), name: Date.now.nextDay(3).shortDate(), maxTm: 30, minTm: 26, perRain: 0, weather: .맑음),
                WeekWeather.init(weekName: Date.now.nextDay(4).koreanWeekday(), name: Date.now.nextDay(4).shortDate(), maxTm: 31, minTm: 25, perRain: 10, weather: .구름),
                WeekWeather.init(weekName: Date.now.nextDay(5).koreanWeekday(), name: Date.now.nextDay(5).shortDate(), maxTm: 30, minTm: 22, perRain: 0, weather: .맑음),
                WeekWeather.init(weekName: Date.now.nextDay(6).koreanWeekday(), name: Date.now.nextDay(6).shortDate(), maxTm: 29, minTm: 22, perRain: 0, weather: .맑음),
               ])),
        
        Resort(key: 7, slopeNum: 0,
               weather: [
                .init(dayName: Date.now.koreanWeekday(), name: .맑음, maxTm: 31, minTm: 25, perRain: 10),
                .init(dayName: Date.now.nextDay(1).koreanWeekday(), name: .맑음, maxTm: 31, minTm: 25, perRain: 0),
                .init(dayName: Date.now.nextDay(2).koreanWeekday(), name: .맑음, maxTm: 30, minTm: 24, perRain: 0),
                .init(dayName: Date.now.nextDay(3).koreanWeekday(), name: .구름, maxTm: 31, minTm: 23, perRain: 10),
                .init(dayName: Date.now.nextDay(4).koreanWeekday(), name: .맑음, maxTm: 30, minTm: 22, perRain: 10),
                .init(dayName: Date.now.nextDay(5).koreanWeekday(), name: .맑음, maxTm: 30, minTm: 22, perRain: 0),
                .init(dayName: Date.now.nextDay(6).koreanWeekday(), name: .맑음, maxTm: 29, minTm: 22, perRain: 0),
               ],
               weatherDetail: WeatherDetail(todayWeather: TodayWeather(fullDescription: "비었음", currTm: 27, maxTm: 31, minTm: 25, perRain: 0), dayWeather: [
                DayWeather.init(timeName: "오전 8시", currTm: 28, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오전 10시", currTm: 29, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 12시", currTm: 30, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 2시", currTm: 31, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 4시", currTm: 31, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 6시", currTm: 28, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 8시", currTm: 28, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 10시", currTm: 26, perRain: 10, weather: .맑음),
                DayWeather.init(timeName: "오전 12시", currTm: 25, perRain: 10, weather: .맑음),
                DayWeather.init(timeName: "오전 2시", currTm: 25, perRain: 0, weather: .맑음),
               ], weekWeather: [
                WeekWeather.init(weekName: "오늘", name: Date.now.shortDate(), maxTm: 31, minTm: 25, perRain: 10, weather: .맑음),
                WeekWeather.init(weekName: Date.now.nextDay(1).koreanWeekday(), name: Date.now.nextDay(1).shortDate(), maxTm: 31, minTm: 25, perRain: 0, weather: .맑음),
                WeekWeather.init(weekName: Date.now.nextDay(2).koreanWeekday(), name: Date.now.nextDay(2).shortDate(), maxTm: 31, minTm: 24, perRain: 0, weather: .맑음),
                WeekWeather.init(weekName: Date.now.nextDay(3).koreanWeekday(), name: Date.now.nextDay(3).shortDate(), maxTm: 31, minTm: 23, perRain: 0, weather: .맑음),
                WeekWeather.init(weekName: Date.now.nextDay(4).koreanWeekday(), name: Date.now.nextDay(4).shortDate(), maxTm: 30, minTm: 22, perRain: 10, weather: .구름),
                WeekWeather.init(weekName: Date.now.nextDay(5).koreanWeekday(), name: Date.now.nextDay(5).shortDate(), maxTm: 30, minTm: 22, perRain: 10, weather: .맑음),
                WeekWeather.init(weekName: Date.now.nextDay(6).koreanWeekday(), name: Date.now.nextDay(6).shortDate(), maxTm: 29, minTm: 22, perRain: 0, weather: .맑음),
               ])),

        Resort(key: 9, slopeNum: 0,
               weather: [
                .init(dayName: Date.now.koreanWeekday(), name: .맑음, maxTm: 31, minTm: 25, perRain: 10),
                .init(dayName: Date.now.nextDay(1).koreanWeekday(), name: .맑음, maxTm: 31, minTm: 25, perRain: 0),
                .init(dayName: Date.now.nextDay(2).koreanWeekday(), name: .맑음, maxTm: 30, minTm: 24, perRain: 0),
                .init(dayName: Date.now.nextDay(3).koreanWeekday(), name: .구름, maxTm: 31, minTm: 23, perRain: 10),
                .init(dayName: Date.now.nextDay(4).koreanWeekday(), name: .맑음, maxTm: 30, minTm: 22, perRain: 10),
                .init(dayName: Date.now.nextDay(5).koreanWeekday(), name: .맑음, maxTm: 30, minTm: 22, perRain: 0),
                .init(dayName: Date.now.nextDay(6).koreanWeekday(), name: .맑음, maxTm: 29, minTm: 22, perRain: 0),
               ],
               weatherDetail: WeatherDetail(todayWeather: TodayWeather(fullDescription: "비었음", currTm: 27, maxTm: 31, minTm: 25, perRain: 0), dayWeather: [
                DayWeather.init(timeName: "오전 8시", currTm: 28, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오전 10시", currTm: 29, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 12시", currTm: 30, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 2시", currTm: 31, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 4시", currTm: 31, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 6시", currTm: 28, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 8시", currTm: 28, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 10시", currTm: 26, perRain: 10, weather: .맑음),
                DayWeather.init(timeName: "오전 12시", currTm: 25, perRain: 10, weather: .맑음),
                DayWeather.init(timeName: "오전 2시", currTm: 25, perRain: 0, weather: .맑음),
               ], weekWeather: [
                WeekWeather.init(weekName: "오늘", name: Date.now.shortDate(), maxTm: 31, minTm: 25, perRain: 10, weather: .맑음),
                WeekWeather.init(weekName: Date.now.nextDay(1).koreanWeekday(), name: Date.now.nextDay(1).shortDate(), maxTm: 31, minTm: 25, perRain: 0, weather: .맑음),
                WeekWeather.init(weekName: Date.now.nextDay(2).koreanWeekday(), name: Date.now.nextDay(2).shortDate(), maxTm: 31, minTm: 24, perRain: 0, weather: .맑음),
                WeekWeather.init(weekName: Date.now.nextDay(3).koreanWeekday(), name: Date.now.nextDay(3).shortDate(), maxTm: 31, minTm: 23, perRain: 0, weather: .맑음),
                WeekWeather.init(weekName: Date.now.nextDay(4).koreanWeekday(), name: Date.now.nextDay(4).shortDate(), maxTm: 30, minTm: 22, perRain: 10, weather: .구름),
                WeekWeather.init(weekName: Date.now.nextDay(5).koreanWeekday(), name: Date.now.nextDay(5).shortDate(), maxTm: 30, minTm: 22, perRain: 10, weather: .맑음),
                WeekWeather.init(weekName: Date.now.nextDay(6).koreanWeekday(), name: Date.now.nextDay(6).shortDate(), maxTm: 29, minTm: 22, perRain: 0, weather: .맑음),
               ])),
        
        Resort(key: 1, slopeNum: 0,
               weather: [
                .init(dayName: Date.now.koreanWeekday(), name: .맑음, maxTm: 31, minTm: 25, perRain: 0),
                .init(dayName: Date.now.nextDay(1).koreanWeekday(), name: .맑음, maxTm: 31, minTm: 25, perRain: 0),
                .init(dayName: Date.now.nextDay(2).koreanWeekday(), name: .맑음, maxTm: 30, minTm: 24, perRain: 0),
                .init(dayName: Date.now.nextDay(3).koreanWeekday(), name: .구름, maxTm: 31, minTm: 23, perRain: 10),
                .init(dayName: Date.now.nextDay(4).koreanWeekday(), name: .맑음, maxTm: 30, minTm: 22, perRain: 10),
                .init(dayName: Date.now.nextDay(5).koreanWeekday(), name: .맑음, maxTm: 30, minTm: 22, perRain: 0),
                .init(dayName: Date.now.nextDay(6).koreanWeekday(), name: .맑음, maxTm: 29, minTm: 22, perRain: 0),
               ],
               weatherDetail: WeatherDetail(todayWeather: TodayWeather(fullDescription: "비었음", currTm: 27, maxTm: 31, minTm: 25, perRain: 0), dayWeather: [
                DayWeather.init(timeName: "오전 8시", currTm: 26, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오전 10시", currTm: 26, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 12시", currTm: 30, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 2시", currTm: 31, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 4시", currTm: 31, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 6시", currTm: 28, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 8시", currTm: 28, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 10시", currTm: 25, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오전 12시", currTm: 25, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오전 2시", currTm: 25, perRain: 0, weather: .맑음),
               ], weekWeather: [
                WeekWeather.init(weekName: "오늘", name: Date.now.shortDate(), maxTm: 31, minTm: 25, perRain: 10, weather: .맑음),
                WeekWeather.init(weekName: Date.now.nextDay(1).koreanWeekday(), name: Date.now.nextDay(1).shortDate(), maxTm: 31, minTm: 25, perRain: 0, weather: .맑음),
                WeekWeather.init(weekName: Date.now.nextDay(2).koreanWeekday(), name: Date.now.nextDay(2).shortDate(), maxTm: 31, minTm: 24, perRain: 0, weather: .맑음),
                WeekWeather.init(weekName: Date.now.nextDay(3).koreanWeekday(), name: Date.now.nextDay(3).shortDate(), maxTm: 31, minTm: 23, perRain: 0, weather: .맑음),
                WeekWeather.init(weekName: Date.now.nextDay(4).koreanWeekday(), name: Date.now.nextDay(4).shortDate(), maxTm: 30, minTm: 22, perRain: 10, weather: .구름),
                WeekWeather.init(weekName: Date.now.nextDay(5).koreanWeekday(), name: Date.now.nextDay(5).shortDate(), maxTm: 30, minTm: 22, perRain: 10, weather: .맑음),
                WeekWeather.init(weekName: Date.now.nextDay(6).koreanWeekday(), name: Date.now.nextDay(6).shortDate(), maxTm: 29, minTm: 22, perRain: 0, weather: .맑음),
               ])),
        
        Resort(key: 3, slopeNum: 0,
               weather: [
                .init(dayName: Date.now.koreanWeekday(), name: .맑음, maxTm: 31, minTm: 25, perRain: 0),
                .init(dayName: Date.now.nextDay(1).koreanWeekday(), name: .맑음, maxTm: 31, minTm: 25, perRain: 0),
                .init(dayName: Date.now.nextDay(2).koreanWeekday(), name: .맑음, maxTm: 30, minTm: 24, perRain: 0),
                .init(dayName: Date.now.nextDay(3).koreanWeekday(), name: .구름, maxTm: 31, minTm: 23, perRain: 10),
                .init(dayName: Date.now.nextDay(4).koreanWeekday(), name: .맑음, maxTm: 30, minTm: 22, perRain: 10),
                .init(dayName: Date.now.nextDay(5).koreanWeekday(), name: .맑음, maxTm: 30, minTm: 22, perRain: 0),
                .init(dayName: Date.now.nextDay(6).koreanWeekday(), name: .맑음, maxTm: 29, minTm: 22, perRain: 0),
               ],
               weatherDetail: WeatherDetail(todayWeather: TodayWeather(fullDescription: "비었음", currTm: 27, maxTm: 31, minTm: 25, perRain: 0), dayWeather: [
                DayWeather.init(timeName: "오전 8시", currTm: 26, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오전 10시", currTm: 26, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 12시", currTm: 30, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 2시", currTm: 31, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 4시", currTm: 31, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 6시", currTm: 28, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 8시", currTm: 28, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 10시", currTm: 25, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오전 12시", currTm: 25, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오전 2시", currTm: 25, perRain: 0, weather: .맑음),
               ], weekWeather: [
                WeekWeather.init(weekName: "오늘", name: Date.now.shortDate(), maxTm: 31, minTm: 25, perRain: 10, weather: .맑음),
                WeekWeather.init(weekName: Date.now.nextDay(1).koreanWeekday(), name: Date.now.nextDay(1).shortDate(), maxTm: 31, minTm: 25, perRain: 0, weather: .맑음),
                WeekWeather.init(weekName: Date.now.nextDay(2).koreanWeekday(), name: Date.now.nextDay(2).shortDate(), maxTm: 31, minTm: 24, perRain: 0, weather: .맑음),
                WeekWeather.init(weekName: Date.now.nextDay(3).koreanWeekday(), name: Date.now.nextDay(3).shortDate(), maxTm: 31, minTm: 23, perRain: 0, weather: .맑음),
                WeekWeather.init(weekName: Date.now.nextDay(4).koreanWeekday(), name: Date.now.nextDay(4).shortDate(), maxTm: 30, minTm: 22, perRain: 10, weather: .구름),
                WeekWeather.init(weekName: Date.now.nextDay(5).koreanWeekday(), name: Date.now.nextDay(5).shortDate(), maxTm: 30, minTm: 22, perRain: 10, weather: .맑음),
                WeekWeather.init(weekName: Date.now.nextDay(6).koreanWeekday(), name: Date.now.nextDay(6).shortDate(), maxTm: 29, minTm: 22, perRain: 0, weather: .맑음),
               ])),
        
        Resort(key: 4, slopeNum: 0,
               weather: [
                .init(dayName: Date.now.koreanWeekday(), name: .맑음, maxTm: 29, minTm: 25, perRain: 0),
                .init(dayName: Date.now.nextDay(1).koreanWeekday(), name: .맑음, maxTm: 29, minTm: 25, perRain: 0),
                .init(dayName: Date.now.nextDay(2).koreanWeekday(), name: .맑음, maxTm: 29, minTm: 24, perRain: 0),
                .init(dayName: Date.now.nextDay(3).koreanWeekday(), name: .구름, maxTm: 29, minTm: 23, perRain: 10),
                .init(dayName: Date.now.nextDay(4).koreanWeekday(), name: .맑음, maxTm: 30, minTm: 23, perRain: 0),
                .init(dayName: Date.now.nextDay(5).koreanWeekday(), name: .맑음, maxTm: 28, minTm: 22, perRain: 15),
                .init(dayName: Date.now.nextDay(6).koreanWeekday(), name: .맑음, maxTm: 28, minTm: 22, perRain: 0),
               ],
               weatherDetail: WeatherDetail(todayWeather: TodayWeather(fullDescription: "비었음", currTm: 27, maxTm: 31, minTm: 25, perRain: 0), dayWeather: [
                DayWeather.init(timeName: "오전 8시", currTm: 26, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오전 10시", currTm: 26, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 12시", currTm: 30, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 2시", currTm: 31, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 4시", currTm: 31, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 6시", currTm: 28, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 8시", currTm: 28, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 10시", currTm: 25, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오전 12시", currTm: 25, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오전 2시", currTm: 25, perRain: 0, weather: .맑음),
               ], weekWeather: [
                WeekWeather.init(weekName: "오늘", name: Date.now.shortDate(), maxTm: 31, minTm: 25, perRain: 0, weather: .맑음),
                WeekWeather.init(weekName: Date.now.nextDay(1).koreanWeekday(), name: Date.now.nextDay(1).shortDate(), maxTm: 31, minTm: 25, perRain: 0, weather: .맑음),
                WeekWeather.init(weekName: Date.now.nextDay(2).koreanWeekday(), name: Date.now.nextDay(2).shortDate(), maxTm: 31, minTm: 24, perRain: 0, weather: .맑음),
                WeekWeather.init(weekName: Date.now.nextDay(3).koreanWeekday(), name: Date.now.nextDay(3).shortDate(), maxTm: 31, minTm: 23, perRain: 10, weather: .맑음),
                WeekWeather.init(weekName: Date.now.nextDay(4).koreanWeekday(), name: Date.now.nextDay(4).shortDate(), maxTm: 30, minTm: 22, perRain: 0, weather: .구름),
                WeekWeather.init(weekName: Date.now.nextDay(5).koreanWeekday(), name: Date.now.nextDay(5).shortDate(), maxTm: 30, minTm: 22, perRain: 15, weather: .맑음),
                WeekWeather.init(weekName: Date.now.nextDay(6).koreanWeekday(), name: Date.now.nextDay(6).shortDate(), maxTm: 29, minTm: 22, perRain: 0, weather: .맑음),
               ])),
        
        Resort(key: 6, slopeNum: 0,
               weather: [
                .init(dayName: Date.now.koreanWeekday(), name: .맑음, maxTm: 31, minTm: 26, perRain: 15),
                .init(dayName: Date.now.nextDay(1).koreanWeekday(), name: .맑음, maxTm: 31, minTm: 25, perRain: 0),
                .init(dayName: Date.now.nextDay(2).koreanWeekday(), name: .맑음, maxTm: 30, minTm: 24, perRain: 0),
                .init(dayName: Date.now.nextDay(3).koreanWeekday(), name: .구름, maxTm: 31, minTm: 23, perRain: 10),
                .init(dayName: Date.now.nextDay(4).koreanWeekday(), name: .맑음, maxTm: 30, minTm: 22, perRain: 10),
                .init(dayName: Date.now.nextDay(5).koreanWeekday(), name: .맑음, maxTm: 30, minTm: 22, perRain: 0),
                .init(dayName: Date.now.nextDay(6).koreanWeekday(), name: .맑음, maxTm: 29, minTm: 22, perRain: 0),
               ],
               weatherDetail: WeatherDetail(todayWeather: TodayWeather(fullDescription: "비었음", currTm: 27, maxTm: 31, minTm: 25, perRain: 0), dayWeather: [
                DayWeather.init(timeName: "오전 8시", currTm: 26, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오전 10시", currTm: 26, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 12시", currTm: 30, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 2시", currTm: 31, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 4시", currTm: 31, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 6시", currTm: 30, perRain: 10, weather: .맑음),
                DayWeather.init(timeName: "오후 8시", currTm: 28, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 10시", currTm: 26, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오전 12시", currTm: 25, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오전 2시", currTm: 25, perRain: 0, weather: .맑음),
               ], weekWeather: [
                WeekWeather.init(weekName: "오늘", name: Date.now.shortDate(), maxTm: 31, minTm: 26, perRain: 15, weather: .맑음),
                WeekWeather.init(weekName: Date.now.nextDay(1).koreanWeekday(), name: Date.now.nextDay(1).shortDate(), maxTm: 31, minTm: 25, perRain: 0, weather: .맑음),
                WeekWeather.init(weekName: Date.now.nextDay(2).koreanWeekday(), name: Date.now.nextDay(2).shortDate(), maxTm: 31, minTm: 24, perRain: 0, weather: .맑음),
                WeekWeather.init(weekName: Date.now.nextDay(3).koreanWeekday(), name: Date.now.nextDay(3).shortDate(), maxTm: 31, minTm: 23, perRain: 0, weather: .맑음),
                WeekWeather.init(weekName: Date.now.nextDay(4).koreanWeekday(), name: Date.now.nextDay(4).shortDate(), maxTm: 30, minTm: 22, perRain: 10, weather: .구름),
                WeekWeather.init(weekName: Date.now.nextDay(5).koreanWeekday(), name: Date.now.nextDay(5).shortDate(), maxTm: 30, minTm: 22, perRain: 10, weather: .맑음),
                WeekWeather.init(weekName: Date.now.nextDay(6).koreanWeekday(), name: Date.now.nextDay(6).shortDate(), maxTm: 29, minTm: 22, perRain: 0, weather: .맑음),
               ])),
        
        Resort(key: 10, slopeNum: 0,
               weather: [
                .init(dayName: Date.now.koreanWeekday(), name: .맑음, maxTm: 31, minTm: 25, perRain: 0),
                .init(dayName: Date.now.nextDay(1).koreanWeekday(), name: .맑음, maxTm: 31, minTm: 25, perRain: 0),
                .init(dayName: Date.now.nextDay(2).koreanWeekday(), name: .맑음, maxTm: 30, minTm: 24, perRain: 0),
                .init(dayName: Date.now.nextDay(3).koreanWeekday(), name: .구름, maxTm: 31, minTm: 23, perRain: 10),
                .init(dayName: Date.now.nextDay(4).koreanWeekday(), name: .맑음, maxTm: 30, minTm: 22, perRain: 10),
                .init(dayName: Date.now.nextDay(5).koreanWeekday(), name: .맑음, maxTm: 30, minTm: 22, perRain: 0),
                .init(dayName: Date.now.nextDay(6).koreanWeekday(), name: .맑음, maxTm: 29, minTm: 22, perRain: 0),
               ],
               weatherDetail: WeatherDetail(todayWeather: TodayWeather(fullDescription: "비었음", currTm: 27, maxTm: 31, minTm: 25, perRain: 0), dayWeather: [
                DayWeather.init(timeName: "오전 8시", currTm: 26, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오전 10시", currTm: 26, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 12시", currTm: 30, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 2시", currTm: 31, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 4시", currTm: 31, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 6시", currTm: 28, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 8시", currTm: 28, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오후 10시", currTm: 25, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오전 12시", currTm: 25, perRain: 0, weather: .맑음),
                DayWeather.init(timeName: "오전 2시", currTm: 25, perRain: 0, weather: .맑음),
               ], weekWeather: [
                WeekWeather.init(weekName: "오늘", name: Date.now.shortDate(), maxTm: 31, minTm: 25, perRain: 0, weather: .맑음),
                WeekWeather.init(weekName: Date.now.nextDay(1).koreanWeekday(), name: Date.now.nextDay(1).shortDate(), maxTm: 31, minTm: 25, perRain: 0, weather: .맑음),
                WeekWeather.init(weekName: Date.now.nextDay(2).koreanWeekday(), name: Date.now.nextDay(2).shortDate(), maxTm: 31, minTm: 24, perRain: 0, weather: .맑음),
                WeekWeather.init(weekName: Date.now.nextDay(3).koreanWeekday(), name: Date.now.nextDay(3).shortDate(), maxTm: 31, minTm: 25, perRain: 0, weather: .맑음),
                WeekWeather.init(weekName: Date.now.nextDay(4).koreanWeekday(), name: Date.now.nextDay(4).shortDate(), maxTm: 30, minTm: 25, perRain: 15, weather: .구름),
                WeekWeather.init(weekName: Date.now.nextDay(5).koreanWeekday(), name: Date.now.nextDay(5).shortDate(), maxTm: 30, minTm: 24, perRain: 10, weather: .맑음),
                WeekWeather.init(weekName: Date.now.nextDay(6).koreanWeekday(), name: Date.now.nextDay(6).shortDate(), maxTm: 29, minTm: 24, perRain: 0, weather: .맑음),
               ])),
    ]
}
