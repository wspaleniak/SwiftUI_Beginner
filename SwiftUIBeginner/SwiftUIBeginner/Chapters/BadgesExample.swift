//
//  BadgesExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 11/05/2024.
//

import SwiftUI

// MARK: - View

struct BadgesExample: View {
    
    // MARK: - Structs
    
    struct Fruit: Identifiable, Equatable {
        let id = UUID().uuidString
        let name: String
        let badge: String
    }
    
    // MARK: - Enums
    
    enum TabType {
        case home
        case browse
        case user
    }
    
    // MARK: - Properties
    
    @State private var selectedTab: TabType = .home
    
    @State private var fruits: [Fruit] = [
        .init(name: "banana", badge: "New fruit"),
        .init(name: "apple", badge: ""),
        .init(name: "peach", badge: "Check it"),
        .init(name: "cherry", badge: "Look here"),
        .init(name: "orange", badge: ""),
    ]
    
    // MARK: - Body
    
    var body: some View {
        TabView(selection: $selectedTab) {
            list
                .tag(TabType.home)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .badge("New")
            
            Color.indigo
                .ignoresSafeArea(edges: .top)
                .tag(TabType.browse)
                .tabItem {
                    Image(systemName: "globe")
                    Text("Browse")
                }
                .badge(1)
            
            Color.pink
                .ignoresSafeArea(edges: .top)
                .tag(TabType.user)
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("User")
                }
                .badge("!")
        }
        .tint(.indigo)
    }
    
    // MARK: - Subviews
    
    private var list: some View {
        List {
            ForEach(fruits) { fruit in
                Text(fruit.name.capitalized)
                    .badge(fruit.badge.uppercased())
            }
        }
    }
}

// MARK: - Preview

#Preview {
    BadgesExample()
}
