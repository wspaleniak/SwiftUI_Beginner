//
//  SafeAreaInsetsExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 23/06/2024.
//

import SwiftUI

struct SafeAreaInsetsExample: View {
    
    // MARK: - Body
    
    var body: some View {
        NavigationStack {
            List(0..<20) { _ in
                Rectangle()
                    .fill(.gray.opacity(0.3))
                    .frame(height: 100)
            }
            .navigationTitle("Safe Area Insets")
            .safeAreaInset(
                edge: .top,
                alignment: .center,
                spacing: 0
            ) {
                HStack {
                    Image(systemName: "globe")
                    Text("Globe")
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(.blue.opacity(0.5), ignoresSafeAreaEdges: .bottom)
            }
            .safeAreaInset(
                edge: .bottom,
                alignment: .leading,
                spacing: 0
            ) {
                HStack {
                    Image(systemName: "gear")
                    Text("Settings")
                }
                .padding()
                .background(.blue.opacity(0.5))
            }
        }
    }
}

// MARK: - Preview

#Preview {
    SafeAreaInsetsExample()
}
