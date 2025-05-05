//
//  ToggleExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 14/02/2024.
//

import SwiftUI

struct ToggleExample: View {
    
    @State private var isOn: Bool = true
    
    var body: some View {
        VStack {
            // Toggle as SWITCH
            Toggle(isOn: $isOn) {
                Label("Włącz wyróżnienie", systemImage: "star.fill")
                    .font(.headline)
                    .foregroundStyle(.red)
            }
            .tint(.red)
            .toggleStyle(.switch)
            
            // Toggle as BUTTON
            Toggle(isOn: $isOn) {
                Label("Włącz wyróżnienie", systemImage: "star.fill")
                    .font(.headline)
                    .foregroundStyle(.red)
            }
            .tint(.red)
            .toggleStyle(.button)
        }
        .padding()
    }
}

// MARK: - Preview
#Preview {
    ToggleExample()
}
