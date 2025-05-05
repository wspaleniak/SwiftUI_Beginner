//
//  ButtonStylesExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 09/05/2024.
//

import SwiftUI

// MARK: - View

struct ButtonStylesExample: View {
    
    // MARK: - Body
    
    var body: some View {
        
        // MARK: - STYLES
        
        VStack {
            Text("STYLES:")
                .font(.title3)
                .underline()
            
            // AUTOMATIC
            // Button("Button Title", action: {})
            //     .buttonStyle(.automatic)
            
            // PLAIN
            Button("Button Title", action: {})
                .buttonStyle(.plain)
            
            // BORDERED
            Button("Button Title", action: {})
                .buttonStyle(.bordered)
            
            // BORDERED PROMINENT
            Button("Button Title", action: {})
                .buttonStyle(.borderedProminent)
            
            // BORDERLESS
            Button("Button Title", action: {})
                .buttonStyle(.borderless)
        }
        
        // MARK: - SIZES
        
        VStack {
            Text("SIZES:")
                .font(.title3)
                .underline()
            
            // EXTRA LARGE
            Button("Button Title", action: {})
                .controlSize(.extraLarge)
                .buttonStyle(.borderedProminent)
            
            // LARGE
            Button("Button Title", action: {})
                .controlSize(.large)
                .buttonStyle(.borderedProminent)
            
            // REGULAR
            Button("Button Title", action: {})
                .controlSize(.regular)
                .buttonStyle(.borderedProminent)
            
            // SMALL
            Button("Button Title", action: {})
                .controlSize(.small)
                .buttonStyle(.borderedProminent)
            
            // MINI
            // Button("Button Title", action: {})
            //     .controlSize(.mini)
            //     .buttonStyle(.borderedProminent)
            
            // EXTRA LARGE + CUSTOM SIZE
            Button(
                action: {},
                label: {
                    Text("Button Title")
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                }
            )
            .controlSize(.extraLarge)
            .buttonStyle(.borderedProminent)
            .tint(.pink)
            .foregroundStyle(.black)
            .padding(.horizontal)
        }
        .padding(.top, 10)
        
        // MARK: - BORDERED
        
        VStack {
            Text("BORDERED:")
                .font(.title3)
                .underline()
            
            // AUTOMATIC
            // Button("Button Title", action: {})
            //     .controlSize(.regular)
            //     .buttonStyle(.borderedProminent)
            //     .buttonBorderShape(.automatic)
            
            // CAPSULE
            Button("Button Title", action: {})
                .controlSize(.regular)
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
            
            // CIRCLE
            Button("XY", action: {})
                .controlSize(.regular)
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.circle)
            
            // ROUNDED RECTANGLE
            Button("Button Title", action: {})
                .controlSize(.regular)
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.roundedRectangle)
            
            // ROUNDED RECTANGLE + RADIUS
            Button("Button Title", action: {})
                .controlSize(.regular)
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.roundedRectangle(radius: 12))
            
            // BUTTON BORDER
            // Button("Button Title", action: {})
            //     .controlSize(.regular)
            //     .buttonStyle(.borderedProminent)
            //     .buttonBorderShape(.buttonBorder)
        }
        .padding(.top, 10)
    }
}

// MARK: - Preview

#Preview {
    ButtonStylesExample()
}
