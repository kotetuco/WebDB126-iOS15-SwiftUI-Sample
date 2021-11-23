//
//  ContentView.swift
//  AttributedString
//
//  Created by kotetu on 2021/10/14.
//

import SwiftUI

struct ContentView: View {
    private var attributedString: AttributedString {
        let text = "Let’s look at an example."
        var attributedString = AttributedString(text)

        // 文字列全体に適用
        attributedString.font = .largeTitle.bold()

        // 「an example」にのみ適用
        let range = attributedString.range(of: "an example")!
        attributedString[range].font = .largeTitle.italic()
        attributedString[range].underlineStyle = .single
        attributedString[range].link = URL(string: "https://example.com")

        return attributedString
    }

    var body: some View {
        Text(attributedString)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
