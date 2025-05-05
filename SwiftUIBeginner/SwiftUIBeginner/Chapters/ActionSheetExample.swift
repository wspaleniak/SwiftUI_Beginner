//
//  ActionSheetExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 10/02/2024.
//

import SwiftUI

struct ActionSheetExample: View {
    
    // MARK: - Enums
    private enum ActionSheetType {
        case first
        case second
        
        var title: String {
            switch self {
            case .first: "First"
            case .second: "Second"
            }
        }
        
        var message: String {
            switch self {
            case .first: "First message"
            case .second: "Second message"
            }
        }
    }
    
    // MARK: - Properties
    @State private var actionSheetType: ActionSheetType = .first
    @State private var showActionSheet: Bool = false
    
    // MARK: - View
    var body: some View {
        Button("Show action sheet") {
            showActionSheet.toggle()
        }
        .confirmationDialog(
            actionSheetType.title,
            isPresented: $showActionSheet,
            titleVisibility: .automatic,
            presenting: actionSheetType,
            actions: { type in
                Button("Anuluj", role: .cancel) { }
                switch type {
                case .first:
                    Button("Wybierz first 1") { }
                    Button("Wybierz first 2") { }
                    Button("Wybierz first 3") { }
                case .second:
                    Button("Wybierz second 1") { }
                    Button("Wybierz second 2") { }
                }
                Button("Usuń", role: .destructive) { }
            },
            message: { type in
                Text(type.message)
            }
        )
    }
}

// MARK: - Preview
#Preview {
    ActionSheetExample()
}
