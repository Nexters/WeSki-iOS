//
//  UserDefaultsManager.swift
//  WeSki
//
//  Created by kokojong on 8/24/24.
//

import Foundation

class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    
    private let lastUpdateDay = "lastUpdateDay" // 마지막으로
    private let updatedList = "updatedList" // 그 날짜에 업데이트 한
    
    private init() { }
    
    func fetchVote(key: Int) -> Bool { // true여야 정상. false시 이미 투표한거
        let lastDate = UserDefaults.standard.string(forKey: lastUpdateDay)
        
        let today = Date.now.monthDay()
        
        var keyList: [Int] = UserDefaults.standard.array(forKey: updatedList) as? [Int] ?? []
        
        if let lastDate {
            if today == lastDate {
                
                if keyList.contains(key) {
                    return false // 이미 투표를 해버림
                } else {
                    keyList.append(key)
                    UserDefaults.standard.setValue(keyList, forKey: updatedList) // keyList를 업데이트
                    return true
                }
                
            } else {
                
                UserDefaults.standard.setValue(Date.now.monthDay(), forKey: lastUpdateDay)
                
                UserDefaults.standard.setValue([key], forKey: updatedList) // 이 key만 가지고 있도록 초기화
                
                return true
            }
            
        } else { // 저장된 날짜 없음.
            UserDefaults.standard.setValue(Date.now.monthDay(), forKey: lastUpdateDay)
            
            UserDefaults.standard.setValue([key], forKey: updatedList) // 이 key만 가지고 있도록 초기화
            
            return true
        }
    }
}
