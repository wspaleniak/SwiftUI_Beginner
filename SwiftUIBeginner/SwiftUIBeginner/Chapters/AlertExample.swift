//
//  AlertExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 10/02/2024.
//

import SwiftUI

struct AlertExample: View {
    
    // MARK: - Enums
    /// Typ który możemy przekazać do alerta.
    /// I później możemy go w nim wykoszystać do customizacji alerta.
    /// Do customizacji alerta możemy wykorzystać również strukturę przechowującą dane.
    private enum AlertType {
        case success
        case error
        
        var title: String {
            switch self {
            case .success: "Success"
            case .error: "Error"
            }
        }
        
        var message: String {
            switch self {
            case .success: "Udało się"
            case .error: "Wystąpił błąd"
            }
        }
    }
    
    // MARK: - Properties
    @State private var alertType: AlertType = .success
    @State private var showAlert: Bool = false
    @State private var backgroundColor: Color = .white
    
    // MARK: - View
    var body: some View {
        ZStack {
            backgroundColor.ignoresSafeArea()
            
            VStack {
                Button("Success alert") {
                    alertType = .success
                    showAlert.toggle()
                }
                
                Button("Error alert") {
                    alertType = .error
                    showAlert.toggle()
                }
            }
        }
        .alert(
            alertType.title,
            isPresented: $showAlert,
            presenting: alertType,
            actions: { type in
                Button("Anuluj", role: .cancel) { }
                Button("Tło domyślne", role: .destructive) {
                    backgroundColor = .white
                }
                Button("Tło żółte") {
                    backgroundColor = .yellow
                }
            },
            message: { type in
                Text(type.message)
            }
        )
    }
}

// MARK: - Preview
#Preview {
    AlertExample()
}
