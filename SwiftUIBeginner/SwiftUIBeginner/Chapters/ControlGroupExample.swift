//
//  ControlGroupExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 29/06/2024.
//

import SwiftUI

struct ControlGroupExample: View {
    
    // MARK: - Body
    
    var body: some View {
        Menu("Menu") {
            ControlGroup("Other") {
                Menu("Option 3") {
                    Button("Banana") { }
                    Button("Orange") { }
                }
                Button("Option 4") { }
            }
            
            Button("Option 2") { }
            
            Menu("Option 1") {
                Button("Hello") { }
                Button("Bye") { }
            }
        }
    }
}

// MARK: - Preview

#Preview {
    ControlGroupExample()
}
