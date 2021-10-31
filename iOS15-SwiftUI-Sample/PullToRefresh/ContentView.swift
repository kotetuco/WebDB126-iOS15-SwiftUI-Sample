//
//  ContentView.swift
//  PullToRefresh
//
//  Created by kotetu on 2021/10/14.
//

import SwiftUI

/// サンプルで使用する仮想的なAPIレスポンス(JSON)
///
/// ※次のようなJSONが返ることを想定しています。
///
/// [
///   {"name": "Alice"},
///   {"name": "The White Rabbit"},
///   {"name": "The Queen of Hearts"},
///   {"name": "The King of Hearts"},
///   {"name": "The Cheshire Cat"}
/// ]
/// 
/// - Parameters:
///   - name: 名前
///
struct Character: Decodable, Hashable {
    let name: String
}

struct ContentView: View {
    @State private var characters: [Character] = []

    var body: some View {
        NavigationView {
            VStack {
                List(characters, id: \.self) {
                    Text($0.name)
                }
                .listStyle(.insetGrouped)
            }
            .refreshable {
                characters = await load()
            }
            .task {
                characters = await load()
            }
            .navigationTitle("Characters")
        }
    }

    private func load() async -> [Character] {
        // 注意) 下記URLはダミーのURLです。実際にWeb APIから値を取得したい場合は、
        //      有効なURLを別途用意して下記を書き換えた上で実行してください。
        let urtString = "https://example.com/sample.json"
        guard let url = URL(string: urtString) else {
            return []
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return try JSONDecoder().decode([Character].self, from: data)
        } catch {
            return []
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
