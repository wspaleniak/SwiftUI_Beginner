//
//  InitsAndExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 02/01/2024.
//

import SwiftUI

struct InitExample: View {
    
    enum Fruit: String {
        case apple
        case orange
        
        var color: Color {
            switch self {
            case .apple: return .red
            case .orange: return .orange
            }
        }
    }
    
    let count: Int
    let fruit: Fruit
    
    var body: some View {
        VStack(spacing: 10) {
            Text("\(count)")
                .font(.largeTitle)
                .foregroundStyle(.white)
            Text(fruit.rawValue.uppercased())
                .font(.headline)
                .foregroundStyle(.white)
        }
        .frame(width: 150, height: 150)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(fruit.color)
        )
    }
}

// MARK: - Preview
#Preview {
    HStack {
        InitExample(
            count: 10,
            fruit: .apple
        )
        InitExample(
            count: 8,
            fruit: .orange
        )
    }
}
