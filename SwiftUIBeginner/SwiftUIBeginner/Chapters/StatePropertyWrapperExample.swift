//
//  StatePropertyWrapperExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 06/01/2024.
//

import SwiftUI

struct StatePropertyWrapperExample: View {
    
    @State var backgroundColor: Color = .green
    @State var fontColor: Color = .black
    @State var myTitle: String = "Title"
    @State var count: Int = 0
    
    var body: some View {
        ZStack {
            // Background
            backgroundColor
                .ignoresSafeArea()
            
            // Content
            VStack(spacing: 20) {
                Text(myTitle)
                    .font(.title)
                
                Text("Count: \(count)")
                    .font(.headline)
                
                HStack(spacing: 20) {
                    Button("BUTTON 1") {
                        backgroundColor = .red
                        fontColor = .white
                        myTitle = "BUTTON 1 was tapped"
                        count -= 1
                    }
                    
                    Button("BUTTON 2") {
                        backgroundColor = .green
                        fontColor = .black
                        myTitle = "BUTTON 2 was tapped"
                        count += 1
                    }
                }
            }
            .foregroundStyle(fontColor)
        }
    }
}

// MARK: - Preview
#Preview {
    StatePropertyWrapperExample()
}
