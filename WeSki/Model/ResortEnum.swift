//
//  ResortEnum.swift
//  WeSki
//
//  Created by kokojong on 8/18/24.
//

import Foundation

enum ResortEnum: Int, CaseIterable, Codable {
    case 지산 = 1
    case 곤지암 = 2
    case 비발디 = 3
    case 엘리시안강촌 = 4
    case 웰리힐리 = 5
    case 휘닉스 = 6
    case 하이원 = 7
    case 용평 = 8
    case 무주 = 9
    case 에덴벨리 = 10
    
    var engName: String {
        switch self {
        case .지산:
            "jisan"
        case .하이원:
            "high1"
        case .곤지암:
            "gonjiam"
        case .비발디:
            "vivaldipark"
        case .엘리시안강촌:
            "elysian-gangchon"
        case .용평:
            "yongpyong"
        case .에덴벨리:
            "eden"
        case .웰리힐리:
            "wellihilli"
        case .무주:
            "muju"
        case .휘닉스:
            "phoenix"
        }
    }
    
    var koreanName: String {
        switch self {
        case .지산:
            "지산 포레스트 리조트"
        case .하이원:
            "하이원 리조트"
        case .곤지암:
            "곤지암리조트"
        case .비발디:
            "비발디파크"
        case .엘리시안강촌:
            "엘리시안 강촌"
        case .용평:
            "용평 모나 파크"
        case .에덴벨리:
            "에덴벨리 리조트"
        case .웰리힐리:
            "웰리힐리파크"
        case .무주:
            "무주 덕유산 리조트"
        case .휘닉스:
            "휘닉스파크"
        }
    }
}

extension ResortEnum {
    func toWebcamURL() -> URL {
        return URL(string: Network.webBaseURL + "webcam/" + self.engName)!
    }
    
    func toSlopeURL() -> URL {
        return URL(string: Network.webBaseURL + "slop-status/" + self.engName)!
    }
    
    func toShareURL() -> URL {
        return URL(string: Network.shareURL + "\(self.rawValue)")!
    }
}
