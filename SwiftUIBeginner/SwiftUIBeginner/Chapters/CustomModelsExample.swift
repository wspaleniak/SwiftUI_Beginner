//
//  CustomModelsExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 16/04/2024.
//

import SwiftUI

// MARK: - View

struct CustomModelsExample: View {
    
    // MARK: - Structs
    
    struct User: Identifiable {
        let id: String = UUID().uuidString
        let nick: String
        let name: String
        let followers: Int
        let isVerified: Bool
    }
    
    // MARK: - Properties
    
    @State private var users: [User] = [
        .init(nick: "nick123", name: "Nick", followers: 10_000, isVerified: true),
        .init(nick: "hotemily69", name: "Emily", followers: 12_000, isVerified: false),
        .init(nick: "panicz_panicz", name: "Wojtek", followers: 15_000, isVerified: true)
    ]
    
    // MARK: - Body
    
    var body: some View {
        NavigationStack {
            List(users) { user in
                HStack(spacing: 14) {
                    Circle()
                        .foregroundStyle(.indigo)
                        .frame(height: 40)
                    
                    VStack(alignment: .leading) {
                        Text(user.name)
                            .font(.headline)
                        Text("@\(user.nick)")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                    
                    if user.isVerified {
                        Image(systemName: "checkmark.seal.fill")
                            .foregroundStyle(.blue)
                    }
                    
                    VStack {
                        Text("\(user.followers)")
                            .font(.headline)
                        Text("Followers")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                    }
                }
                .padding(.vertical, 4)
            }
            .navigationTitle("Users")
        }
    }
}

// MARK: - Preview

#Preview {
    CustomModelsExample()
}
