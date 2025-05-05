//
//  OnAppearOnDisappearExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 13/04/2024.
//

import SwiftUI

// MARK: - View

struct OnAppearOnDisappearExample: View {
    
    // MARK: - Properties
    
    @State private var text: String = "Start text"
    @State private var counter: Int = 0
    
    // MARK: - Body
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Text(text)
                
                NavigationLink("Go to new screen >") {
                    Text(text)
                }
                
                LazyVStack {
                    ForEach(0..<50) { _ in
                        RoundedRectangle(cornerRadius: 25.0)
                            .frame(height: 100)
                            .padding(.vertical, 4)
                            .padding(.horizontal)
                            .onAppear {
                                counter += 1
                            }
                            .onDisappear {
                                counter -= 1
                            }
                    }
                }
            }
            .onAppear {
                Task { @MainActor in
                    try await Task.sleep(nanoseconds: 2_000_000_000)
                    text = "New text"
                }
            }
            .onDisappear {
                Task { @MainActor in
                    try await Task.sleep(nanoseconds: 2_000_000_000)
                    text = "Text for new screen"
                }
            }
            .navigationTitle("OnAppear: \(counter)")
        }
    }
}

// MARK: - Preview

#Preview {
    OnAppearOnDisappearExample()
}
