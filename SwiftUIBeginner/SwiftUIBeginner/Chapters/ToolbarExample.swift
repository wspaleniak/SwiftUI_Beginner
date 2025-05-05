//
//  ToolbarExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 19/06/2024.
//

import SwiftUI

struct ToolbarExample: View {
    
    // MARK: - Body
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    ForEach(0..<100) { _ in
                        Text("Hello")
                            .frame(maxWidth: .infinity)
                    }
                }
            }
            .navigationTitle("Toolbar")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: "heart")
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "xmark")
                }
                // ToolbarItem(placement: .principal) {
                //     HStack {
                //         Image(systemName: "house")
                //         Image(systemName: "house.fill")
                //     }
                // }
                ToolbarItem(placement: .bottomBar) {
                    Image(systemName: "globe")
                }
                ToolbarItem(placement: .bottomBar) {
                    Text("Go to the view")
                }
            }
            // .toolbar(.hidden, for: .navigationBar)
            // .toolbar(.hidden, for: .bottomBar)
            // .toolbarBackground(.hidden, for: .navigationBar)
            // .toolbarBackground(.hidden, for: .bottomBar)
            // .toolbarColorScheme(.dark, for: .navigationBar)
            // .toolbarColorScheme(.dark, for: .bottomBar)
            .toolbarTitleMenu {
                Button("Option 1") { }
                Button("Option 2") { }
                Button("Option 3") { }
            }
        }
    }
}

// MARK: - Preview

#Preview {
    ToolbarExample()
}
