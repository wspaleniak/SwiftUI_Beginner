//
//  AppStorageExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 21/04/2024.
//

import SwiftUI

// MARK: - View

struct AppStorageExample: View {
    
    // MARK: 

    @AppStorage("username") private var username: String?
    // @State private var username: String? = nil
    
    var body: some View {
        VStack {
            Text(username ?? "Unknown")
            
            Button("Save") {
                let name: String = "Wujaszek"
                username = name
                // UserDefaults.standard.set(name, forKey: "username")
            }
        }
        // .onAppear {
        //     username = UserDefaults.standard.string(forKey: "username")
        // }
    }
}

// MARK: - Preview

#Preview {
    AppStorageExample()
}
