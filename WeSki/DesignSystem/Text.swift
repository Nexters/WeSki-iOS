//
//  Text.swift
//  REGO
//
//  Created by 최모지 on 2/5/24.
//

import SwiftUI

struct H1Text: View {
    var text: String

    init(_ text: String) {
        self.text = text
    }

    var body: some View {
        Text(text).font(.h1)
    }
}

struct H2Text: View {
    var text: String

    init(_ text: String) {
        self.text = text
    }

    var body: some View {
        Text(text).font(.h2)
    }
}

struct H3Text: View {
    var text: String

    init(_ text: String) {
        self.text = text
    }

    var body: some View {
        Text(text).font(.h3)
    }
}

struct H4Text: View {
    var text: String

    init(_ text: String) {
        self.text = text
    }

    var body: some View {
        Text(text).font(.h4)
    }
}

struct Subtitle1Text: View {
    var text: String

    init(_ text: String) {
        self.text = text
    }

    var body: some View {
        Text(text).font(.subtitle1)
    }
}

struct Subtitle2Text: View {
    var text: String

    init(_ text: String) {
        self.text = text
    }

    var body: some View {
        Text(text).font(.subtitle2)
    }
}

struct Subtitle3Text: View {
    var text: String

    init(_ text: String) {
        self.text = text
    }

    var body: some View {
        Text(text).font(.subtitle3)
    }
}

struct Subtitle4Text: View {
    var text: String

    init(_ text: String) {
        self.text = text
    }

    var body: some View {
        Text(text).font(.subtitle4)
    }
}

struct Subtitle5Text: View {
    var text: String

    init(_ text: String) {
        self.text = text
    }

    var body: some View {
        Text(text).font(.subtitle5)
    }
}

struct ButtonText: View {
    var text: String

    init(_ text: String) {
        self.text = text
    }

    var body: some View {
        Text(text).font(.button)
    }
}

struct Body1Text: View {
    var text: String

    init(_ text: String) {
        self.text = text
    }

    var body: some View {
        Text(text).font(.body1)
    }
}

struct Body2Text: View {
    var text: String

    init(_ text: String) {
        self.text = text
    }

    var body: some View {
        Text(text).font(.body2)
    }
}

struct Body3Text: View {
    var text: String

    init(_ text: String) {
        self.text = text
    }

    var body: some View {
        Text(text).font(.body3)
    }
}

struct Body4Text: View {
    var text: String

    init(_ text: String) {
        self.text = text
    }

    var body: some View {
        Text(text).font(.body4)
    }
}

struct Body5Text: View {
    var text: String

    init(_ text: String) {
        self.text = text
    }

    var body: some View {
        Text(text).font(.body5)
    }
}

struct Body6Text: View {
    var text: String

    init(_ text: String) {
        self.text = text
    }

    var body: some View {
        Text(text).font(.body6)
    }
}

struct Body7Text: View {
    var text: String

    init(_ text: String) {
        self.text = text
    }

    var body: some View {
        Text(text).font(.body7)
    }
}

struct Body8Text: View {
    var text: String

    init(_ text: String) {
        self.text = text
    }

    var body: some View {
        Text(text).font(.body8)
    }
}

struct Body9Text: View {
    var text: String

    init(_ text: String) {
        self.text = text
    }

    var body: some View {
        Text(text).font(.body9)
    }
}

/// Custom Text 목록을 테스트 합니다.
struct TextSampleView: View {
    var body: some View {
        VStack(spacing: 10) {
            H1Text("H1 테스트")
            H2Text("H2 테스트")
            H3Text("H3 테스트")
            H4Text("H4 테스트")
            Subtitle1Text("Subtitle1 테스트")
            Subtitle2Text("Subtitle2 테스트")
            Subtitle3Text("Subtitle3 테스트")
            Subtitle4Text("Subtitle4 테스트")
            Subtitle5Text("Subtitle5 테스트")
            ButtonText("Button 테스트")
            Body1Text("Body1 테스트")
            Body2Text("Body2 테스트")
            Body3Text("Body3 테스트")
            Body4Text("Body4 테스트")
            Body5Text("Body5 테스트")
            Body6Text("Body6 테스트")
            Body7Text("Body7 테스트")
            Body8Text("Body7 테스트")
            Body9Text("Body7 테스트")
        }
    }
}

#Preview {
    TextSampleView()
}
