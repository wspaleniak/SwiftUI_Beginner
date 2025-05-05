//
//  TextSelectionExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 09/05/2024.
//

import SwiftUI

// MARK: - View

struct TextSelectionExample: View {
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 50) {
            Text("Hello - copy disabled")
                .textSelection(.disabled)
            
            Text("Hello - copy enabled")
                .textSelection(.enabled)
        }
    }
}

// MARK: - Preview

#Preview {
    TextSelectionExample()
}
