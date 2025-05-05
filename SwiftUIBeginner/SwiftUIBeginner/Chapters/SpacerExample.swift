//
//  SpacerExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 01/01/2024.
//

import SwiftUI

struct SpacerExample: View {
    var body: some View {
        
        // Example 1
        // firstExample
        
        // Example 2
        VStack {
            HStack {
                Image(systemName: "xmark")
                Spacer()
                    .frame(height: 10)
                    .background(.orange)
                Image(systemName: "gear")
            }
            .font(.title)
            .padding(.horizontal)
            .background(.yellow)
            
            Spacer()
                .frame(width: 10)
                .background(.orange)
            
            Rectangle()
                .fill(.blue)
                .frame(height: 100)
        }
    }
}

// MARK: - Extension
extension SpacerExample {
    
    // Example 1
    private var firstExample: some View {
        HStack(spacing: .zero) {
            Spacer()
                .frame(height: 20)
                .background(.yellow)
            
            Rectangle()
                .fill(.red)
                .frame(width: 50, height: 50)
            
            Spacer()
                .frame(height: 20)
                .background(.yellow)
            
            Rectangle()
                .fill(.purple)
                .frame(width: 50, height: 50)
            
            Spacer()
                .frame(height: 20)
                .background(.yellow)
            
            Rectangle()
                .fill(.blue)
                .frame(width: 50, height: 50)
            
            Spacer()
                .frame(height: 20)
                .background(.yellow)
        }
    }
}

// MARK: - Preview
#Preview {
    SpacerExample()
}
