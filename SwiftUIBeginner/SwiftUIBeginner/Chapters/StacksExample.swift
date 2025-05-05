//
//  StacksExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 28/12/2023.
//

import SwiftUI

// VStack -> Vertical
// HStack -> Horizontal
// ZStack -> Z-Index

struct StacksExample: View {
    var body: some View {
        
        // Example 01
        // firstExample
        
        // Second example
        /// Dla prostych widoków warto używać `.background`.
        /// Dla bardziej skomplikowanych gdzie mamy dużo elementów to `ZStack`.
        VStack(alignment: .center) {
            Text("5")
                .font(.largeTitle)
                .bold()
            Text("Items in your cart:")
                .font(.headline)
        }
        .foregroundStyle(.white)
        .background(
            Circle()
                .fill(
                    LinearGradient(
                        colors: [.red, .purple, .blue],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: 180, height: 180)
                .shadow(color: .purple, radius: 10)
        )
    }
}

// MARK: - Extension
extension StacksExample {
    
    // Example 01
    private var firstExample: some View {
        ZStack(alignment: .top) {
            Rectangle()
                .fill(.yellow)
                .frame(width: 350, height: 500, alignment: .center)
            
            VStack(alignment: .leading, spacing: 40) {
                Rectangle()
                    .fill(.red)
                    .frame(width: 150, height: 150)
                
                Rectangle()
                    .fill(.green)
                    .frame(width: 100, height: 100)
                
                HStack(alignment: .bottom) {
                    Rectangle()
                        .fill(.purple)
                        .frame(width: 50, height: 50)
                    
                    Rectangle()
                        .fill(.pink)
                        .frame(width: 75, height: 75)
                    
                    Rectangle()
                        .fill(.blue)
                        .frame(width: 50, height: 50)
                }
                .background(.white)
            }
            .background(.black)
        }
    }
}

// MARK: - Preview
#Preview {
    StacksExample()
}
