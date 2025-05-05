//
//  ViewThatFitsExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 25/06/2024.
//

import SwiftUI

struct ViewThatFitsExample: View {
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            ViewThatFits(in: .horizontal) {
                Text("This is some text that I would like to display to the user")
                Text("This is some text that I would like to display")
                Text("This is some text")
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 200)
        .font(.headline)
        .background(.yellow)
        .padding()
    }
}

// MARK: - Preview

#Preview {
    ViewThatFitsExample()
}
