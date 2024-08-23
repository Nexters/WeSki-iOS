//
//  Font+.swift
//  WeSki
//
//  Created by kokojong on 8/6/24.
//

import SwiftUI
import UIKit

public typealias WeSkiSystemFont = WeSkiFontPresentation

public protocol WeSkiFontPresentation {
    var font: Font { get }
}

enum WeSkiFontStyle: WeSkiSystemFont {
    case h1(UIFont.Weight), h15(UIFont.Weight), h2(UIFont.Weight), h3(UIFont.Weight)
    case title1(UIFont.Weight), title2(UIFont.Weight), title3(UIFont.Weight)
    case body1(UIFont.Weight), body2(UIFont.Weight), body3(UIFont.Weight)
}

extension WeSkiFontStyle {
    var uiFont: UIFont {
        switch self {
        case .h1(let weight):
            return .systemFont(ofSize: 32, weight: weight)
        case .h15(let weight):
            return .systemFont(ofSize: 30, weight: weight)
        case .h2(let weight):
            return .systemFont(ofSize: 24, weight: weight)
        case .h3(let weight):
            return .systemFont(ofSize: 22, weight: weight)
        case .title1(let weight):
            return .systemFont(ofSize: 20, weight: weight)
        case .title2(let weight):
            return .systemFont(ofSize: 18, weight: weight)
        case .title3(let weight):
            return .systemFont(ofSize: 16, weight: weight)
        case .body1(let weight):
            return .systemFont(ofSize: 14, weight: weight)
        case .body2(let weight):
            return .systemFont(ofSize: 13, weight: weight)
        case .body3(let weight):
            return .systemFont(ofSize: 12, weight: weight)
        }
    }
    
    var font: Font {
        return Font(uiFont)
    }
}
