//
//  FocusStateExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 11/05/2024.
//

import SwiftUI

// MARK: - View

struct FocusStateExample: View {
    
    // MARK: - Properties
    
    // MARK: Focus state dla jednego pola
    // @FocusState private var usernameInFocus: Bool
    // @State private var nameText: String = ""
    
    // MARK: Focus state dla kilku pól
    enum FieldType: Int {
        case login, password, age
    }
    @FocusState private var fieldType: FieldType?
    @State private var loginText: String = ""
    @State private var passwordText: String = ""
    @State private var ageText: String = ""
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 20) {
            
            // MARK: Focus state dla jednego pola
            // TextField("Add your name", text: $nameText)
            // .padding()
            // .frame(height: 40)
            // .background(Capsule().stroke(lineWidth: 1.0))
            // .focused($usernameInFocus)
            
            // Button("Select username") { usernameInFocus = true }
            // Button("Unselect username") { usernameInFocus = false }
            
            // MARK: Focus state dla kilku pól
            TextField("Add your login", text: $loginText)
            .padding()
            .frame(height: 40)
            .background(Capsule().stroke(lineWidth: 1.0))
            .focused($fieldType, equals: .login)
            
            SecureField("Add your password", text: $passwordText)
            .padding()
            .frame(height: 40)
            .background(Capsule().stroke(lineWidth: 1.0))
            .focused($fieldType, equals: .password)
            
            TextField("Add your age", text: $ageText)
            .padding()
            .frame(height: 40)
            .background(Capsule().stroke(lineWidth: 1.0))
            .focused($fieldType, equals: .age)
            
            HStack {
                Button("PREVIOUS") { selectPreviousField() }
                Spacer()
                Button("NEXT") { selectNextField() }
            }
            .padding()
        }
        .padding()
    }
    
    // MARK: - Methods
    
    /// Metoda pozwala zaznaczyć poprzednie pole tekstowe jeśli istnieje.
    private func selectPreviousField() {
        guard let fieldType,
              let previousField = FieldType(rawValue: fieldType.rawValue - 1)
        else {
            self.fieldType = nil
            return
        }
        self.fieldType = previousField
    }
    
    /// Metoda pozwala zaznaczyć kolejne pole tekstowe jeśli istnieje.
    private func selectNextField() {
        guard let fieldType,
              let nextField = FieldType(rawValue: fieldType.rawValue + 1)
        else {
            self.fieldType = nil
            return
        }
        self.fieldType = nextField
    }
}

// MARK: - Preview

#Preview {
    FocusStateExample()
}
