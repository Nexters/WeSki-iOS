//
//  Color+.swift
//  WeSki
//
//  Created by kokojong on 8/6/24.
//

import SwiftUI
import UIKit

extension Color {
    static let main01 = Color(uiColor: .main01)
    static let main02 = Color(uiColor: .main02)
    static let main03 = Color(uiColor: .main03)
    static let main04 = Color(uiColor: .main04)
    static let main05 = Color(uiColor: .main05)
    static let main06 = Color(uiColor: .main06)
    
    static let gray100 = Color(uiColor: .gray100)
    static let gray90 = Color(uiColor: .gray90)
    static let gray80 = Color(uiColor: .gray80)
    static let gray70 = Color(uiColor: .gray70)
    static let gray60 = Color(uiColor: .gray60)
    static let gray50 = Color(uiColor: .gray50)
    static let gray40 = Color(uiColor: .gray40)
    static let gray30 = Color(uiColor: .gray30)
    static let gray20 = Color(uiColor: .gray20)
    static let gray10 = Color(uiColor: .gray10)
    
    static let sub01 = Color(uiColor: .sub01)
    static let sub02 = Color(uiColor: .sub02)
    static let sub04 = Color(uiColor: .sub04)
    static let sub05 = Color(uiColor: .sub05)
}

extension UIColor {
    var rgba: Int {
        get {
            var red: CGFloat = 0.0, green: CGFloat = 0.0, blue: CGFloat = 0.0, alpha: CGFloat = 0.0
            self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)

            return Int(red * 255.0) << 24 | Int(green * 255.0) << 16 | Int(blue * 255.0) << 8 | Int(alpha * 255.0)
        }
    }

    var alpha: CGFloat {
        get {
            return CGFloat(self.rgba & 0xFF) / 255.0
        }
    }

    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        let red = (CGFloat((hex & 0xff0000) >> 16) / 255.0)
        let green = (CGFloat((hex & 0x00ff00) >> 8) / 255.0)
        let blue = (CGFloat(hex & 0x0000ff) / 255.0)
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}

extension UIColor {
    static let main01 = UIColor(hex: 0x7280FF)
    static let main02 = UIColor(hex: 0xA2B6FF)
    static let main03 = UIColor(hex: 0xBDD1FB)
    static let main04 = UIColor(hex: 0xD0DFFF)
    static let main05 = UIColor(hex: 0xEDF3FF)
    static let main06 = UIColor(hex: 0xCCCCCC)
    
    static let gray100 = UIColor(hex: 0x070707)
    static let gray90 = UIColor(hex: 0x171D23)
    static let gray80 = UIColor(hex: 0x222931)
    static let gray70 = UIColor(hex: 0x303A45)
    static let gray60 = UIColor(hex: 0x515E6F)
    static let gray50 = UIColor(hex: 0x878E9B)
    static let gray40 = UIColor(hex: 0xC6C8CE)
    static let gray30 = UIColor(hex: 0xEAEBEE)
    static let gray20 = UIColor(hex: 0xF7F8F9)
    static let gray10 = UIColor(hex: 0xFFFFFF)
        
    static let sub01 = UIColor(hex: 0xFFDE6B)
    static let sub02 = UIColor(hex: 0xFF9928)
    static let sub04 = UIColor(hex: 0x447EFF)
    static let sub05 = UIColor(hex: 0x4D44FF)
}
