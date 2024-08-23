//
//  Date+.swift
//  WeSki
//
//  Created by kokojong on 8/20/24.
//

import Foundation

extension Date {
    func koreanWeekday() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR") // 한국어 로케일 설정
        formatter.dateFormat = "EEEE" // 요일을 풀 네임으로 출력
        
        return formatter.string(from: self)
    }
    
    func shortDate() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR") // 한국어 로케일 설정
        formatter.dateFormat = "M.dd" // 월.일 형식으로 출력
        
        return formatter.string(from: self)
    }
    
    func monthDay() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR") // 한국어 로케일 설정
        formatter.dateFormat = "MM.dd" // 월.일 형식으로 출력
        
        return formatter.string(from: self)
    }
    
    func nextDay(_ k: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: k, to: self)!
    }
}
