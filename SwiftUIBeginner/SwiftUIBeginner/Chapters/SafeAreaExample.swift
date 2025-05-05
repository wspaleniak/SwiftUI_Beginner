//
//  SafeAreaExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 05/01/2024.
//

import SwiftUI

struct SafeAreaExample: View {
    var body: some View {
        
        // Example 01
        // firstExample
        
        // Example 02
        ScrollView {
            VStack {
                Text("Title goes here")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                ForEach(0..<10) { _ in
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(.white)
                        .frame(height: 150)
                        .shadow(radius: 10)
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                }
            }
        }
        .background(.gray)
    }
}

// MARK: - Extension
extension SafeAreaExample {
    
    // Example 01
    private var firstExample: some View {
        Text("Hello, World!")
            .font(.headline)
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .bottom
            )
            .background(
                .yellow,
                ignoresSafeAreaEdges: .all
            )
            .ignoresSafeArea(edges: .bottom)
    }
}

// MARK: - Preview
#Preview {
    SafeAreaExample()
}
