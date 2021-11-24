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

    @FocusState private var focus: Field?

    private enum Field: Int, Hashable, CaseIterable {
        case name, location
    }

    var body: some View {
        Form {
            Section {
                TextField("Name",text: $name)
                    .focused($focus, equals: .name)
                TextField("Location", text: $location)
                    .focused($focus, equals: .location)
            } footer: {
                HStack {
                    Spacer()

                    Button {
                        focus = .name
                    } label: {
                        Text("Focus on name")
                    }
                    .buttonStyle(.bordered)
                    .padding()

                    Button {
                        focus = nil
                    } label: {
                        Text("Out of focus")
                    }
                    .buttonStyle(.bordered)
                    .padding()

                    Spacer()
                }
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
