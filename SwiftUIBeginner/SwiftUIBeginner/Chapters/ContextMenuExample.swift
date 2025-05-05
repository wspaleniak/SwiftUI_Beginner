//
//  ContextMenuExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 11/02/2024.
//

import SwiftUI

struct ContextMenuExample: View {
    
    // MARK: - Properties
    @State private var backgroundColor: Color = .white
    
    // MARK: - View
    var body: some View {
        ZStack(alignment: .topTrailing) {
            backgroundColor.ignoresSafeArea()
            
            Image(systemName: "house.fill")
                .foregroundStyle(.white)
                .font(.title)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.black)
                )
                .contextMenu(menuItems: {
                    Button(action: {
                        backgroundColor = .white
                    }, label: {
                        Label("Domyślny", systemImage: "flame")
                    })
                    Button(action: {
                        backgroundColor = .yellow
                    }, label: {
                        Label("Żółty", systemImage: "flame.fill")
                    })
                })
                .padding()
        }
    }
}

// MARK: - Preview
#Preview {
    ContextMenuExample()
}
