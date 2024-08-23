//
//  Image+.swift
//  WeSki
//
//  Created by kokojong on 8/17/24.
//

import SwiftUI

enum WeatherImage: CaseIterable {
    case weather1, weather2, weather3, weather4
}

extension WeatherImage {
    var image: Image {
        switch self {
        case .weather1:
            Image(.iconWeather1)
        case .weather2:
            Image(.iconWeather2)
        case .weather3:
            Image(.iconWeather3)
        case .weather4:
            Image(.iconWeather4)
        }
    }
    
    static func random() -> Image {
        return self.allCases.randomElement()!.image
    }
}
