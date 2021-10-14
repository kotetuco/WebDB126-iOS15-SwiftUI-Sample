//
//  ContentView.swift
//  FocusState
//
//  Created by kotetu on 2021/10/14.
//

import SwiftUI

struct ContentView: View {
    @State private var name = "Musical"
    @State private var location = "New York City"

    @FocusState private var focusedField: Field?

    private enum Field: Int, Hashable, CaseIterable {
        case name, location
    }

    var body: some View {
        Form {
            TextField("Name",text: $name)
                .focused($focusedField, equals: .name)
            TextField("Location", text: $location)
                .focused($focusedField, equals: .location)
        }

        HStack {
            Button {
                focusedField = .name
            } label: {
                Text("Focus on name")
            }
            .buttonStyle(.bordered)
            .padding()

            Button {
                focusedField = nil
            } label: {
                Text("Out of focus")
            }
            .buttonStyle(.bordered)
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
