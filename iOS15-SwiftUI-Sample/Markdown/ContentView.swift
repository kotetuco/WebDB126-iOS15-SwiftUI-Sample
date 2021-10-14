//
//  ContentView.swift
//  Markdown
//
//  Created by kotetu on 2021/10/14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("**Let’s look at** ~an example~.")
            .font(.largeTitle)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
