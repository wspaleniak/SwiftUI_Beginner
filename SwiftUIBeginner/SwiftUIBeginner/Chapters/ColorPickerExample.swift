//
//  ColorPickerExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 18/02/2024.
//

import SwiftUI

struct ColorPickerExample: View {
    
    // MARK: - Properties
    @State private var selectedColor: Color = .yellow
    
    // MARK: - View
    var body: some View {
        NavigationStack {
            List {
                ColorPicker(
                    "Select background color",
                    selection: $selectedColor,
                    supportsOpacity: true
                )
                .font(.headline)
            }
            .scrollContentBackground(.hidden)
            .background(selectedColor)
            .navigationTitle("ColorPicker")
        }
    }
}

// MARK: - Preview
#Preview {
    ColorPickerExample()
}
