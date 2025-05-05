//
//  GroupExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 23/06/2024.
//

import SwiftUI

struct GroupExample: View {
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            Text("Hello, World!")
            Group {
                Text("Hello, World!")
                Text("Hello, World!")
            }
            .foregroundStyle(.blue)
            .font(.headline)
        }
        .foregroundStyle(.red)
        .font(.title)
    }
}

// MARK: - Preview

#Preview {
    GroupExample()
}
