//
//  NavigationStackExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 02/06/2024.
//

import SwiftUI

// MARK: - Primary view

struct NavigationStackExample: View {
    
    // MARK: - Enums
    
    enum ViewType: String, Hashable, CaseIterable {
        case login = "Logowanie"
        case onboarding = "Przywitanie"
        case rules = "Regulamin"
        case main = "Strona główna"
    }
    
    // MARK: - Properties
    
    @State private var stack: [ViewType] = []
    
    // MARK: - Body
    
    var body: some View {
        
        // MARK: BEZ NAVIGATION PATH
        // NavigationStack {
        //     List(ViewType.allCases, id: \.self) { type in
        //         NavigationLink(value: type) {
        //             Text(type.rawValue)
        //         }
        //     }
        //     .navigationTitle("New App")
        //     .navigationDestination(for: ViewType.self) { type in
        //         NavigationStackExampleSecond(type)
        //     }
        // }
        
        // MARK: UŻYCIE NAVIGATION PATH
        NavigationStack(path: $stack) {
            List {
                ForEach(ViewType.allCases, id: \.self) { type in
                    NavigationLink(value: type) {
                        Text(type.rawValue)
                    }
                }
                Button("Go to login") {
                    stack.append(contentsOf: [.login, .rules])
                }
            }
            .navigationTitle("New App")
            .navigationDestination(for: ViewType.self) { type in
                NavigationStackExampleSecond(type)
            }
            .onChange(of: stack) { _, newValue in
                print("New on stack: \(newValue)")
            }
        }
    }
}

// MARK: - Secondary view

struct NavigationStackExampleSecond: View {
    
    // MARK: - Properties
    
    let type: NavigationStackExample.ViewType
    
    // MARK: - Init
    
    init(_ type: NavigationStackExample.ViewType) {
        self.type = type
        print("Init \(type)")
    }
    
    // MARK: - Body
    
    var body: some View {
        Text(type.rawValue)
        NavigationLink(value: NavigationStackExample.ViewType.onboarding) {
            Text("Go to onboarding")
        }
    }
}

// MARK: - Preview

#Preview {
    NavigationStackExample()
}
