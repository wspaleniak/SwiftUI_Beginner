//
//  LazyGridsExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 04/01/2024.
//

import SwiftUI

struct LazyGridsExample: View {
    
    // Kolumny dla grid
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 20, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil),
    ]
    
    var body: some View {
        ScrollView {
            Rectangle()
                .fill(.red)
                .frame(height: 300)
            
            // Pierwszy grid
            LazyVGrid(
                columns: columns,
                alignment: .center,
                spacing: 20,
                pinnedViews: [.sectionHeaders]
            ) {
                // Sekcja nr 1
                Section {
                    ForEach(0..<9) { _ in
                        Rectangle()
                            .fill(.blue)
                            .frame(height: 100)
                    }
                } header: {
                    Text("Section no.1")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(
                            Rectangle()
                                .fill(.blue)
                        )
                }
                
                // Sekcja nr 2
                Section {
                    ForEach(0..<6) { _ in
                        Rectangle()
                            .fill(.cyan)
                            .frame(height: 50)
                    }
                } header: {
                    Text("Section no.2")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(
                            Rectangle()
                                .fill(.cyan)
                        )
                }
            }
            
            // Drugi grid
            LazyVGrid(columns: columns) {
                ForEach(0..<12) { _ in
                    Rectangle()
                        .fill(.purple)
                        .frame(height: 150)
                }
            }
        }
    }
}

// MARK: - Preview
#Preview {
    LazyGridsExample()
}
