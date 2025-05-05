//
//  ScrollViewExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 03/01/2024.
//

import SwiftUI

struct ScrollViewExample: View {
    var body: some View {
        
        // Example 01
        // firstExample
        
        // Example 02
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(0..<10) { rowIndex in
                    Text("Row: \(rowIndex)")
                        .font(.headline)
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(0..<5) { elementIndex in
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.blue)
                                    .frame(width: 200, height: 100)
                                    .overlay {
                                        Text("\(elementIndex)")
                                            .font(.headline)
                                    }
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                }
            }
        }
        .padding([.leading, .top])
    }
}

// MARK: - Extension
extension ScrollViewExample {
    
    // Example 01
    private var firstExample: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(0..<10) { index in
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.green)
                        .frame(width: 100, height: 100)
                        .overlay {
                            Text("\(index)")
                                .font(.headline)
                        }
                }
            }
        }
        .scrollIndicators(.hidden)
        .padding(.horizontal)
    }
}

// MARK: - Preview
#Preview {
    ScrollViewExample()
}
