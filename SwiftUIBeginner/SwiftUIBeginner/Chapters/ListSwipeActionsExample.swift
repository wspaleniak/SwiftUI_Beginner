//
//  ListSwipeActionsExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 10/05/2024.
//

import SwiftUI

// MARK: - View

struct ListSwipeActionsExample: View {
    
    // MARK: - Structs
    
    struct Fruit: Identifiable, Equatable {
        let id = UUID().uuidString
        let name: String
    }
    
    // MARK: - Properties
    
    @State private var allFruits: [Fruit] = [
        .init(name: "banana"),
        .init(name: "apple"),
        .init(name: "peach"),
        .init(name: "cherry"),
        .init(name: "orange"),
    ]
    
    @State private var savedFruits: [Fruit] = []
    
    // MARK: - Body
    
    var body: some View {
        NavigationStack {
            List {
                // ALL FRUITS
                Section("All") {
                    ForEach(allFruits) { fruit in
                        Text(fruit.name.capitalized)
                            .swipeActions(
                                edge: .leading,
                                allowsFullSwipe: false,
                                content: {
                                    Button("Save") {
                                        saveFruit(fruit)
                                    }
                                    .tint(.blue)
                                }
                            )
                            .swipeActions(
                                edge: .trailing,
                                allowsFullSwipe: true,
                                content: {
                                    Button("Delete") {
                                        deleteFruit(fruit)
                                    }
                                    .tint(.red)
                                }
                            )
                    }
                }
                
                // SAVED FRUITS
                if !savedFruits.isEmpty {
                    Section("Saved") {
                        ForEach(savedFruits) { fruit in
                            Text(fruit.name.capitalized)
                        }
                    }
                }
            }
            .animation(.spring, value: allFruits)
            .animation(.spring, value: savedFruits)
            .navigationTitle("Fruits")
        }
    }
    
    // MARK: - Methods
    
    private func deleteFruit(_ fruit: Fruit) {
        allFruits.removeAll(where: { $0 == fruit })
    }
    
    private func saveFruit(_ fruit: Fruit) {
        savedFruits.append(fruit)
    }
}

// MARK: - Preview

#Preview {
    ListSwipeActionsExample()
}
