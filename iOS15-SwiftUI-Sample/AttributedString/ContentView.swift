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
        attributedString.font
            = .boldSystemFont(ofSize: 21)
        attributedString.foregroundColor = .white
        attributedString.backgroundColor = .black

        let range = attributedString.range(of: "an example")!
        attributedString[range].foregroundColor = .orange

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
