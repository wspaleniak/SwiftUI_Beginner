//
//  MenuExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 23/06/2024.
//

import SwiftUI

struct MenuExample: View {
    
    // MARK: - Properties
    
    @State private var background: Color = .blue
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            Menu("Change color!") {
                Button("Blue") { background = .blue }
                Button("Green") { background = .green }
                Button("Indigo") { background = .indigo }
            }
            .foregroundStyle(.white)
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(background)
    }
}

// MARK: - Preview

#Preview {
    MenuExample()
}
