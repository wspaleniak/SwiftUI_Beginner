//
//  AdjustAnimationsExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 28/01/2024.
//

import SwiftUI

struct AdjustAnimationsExample: View {
    
    @State var isAnimated: Bool = false
    let timing: Double = 1.0
    
    var body: some View {
        
        Button("Button") {
            isAnimated.toggle()
        }
        
        Spacer()
        
        // MARK: - CLASSIC
        // RoundedRectangle(cornerRadius: 25.0)
        //     .frame(width: isAnimated ? 300 : 100, height: 100)
        //     .animation(.default, value: isAnimated)
        
        // RoundedRectangle(cornerRadius: 25.0)
        //     .frame(width: isAnimated ? 300 : 100, height: 100)
        //     .animation(.linear(duration: timing), value: isAnimated)
        
        // RoundedRectangle(cornerRadius: 25.0)
        //     .frame(width: isAnimated ? 300 : 100, height: 100)
        //     .animation(.easeIn(duration: timing), value: isAnimated)
        
        // RoundedRectangle(cornerRadius: 25.0)
        //     .frame(width: isAnimated ? 300 : 100, height: 100)
        //     .animation(.easeInOut(duration: timing), value: isAnimated)
        
        // RoundedRectangle(cornerRadius: 25.0)
        //     .frame(width: isAnimated ? 300 : 100, height: 100)
        //     .animation(.easeOut(duration: timing), value: isAnimated)
        
        // MARK: - SPRING
        RoundedRectangle(cornerRadius: 25.0)
            .frame(width: isAnimated ? 300 : 100, height: 50)
            .animation(.spring(duration: timing), value: isAnimated)
        
        RoundedRectangle(cornerRadius: 25.0)
            .frame(width: isAnimated ? 300 : 100, height: 50)
            .animation(.bouncy(duration: timing), value: isAnimated)
        
        RoundedRectangle(cornerRadius: 25.0)
            .frame(width: isAnimated ? 300 : 100, height: 50)
            .animation(.smooth(duration: timing), value: isAnimated)
        
        RoundedRectangle(cornerRadius: 25.0)
            .frame(width: isAnimated ? 300 : 100, height: 50)
            .animation(.snappy(duration: timing), value: isAnimated)
        
        RoundedRectangle(cornerRadius: 25.0)
            .frame(width: isAnimated ? 300 : 100, height: 50)
            .animation(.interactiveSpring(duration: timing), value: isAnimated)
        
        RoundedRectangle(cornerRadius: 25.0)
            .frame(width: isAnimated ? 300 : 100, height: 50)
            .animation(.interpolatingSpring(duration: timing), value: isAnimated)
        
        // MARK: - ADJUST SPRING
        RoundedRectangle(cornerRadius: 25.0)
            .fill(.red)
            .frame(width: isAnimated ? 300 : 100, height: 50)
            .animation(
                Animation
                    .spring(
                        response: 2.0,
                        dampingFraction: 0.25,
                        blendDuration: 1.0
                    ),
                value: isAnimated
            )
        
        RoundedRectangle(cornerRadius: 25.0)
            .fill(.blue)
            .frame(width: isAnimated ? 300 : 100, height: 50)
            .animation(
                Animation
                    .spring(
                        duration: 2.0,
                        bounce: 0.75,
                        blendDuration: 1.0
                    ),
                value: isAnimated
            )
        
        Spacer()
    }
}

// MARK: - Preview
#Preview {
    AdjustAnimationsExample()
}
