//
//  ExtractSubviewExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 07/01/2024.
//

import SwiftUI

struct ExtractSubviewExample: View {
    struct Fruit: Identifiable {
        let id: UUID = UUID()
        let name: String
        let count: Int
        let color: Color
    }
    
    let fruits: [Fruit] = [
        Fruit(name: "Apples", count: 10, color: .red),
        Fruit(name: "Oranges", count: 8, color: .orange),
        Fruit(name: "Pears", count: 5, color: .green)
    ]
    
    var body: some View {
        ZStack {
            // Background
            Color.yellow.ignoresSafeArea()
            
            // Content
            contentView
        }
    }
    
    // Wyodrębniony podwidok do zmiennej.
    private var contentView: some View {
        HStack {
            ForEach(fruits) { fruit in
                ExtractSubviewExampleItem(
                    count: fruit.count,
                    title: fruit.name,
                    color: fruit.color
                )
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
    }
}

// Wyodrębniony podwidok do nowej struktury.
struct ExtractSubviewExampleItem: View {
    let count: Int
    let title: String
    let color: Color
    
    var body: some View {
        VStack {
            Text("\(count)")
            Text(title)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 8)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(color)
        )
    }
}

// MARK: - Preview
#Preview {
    ExtractSubviewExample()
}
