//
//  ExtractMethodExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 07/01/2024.
//

import SwiftUI

struct ExtractMethodExample: View {
    
    @State var backgroundColor: Color = .yellow
    
    var body: some View {
        ZStack {
            // Background
            backgroundColor
                .ignoresSafeArea()
            
            // Content
            contentLayer
        }
    }
    
    // Wyodrębnienie podwidoku do osobnej zmiennej.
    private var contentLayer: some View {
        VStack {
            Text("Title")
                .font(.largeTitle)
            
            Button(action: {
                buttonTapped()
            }, label: {
                Text("PRESS ME")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 50)
                    .padding(.vertical)
                    .background(
                        Capsule()
                            .fill(.black)
                    )
            })
        }
    }
    
    // Wyodrębnienie logiki do osobnej funkcji.
    private func buttonTapped() {
        backgroundColor = .orange
    }
}

// MARK: - Preview
#Preview {
    ExtractMethodExample()
}
