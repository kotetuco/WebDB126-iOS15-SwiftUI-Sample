//
//  ContentView.swift
//  Searchable
//
//  Created by kotetu on 2021/10/14.
//

import SwiftUI

struct ContentView: View {
    @State private var query = ""

    private let characters = ["Alice",
                              "The White Rabbit",
                              "The Queen of Hearts",
                              "The King of Hearts",
                              "The Cheshire Cat"]

    private var filtered: [String] {
        guard !query.isEmpty else {
            return characters
        }
        return characters.filter {
            $0.localizedCaseInsensitiveContains(query)
        }
    }

    var body: some View {
        return NavigationView {
            VStack {
                List(filtered, id: \.self) {
                    Text($0)
                }
                .listStyle(.insetGrouped)
            }
            .searchable(text: $query)
            .navigationTitle("Characters")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
