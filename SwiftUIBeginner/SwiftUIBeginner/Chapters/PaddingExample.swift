//
//  PaddingExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 01/01/2024.
//

import SwiftUI

struct PaddingExample: View {
    var body: some View {
        
        // Example 01
        // firstExample
        
        // Example 02
        // secondExample
        
        // Example 03
        VStack(alignment: .leading) {
            Text("Hello, World!")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.bottom, 10)
            
            Text("This is the description of what we will do on this screen. It is multiple lines and we will align the text to the leading edge.")
        }
        .background(.yellow)
        .padding()
        .padding(.vertical, 30)
        .background(.blue)
        .padding(.horizontal, 20)
        .background(.green)
    }
}

// MARK: - Extension
extension PaddingExample {
    
    // Example 01
    private var firstExample: some View {
        Text("Hello, World!")
            .background(.yellow)
//            .padding()
//            .padding(.all, 10) // to samo co powyżej
            .padding(.all, 20)
            .background(.green)
            .padding(.leading, 20)
            .background(.blue)
    }
    
    // Example 02
    private var secondExample: some View {
        Text("Hello, World!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.red)
            .padding(.leading, 20)
    }
}

// MARK: - Preview
#Preview {
    PaddingExample()
}
