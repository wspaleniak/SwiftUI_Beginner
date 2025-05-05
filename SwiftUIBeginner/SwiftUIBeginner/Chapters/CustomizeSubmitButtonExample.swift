//
//  CustomizeSubmitButtonExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 02/06/2024.
//

import SwiftUI

struct CustomizeSubmitButtonExample: View {
    
    @State private var text: String = ""
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            TextField("Placeholder 1...", text: $text)
                .padding()
                .frame(height: 40)
                .background(Capsule().fill(.gray.opacity(0.1)))
                .padding()
                .submitLabel(.route)
                .onSubmit { print("Something 1 to the console...") }
            
            TextField("Placeholder 2...", text: $text)
                .padding()
                .frame(height: 40)
                .background(Capsule().fill(.gray.opacity(0.1)))
                .padding()
                .submitLabel(.send)
                .onSubmit { print("Something 2 to the console...") }
        }
    }
}

// MARK: - Preview

#Preview {
    CustomizeSubmitButtonExample()
}
