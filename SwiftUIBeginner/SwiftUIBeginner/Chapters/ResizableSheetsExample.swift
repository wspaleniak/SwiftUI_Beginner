//
//  ResizableSheetsExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 22/06/2024.
//

import SwiftUI

// MARK: - First screen

struct ResizableSheetsExample: View {
    
    // MARK: - Properties
    
    @State
    private var showSheet: Bool = false
    
    // MARK: - Body
    
    var body: some View {
        Button("Click me!") {
            showSheet.toggle()
        }
        .sheet(isPresented: $showSheet) {
            ResizableSheetsExampleSecond()
        }
        .onAppear { showSheet = true }
    }
}

// MARK: - Second screen

struct ResizableSheetsExampleSecond: View {
    
    // MARK: - Properties
    
    @Environment(\.dismiss)
    private var dismiss
    
    @State
    private var selectedDetent: PresentationDetent = .medium
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "xmark")
                })
            }
            Spacer()
            Button(selectedDetent == .medium ? "Less" : "More") {
                if selectedDetent == .medium {
                    selectedDetent = .fraction(0.2)
                } else {
                    selectedDetent = .medium
                }
            }
        }
        .padding()
        .presentationDetents(
            [.fraction(0.2), .medium],
            selection: $selectedDetent
        )
        .presentationDragIndicator(.hidden) // Ukrywa ikonę paska na górze sheet
        .interactiveDismissDisabled() // Pozwala zamknąć sheet tylko z kodu
    }
}

// MARK: - Preview

#Preview {
    ResizableSheetsExample()
}
