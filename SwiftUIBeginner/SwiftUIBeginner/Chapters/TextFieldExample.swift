//
//  TextFieldExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 12/02/2024.
//

import SwiftUI

struct TextFieldExample: View {
    
    @State private var text: String = ""
    @State private var data: [String] = []
    
    // MARK: - View
    var body: some View {
        NavigationStack {
            VStack(spacing: 15) {
                TextField("Type something here...", text: $text)
                    .padding(.horizontal)
                    .frame(height: 40)
                    .font(.headline)
                    .foregroundStyle(.red)
                    .background(
                        Capsule()
                            .fill(.gray.opacity(0.15))
                    )
                
                Button(action: {
                    saveData()
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
                .disabled(isSaveDisabled())
                
                VStack {
                    ForEach(data, id: \.self) { text in
                        Text(text)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            .transition(.slide)
                    }
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Notes")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Clear") {
                        data.removeAll()
                    }
                }
            }
        }
    }
    
    private func isSaveDisabled() -> Bool {
        text.trimmingCharacters(in: .whitespaces).count < 4
    }
    
    private func saveData() {
        withAnimation(.bouncy) {
            data.append(text)
            text = ""
        }
    }
}

// MARK: - Preview
#Preview {
    TextFieldExample()
}
