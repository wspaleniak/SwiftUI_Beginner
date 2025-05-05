//
//  SystemMaterialsExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 09/05/2024.
//

import SwiftUI

// MARK: - View

struct SystemMaterialsExample: View {
    
    // MARK: - Properties
    
    private let url = URL(string: "https://picsum.photos/1000")
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                Text("Hello")
                    .font(.title)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 350)
            .background(
                RoundedRectangle(cornerRadius: 30)
                    // .fill(.thinMaterial)
                    // .fill(.thickMaterial)
                    // .fill(.regularMaterial)
                    .fill(.ultraThinMaterial)
                    // .fill(.ultraThickMaterial)
            )
        }
        .ignoresSafeArea()
        .background(
            AsyncImage(
                url: url,
                content: { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                },
                placeholder: {
                    ProgressView()
                }
            )
        )
    }
}

// MARK: - Preview

#Preview {
    SystemMaterialsExample()
}
