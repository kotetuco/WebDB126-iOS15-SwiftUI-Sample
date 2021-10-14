//
//  ContentView.swift
//  Runs
//
//  Created by kotetu on 2021/10/14.
//

import SwiftUI

struct ContentView: View {
    private var attributedString: AttributedString {
        let text = "Let’s look at an example."

        var attributedString = AttributedString(text)
        attributedString.font = .largeTitle.bold()

        let range = attributedString.range(of: "an example")!
        attributedString[range].font = .largeTitle.italic()
        attributedString[range].underlineStyle = .single
        attributedString[range].link
            = URL(string: "https://example.com")

        let runs = attributedString.runs

        print(runs.count) // 3が出力される

        for (value, range) in runs[\.link] {
            if value != nil {
                attributedString[range].foregroundColor
                    = .orange
            }
        }

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
