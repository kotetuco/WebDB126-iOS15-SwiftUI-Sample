//
//  ContentView.swift
//  DynamicTypeSize
//
//  Created by kotetu on 2021/10/14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()

            // dynamicTypeSizeが適用されたText
            Text("**.largeTitle** *text* style")
                .font(.largeTitle)
                .dynamicTypeSize(.small ... .xxLarge)
                .padding()

            // dynamicTypeSizeが適用されてないText
            Text("**.largeTitle** *text* style")
                .font(.largeTitle)
                .padding()

            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
