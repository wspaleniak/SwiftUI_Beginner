//
//  GridExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 28/06/2024.
//

import SwiftUI

struct GridExample: View {
    
    // MARK: - Body
    
    var body: some View {
        Grid(
            alignment: .center,
            horizontalSpacing: 1,
            verticalSpacing: 1
        ) {
            ForEach(0..<4) { row in
                GridRow(alignment: .bottom) {
                    ForEach(0..<4) { column in
                        let cellNumber = row * 4 + column + 1
                        if cellNumber == 7 {
                            EmptyView()
                            // Color.red.gridCellUnsizedAxes([.horizontal, .vertical])
                        } else {
                            cell(cellNumber)
                                .gridCellColumns(cellNumber == 6 ? 2 : 1)
                                .gridColumnAlignment(cellNumber == 1 ? .leading : .center)
                                // .gridCellAnchor(.leading) // nadpisuje powyższe
                        }
                    }
                }
                Divider()
                    .gridCellUnsizedAxes(.horizontal)
            }
        }
        .background(.red.opacity(0.2))
    }
    
    // MARK: - Methods
    
    private func cell(_ index: Int) -> some View {
        Text("\(index)")
            .padding()
            .frame(height: index % 2 == 0 ? 40 : 80)
            .font(.largeTitle)
            .background(.teal)
            .padding(8)
            .background(.teal.opacity(0.3))
    }
}

// MARK: - Preview

#Preview {
    GridExample()
}
