//
//  TabViewExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 28/02/2024.
//

import SwiftUI

struct TabViewExample: View {
    
    // MARK: - Enums
    enum TabType {
        case home
        case browse
        case user
    }
    
    // MARK: - Properties
    @State private var selectedTab: TabType = .home
    
    // MARK: - View
    var body: some View {
        
        // MARK: Karuzela widoków
        // TabView {
        //     RoundedRectangle(cornerRadius: 25.0)
        //         .foregroundStyle(.yellow)
        //     RoundedRectangle(cornerRadius: 25.0)
        //         .foregroundStyle(.mint)
        //     RoundedRectangle(cornerRadius: 25.0)
        //         .foregroundStyle(.cyan)
        // }
        // .tabViewStyle(.page)
        // .frame(height: 300)
        
        // MARK: Klasyczne tab view
        TabView(selection: $selectedTab) {
            HomeView(selectedTab: $selectedTab)
                .tag(TabType.home)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            BrowseView()
                .tag(TabType.browse)
                .tabItem {
                    Image(systemName: "globe")
                    Text("Browse")
                }
            
            UserView()
                .tag(TabType.user)
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("User")
                }
        }
    }
}

// MARK: - Home
struct HomeView: View {
    @Binding var selectedTab: TabViewExample.TabType

    var body: some View {
        ZStack {
            Color.yellow.ignoresSafeArea(edges: .top)
            
            VStack {
                Text("Home tab")
                
                Button("Go to user tab") {
                    selectedTab = .user
                }
            }
        }
    }
}

// MARK: - Browse
struct BrowseView: View {
    var body: some View {
        ZStack {
            Color.mint.ignoresSafeArea(edges: .top)
            Text("Browse tab")
        }
    }
}

// MARK: - User
struct UserView: View {
    var body: some View {
        ZStack {
            Color.cyan.ignoresSafeArea(edges: .top)
            Text("User tab")
        }
    }
}

// MARK: - Preview
#Preview {
    TabViewExample()
}
