//
//  DarkModeExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 01/04/2024.
//

import SwiftUI

struct DarkModeExample: View {
    
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    Text("PRIMARY")
                        .foregroundStyle(.primary)
                    Text("SECONDARY")
                        .foregroundStyle(.secondary)
                    Text("BLACK")
                        .foregroundStyle(.black)
                    Text("WHITE")
                        .foregroundStyle(.white)
                    Text("RED")
                        .foregroundStyle(.red)
                    Text("GLOBALLY ADAPTIVE")
//                        .foregroundStyle(Color("BluePink"))
                        .foregroundStyle(.bluePink)
                    Text("LOCALLY ADAPTIVE")
                        .foregroundStyle(colorScheme == .light ? .green : .yellow)
                }
                .font(.headline)
            }
            .navigationTitle("Dark Mode")
        }
    }
}

// MARK: - Previews
#Preview("Light mode") {
    DarkModeExample()
        .preferredColorScheme(.light)
}

#Preview("Dark mode") {
    DarkModeExample()
        .preferredColorScheme(.dark)
}
