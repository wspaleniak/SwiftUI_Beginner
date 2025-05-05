//
//  NavigationSplitViewExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 25/06/2024.
//

import SwiftUI

struct NavigationSplitViewExample: View {
    
    // MARK: - Enums
    
    enum FoodCategory: String, CaseIterable {
        case fruits, vegetables, meats
    }
    
    enum Fruit: String, CaseIterable {
        case apple, banana, orange, cherry
    }
    
    enum Vegetable: String, CaseIterable {
        case potato, tomato, onion
    }
    
    enum Meat: String, CaseIterable {
        case lamb, chicken, beef, pork
    }
    
    // MARK: - Properties
    
    @State
    private var visibility: NavigationSplitViewVisibility = .all
    
    @State
    private var selectedCategory: FoodCategory? = nil
    
    @State
    private var selectedFood: String? = nil
    
    // MARK: - Body
    
    var body: some View {
        NavigationSplitView(columnVisibility: $visibility) {
            List(
                FoodCategory.allCases,
                id: \.self,
                selection: $selectedCategory
            ) { category in
                NavigationLink(category.rawValue.capitalized, value: category)
            }
            .navigationTitle("Categories")
        } content: {
            if let selectedCategory {
                let array = switch selectedCategory {
                case .fruits: Fruit.allCases.map(\.rawValue)
                case .vegetables: Vegetable.allCases.map(\.rawValue)
                case .meats: Meat.allCases.map(\.rawValue)
                }
                List(
                    array,
                    id: \.self,
                    selection: $selectedFood
                ) { food in
                    NavigationLink(food.capitalized, value: food)
                }
                .navigationTitle(selectedCategory.rawValue.capitalized)
            } else {
                Text("Select a category to begin!")
            }
        } detail: {
            if let selectedFood {
                Text(selectedFood.capitalized)
                    .navigationTitle(selectedFood.capitalized)
            } else {
                Text("Select something!")
            }
        }
        .navigationSplitViewStyle(.balanced)
        .onChange(of: selectedCategory) { _, _ in
            selectedFood = nil
        }
    }
}

// MARK: - Preview

#Preview {
    NavigationSplitViewExample()
}
