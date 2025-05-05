//
//  TextEditorExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 13/02/2024.
//

import SwiftUI

struct TextEditorExample: View {
    
    // MARK: - Properties
    @State private var text: String = "This is starting text..."
    @State private var savedText: String = ""
    
    // MARK: - View
    var body: some View {
        NavigationStack {
            VStack {
                TextEditor(text: $text)
                    .font(.headline)
                    .foregroundStyle(.red)
                    .frame(height: 250)
                    .clipShape(.rect(cornerRadius: 15))
                
                Button(action: {
                    savedText = text
                }, label: {
                    Capsule()
                        .fill()
                        .frame(height: 40)
                        .overlay {
                            Text("Save")
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                })
                
                if !savedText.isEmpty {
                    Text(savedText)
                }
            }
            .padding()
            .background(.gray.opacity(0.3))
            .navigationTitle("Notes")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

// MARK: -  Preview
#Preview {
    TextEditorExample()
}
