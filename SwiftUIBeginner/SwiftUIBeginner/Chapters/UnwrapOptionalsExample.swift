//
//  UnwrapOptionalsExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 14/04/2024.
//

import SwiftUI

// MARK: View

struct UnwrapOptionalsExample: View {
    
    // MARK: - Proeprties
    
    @State private var userID: String? = "123"
    @State private var text: String? = nil
    @State private var isLoading: Bool = false
    
    // MARK: - Body
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Hello world!")
                
                if isLoading {
                    ProgressView()
                }
                
                if let text {
                    Text(text)
                }
                
                Spacer()
            }
            .navigationTitle("Safe Coding")
            .onAppear {
                loadData()
            }
        }
    }
    
    // MARK: - Methods
    
    private func loadData() {
        Task { @MainActor in
            isLoading = true
            try await Task.sleep(nanoseconds: 2_000_000_000)
            isLoading = false
            
            text = if let userID {
                "This is the new data! userID: \(userID)"
            } else {
                "Error, userID does not exist"
            }
            
            // MARK: IF-LET
            // if let userID {
            //     text = "This is the new data! userID: \(userID)"
            // } else {
            //     text = "Error, userID does not exist"
            // }
            
            // MARK: GUARD-LET
            // guard let userID else {
            //     text = "Error, userID does not exist"
            //     return
            // }
            // text = "This is the new data! userID: \(userID)"
        }
    }
}

// MARK: - Preview

#Preview {
    UnwrapOptionalsExample()
}
