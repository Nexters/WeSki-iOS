//
//  Fonts.swift
//  REGO
//
//  Created by 최모지 on 1/28/24.
//

import UIKit
import SwiftUI

extension Font {
    static let h1 = RegoFontStyle.h1.font
    static let h2 = RegoFontStyle.h2.font
    static let h3 = RegoFontStyle.h3.font
    static let h4 = RegoFontStyle.h4.font

    static let subtitle1 = RegoFontStyle.subtitle1.font
    static let subtitle2 = RegoFontStyle.subtitle2.font
    static let subtitle3 = RegoFontStyle.subtitle3.font
    static let subtitle4 = RegoFontStyle.subtitle4.font
    static let subtitle5 = RegoFontStyle.subtitle5.font

    static let button = RegoFontStyle.button.font

    static let body1 = RegoFontStyle.body1.font
    static let body2 = RegoFontStyle.body2.font
    static let body3 = RegoFontStyle.body3.font
    static let body4 = RegoFontStyle.body4.font
    static let body5 = RegoFontStyle.body5.font
    static let body6 = RegoFontStyle.body6.font
    static let body7 = RegoFontStyle.body7.font
    static let body8 = RegoFontStyle.body8.font
    static let body9 = RegoFontStyle.body9.font
}

public typealias RegoSystemFont = RegoFontPresentation & CaseIterable

public protocol RegoFontPresentation {
    var font: Font { get }
}

enum RegoFontStyle: RegoSystemFont {
    case h1, h2, h3, h4
    case subtitle1, subtitle2, subtitle3, subtitle4, subtitle5
    case button
    case body1, body2, body3, body4, body5, body6, body7, body8, body9
}

extension RegoFontStyle {
    var uiFont: UIFont {
        switch self {
        case .h1:
            return .systemFont(ofSize: 26, weight: .semibold)
        case .h2:
            return .systemFont(ofSize: 24, weight: .semibold)
        case .h3:
            return .systemFont(ofSize: 20, weight: .semibold)
        case .h4:
            return .systemFont(ofSize: 18, weight: .bold)
        case .subtitle1:
            return .systemFont(ofSize: 18, weight: .semibold)
        case .subtitle2:
            return .systemFont(ofSize: 17, weight: .semibold)
        case .subtitle3:
            return .systemFont(ofSize: 17, weight: .semibold)
        case .subtitle4:
            return .systemFont(ofSize: 16, weight: .medium)
        case .subtitle5:
            return .systemFont(ofSize: 15, weight: .semibold)
        case .button:
            return .systemFont(ofSize: 16, weight: .medium)
        case .body1:
            return .systemFont(ofSize: 15, weight: .regular)
        case .body2:
            return .systemFont(ofSize: 14, weight: .bold)
        case .body3:
            return .systemFont(ofSize: 14, weight: .medium)
        case .body4:
            return .systemFont(ofSize: 14, weight: .regular)
        case .body5:
            return .systemFont(ofSize: 14, weight: .regular)
        case .body6:
            return .systemFont(ofSize: 12, weight: .regular)
        case .body7:
            return .systemFont(ofSize: 10, weight: .regular)
        case .body8:
            return .systemFont(ofSize: 9, weight: .regular)
        case .body9:
            return .systemFont(ofSize: 10, weight: .medium)
        }
    }

    var font: Font {
        return Font(uiFont)
    }
}
