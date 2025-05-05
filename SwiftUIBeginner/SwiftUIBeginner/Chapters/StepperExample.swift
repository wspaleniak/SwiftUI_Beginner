//
//  StepperExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 27/02/2024.
//

import SwiftUI

struct StepperExample: View {
    
    // MARK: - Properties
    @State private var stepperValue: Int = 10
    
    @State private var rectangleWidth: CGFloat = 100
    
    // MARK: - View
    var body: some View {
        VStack(spacing: 30) {
            
            // MARK: OPCJA 1
            Stepper("Stepper: \(stepperValue)", value: $stepperValue)
            
            // MARK: OPCJA 2
            Stepper("Change width") {
                // increment
                changeRectangleWidth(50)
            } onDecrement: {
                // decrement
                changeRectangleWidth(-50)
            }

            RoundedRectangle(cornerRadius: 20)
                .frame(width: rectangleWidth, height: 100)
        }
        .padding()
    }
    
    private func changeRectangleWidth(_ amount: CGFloat) {
        withAnimation(.bouncy) {
            rectangleWidth += amount
        }
    }
}

// MARK: - Preview
#Preview {
    StepperExample()
}
