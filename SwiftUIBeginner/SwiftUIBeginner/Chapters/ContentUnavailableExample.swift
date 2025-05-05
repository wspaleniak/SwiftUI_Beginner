//
//  ContentUnavailableExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 29/06/2024.
//

import SwiftUI

struct ContentUnavailableExample: View {
    
    // MARK: - Body
    
    var body: some View {
        // Default
        ContentUnavailableView.search
        ContentUnavailableView.search(text: "BMW")
        
        // Custom
        ContentUnavailableView(
            "No Internet Connection",
            systemImage: "wifi.slash",
            description: Text("Please connect to the internet and try again.")
        )
        .background(.gray.opacity(0.15))
    }
}

// MARK: - Preview

#Preview {
    ContentUnavailableExample()
}
