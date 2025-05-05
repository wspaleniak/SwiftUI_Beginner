//
//  BackgroundsAndOverlaysExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 28/12/2023.
//

import SwiftUI

struct BackgroundsAndOverlaysExample: View {
    var body: some View {
        // Background
        // backgroundExample
        
        // Overlay
        // overlayExample
        
        // Example 01
        // firstExample
        
        // Example 02
        Image(systemName: "heart.fill")
            .font(.system(size: 75))
            .foregroundStyle(.white)
            .background(alignment: .center) {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [.purple, .blue],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 150, height: 150)
                    .shadow(color: .black, radius: 5)
                    .overlay(alignment: .bottomTrailing) {
                        Circle()
                            .fill(.red)
                            .frame(width: 50, height: 50)
                            .shadow(color: .black, radius: 5)
                            .overlay {
                                Text("5")
                                    .font(.title)
                                    .foregroundStyle(.white)
                            }
                    }
            }
    }
}

// MARK: - Extension
extension BackgroundsAndOverlaysExample {
    // Background
    private var backgroundExample: some View {
        Text("Hello World!")
            .background(
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [.red, .purple, .blue],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .frame(width: 150, height: 150)
            )
    }
    
    // Overlay
    private var overlayExample: some View {
        Circle()
            .fill(.pink)
            .frame(width: 150, height: 150)
            .overlay(
                Text("Hello")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
            )
    }
    
    // Example 01
    private var firstExample: some View {
        Rectangle()
            .frame(width: 100, height: 100)
            .overlay(alignment: .topLeading) {
                Rectangle()
                    .fill(.blue)
                    .frame(width: 50, height: 50)
            }
            .background(alignment: .bottomTrailing) {
                Rectangle()
                    .fill(.red)
                    .frame(width: 150, height: 150)
            }
    }
}

// MARK: - Preview
#Preview {
    BackgroundsAndOverlaysExample()
}
