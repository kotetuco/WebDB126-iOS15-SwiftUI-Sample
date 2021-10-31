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

        // 文字列全体に適用
        attributedString.font = .largeTitle.bold()

        // 「an example」にのみ適用
        let range = attributedString.range(of: "an example")!
        attributedString[range].font = .largeTitle.italic()
        attributedString[range].underlineStyle = .single
        attributedString[range].link = URL(string: "https://example.com")

        // 3が出力される
        print(attributedString.runs.count)

        // Let’sの文字色を変更する
        let rangeOfLets = attributedString.range(of: "Let’s")!
        attributedString[rangeOfLets].foregroundColor = .blue

        // 4が出力される
        print(attributedString.runs.count)

        // 全てのrunを取得
        let runs = attributedString.runs

        // (LinkAttribute, Range)の配列を取得
        let links = runs[\.link].filter { $0.0 != nil }

        // リンクの文字色を変更する
        for range in links.map(\.1) {
            attributedString[range].foregroundColor = .orange
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
