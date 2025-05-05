//
//  TapGestureExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 16/04/2024.
//

import SwiftUI

// MARK: - View

struct TapGestureExample: View {
    
    // MARK: - Properties
    
    @State private var isSelected: Bool = false
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 30) {
            RoundedRectangle(cornerRadius: 25.0)
                .frame(height: 200)
                .foregroundStyle(isSelected ? .yellow : .gray)
            
            // Button
            Button(action: {
                isSelected.toggle()
            }, label: {
                Text("Button")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(height: 40)
                    .frame(maxWidth: .infinity)
                    .background(.pink)
                    .clipShape(Capsule())
            })
            
            // Tap gesture
            Text("Tap gesture")
                .font(.headline)
                .foregroundStyle(.white)
                .frame(height: 40)
                .frame(maxWidth: .infinity)
                .background(.indigo)
                .clipShape(Capsule())
                .onTapGesture {
                    isSelected.toggle()
                }
                // .onTapGesture(count: 2) {
                //     isSelected.toggle()
                // }
        }
        .padding()
    }
}

// MARK: - Preview

#Preview {
    TapGestureExample()
}
