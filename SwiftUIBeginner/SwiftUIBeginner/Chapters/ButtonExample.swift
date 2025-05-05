//
//  ButtonExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 05/01/2024.
//

import SwiftUI

struct ButtonExample: View {
    
    @State var title: String = "..."
    
    var body: some View {
        VStack(spacing: 25) {
            Text(title)
                .font(.headline)
            
            // Example 01
            Button("Press me!") {
                title = "Button #1 was pressed"
            }
            .tint(.purple)
            .font(.title)
            
            // Example 02
            Button(action: {
                title = "Button #2 was pressed"
            }, label: {
                Text("Press here!")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
                    .background(
                        Capsule()
                            .fill(
                                LinearGradient(
                                    colors: [.red, .purple, .blue],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .shadow(radius: 5)
                    )
                    .padding(.horizontal)
            })
            
            // Example 03
            Button(action: {
                title = "Button #3 was pressed"
            }, label: {
                Circle()
                    .fill(.white)
                    .stroke(.purple, lineWidth: 2)
                    .frame(width: 100, height: 100)
                    .shadow(radius: 10)
                    .overlay {
                        Image(systemName: "heart.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.purple)
                    }
            })
        }
    }
}

// MARK: - Preview
#Preview {
    ButtonExample()
}
