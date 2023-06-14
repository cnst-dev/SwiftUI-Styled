//
//  ContentView.swift
//  SwiftUI-Styled
//
//  Created by const on 14.06.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            StyledButton(title: "Done",
                         leftIcon: .symbolName(.checkmark))
            StyledButton(title: "Cancel",
                         rightIcon: .symbolName(.xmark)) {
                debugPrint("Cancel pressed")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
