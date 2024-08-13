//
//  Text.swift
//  REGO
//
//  Created by 최모지 on 2/5/24.
//

import SwiftUI

struct H1Text: View {
    var text: String
    var weight: UIFont.Weight
    
    init(_ text: String, weight: UIFont.Weight) {
        self.text = text
        self.weight = weight
    }
    
    init(_ text: String) {
        self.text = text
        self.weight = .regular
    }

    var body: some View {
        Text(text).font(WeSkiFontStyle.h1(weight).font)
    }
}

struct H2Text: View {
    var text: String
    var weight: UIFont.Weight
    
    init(_ text: String, weight: UIFont.Weight) {
        self.text = text
        self.weight = weight
    }
    
    init(_ text: String) {
        self.text = text
        self.weight = .regular
    }

    var body: some View {
        Text(text).font(WeSkiFontStyle.h2(weight).font)
    }
}

struct H3Text: View {
    var text: String
    var weight: UIFont.Weight
    
    init(_ text: String, weight: UIFont.Weight) {
        self.text = text
        self.weight = weight
    }
    
    init(_ text: String) {
        self.text = text
        self.weight = .regular
    }

    var body: some View {
        Text(text).font(WeSkiFontStyle.h3(weight).font)
    }
}

struct Title1Text: View {
    var text: String
    var weight: UIFont.Weight
    
    init(_ text: String, weight: UIFont.Weight) {
        self.text = text
        self.weight = weight
    }
    
    init(_ text: String) {
        self.text = text
        self.weight = .regular
    }

    var body: some View {
        Text(text).font(WeSkiFontStyle.title1(weight).font)
    }
}

struct Title2Text: View {
    var text: String
    var weight: UIFont.Weight
    
    init(_ text: String, weight: UIFont.Weight) {
        self.text = text
        self.weight = weight
    }
    
    init(_ text: String) {
        self.text = text
        self.weight = .regular
    }

    var body: some View {
        Text(text).font(WeSkiFontStyle.title2(weight).font)
    }
}

struct Title3Text: View {
    var text: String
    var weight: UIFont.Weight
    
    init(_ text: String, weight: UIFont.Weight) {
        self.text = text
        self.weight = weight
    }
    
    init(_ text: String) {
        self.text = text
        self.weight = .regular
    }

    var body: some View {
        Text(text).font(WeSkiFontStyle.title3(weight).font)
    }
}

struct Body1Text: View {
    var text: String
    var weight: UIFont.Weight
    
    init(_ text: String, weight: UIFont.Weight) {
        self.text = text
        self.weight = weight
    }
    
    init(_ text: String) {
        self.text = text
        self.weight = .regular
    }

    var body: some View {
        Text(text).font(WeSkiFontStyle.body1(weight).font)
    }
}

struct Body2Text: View {
    var text: String
    var weight: UIFont.Weight
    
    init(_ text: String, weight: UIFont.Weight) {
        self.text = text
        self.weight = weight
    }
    
    init(_ text: String) {
        self.text = text
        self.weight = .regular
    }

    var body: some View {
        Text(text).font(WeSkiFontStyle.body2(weight).font)
    }
}

struct Body3Text: View {
    var text: String
    var weight: UIFont.Weight
    
    init(_ text: String, weight: UIFont.Weight) {
        self.text = text
        self.weight = weight
    }
    
    init(_ text: String) {
        self.text = text
        self.weight = .regular
    }

    var body: some View {
        Text(text).font(WeSkiFontStyle.body3(weight).font)
    }
}
