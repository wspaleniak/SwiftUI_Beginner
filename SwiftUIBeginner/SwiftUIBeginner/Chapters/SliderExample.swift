//
//  SliderExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 28/02/2024.
//

import SwiftUI

struct SliderExample: View {
    
    // MARK: - Properties
    // Wartość slidera
    @State private var sliderValue: Double = 2
    
    // Kolor slidera
    @State private var sliderColor: Color = .black
    
    // MARK: - View
    var body: some View {
        VStack {
            // Slider zwykły
            // Slider(value: $sliderValue)
            
            // Slider z podanym zakresem
            // Slider(value: $sliderValue, in: 1...5)
            
            // Slider z podanym zakresem i skokiem
            // Slider(value: $sliderValue, in: 1...5, step: 1.0)
            
            // Slider z:
            // - podanym zakresem
            // - skokiem
            // - startowym i końcowym labelem
            // - akcją na moment gdy wartość jest zmieniana
            Slider(value: $sliderValue, in: 1...5, step: 1.0) {
                // Label...
            } minimumValueLabel: {
                Image(systemName: "person")
            } maximumValueLabel: {
                Image(systemName: "person.fill")
            } onEditingChanged: { isEditing in
                sliderColor = isEditing ? .blue : .black
            }
            .tint(sliderColor)
            
            // Sformatowany tekst z wartością slidera
            Text(String(format: "%.3f", sliderValue))
        }
        .padding()
    }
}

// MARK: - Preview
#Preview {
    SliderExample()
}
