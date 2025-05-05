//
//  DocumentationExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 01/04/2024.
//

import SwiftUI

// MARK: - View

struct DocumentationExample: View {
    
    // MARK: - Properties
    
    /// Should the alert show or not.
    @State private var showAlert: Bool = false
    
    /// All fruits from user garden.
    @State private var fruits: [String] = [
        "Apple", "Orange", "Banana"
    ]
    
    // MARK: - Body
    
    /*
     Jest to komentarz,
     Który można zwinąć
     Oraz rozwinąć.
     */
    
    var body: some View {
        NavigationStack {
            scrollView
                .navigationTitle("Fruits")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Alert") {
                            showAlert.toggle()
                        }
                    }
                }
                .alert(
                    "Alert",
                    isPresented: $showAlert
                ) {
                    Button("Usuń", role: .destructive, action: {})
                    Button("Zrób coś", role: .none, action: {})
                    Button("Anuluj", role: .cancel, action: {})
                } message: {
                    Text("To jest nowy alert.")
                }
        }
    }
    
    // MARK: - Subviews
    
    /// Scroll view with the main functionality.
    private var scrollView: some View {
        ScrollView {
            Text("All my fruits:")
                .font(.headline)
            
            ForEach(fruits, id: \.self) { fruit in
                Text(fruit)
            }
        }
    }
    
    // MARK: - Methods
    
    /// Method allows to setup the view.
    ///
    /// Tutaj możemy możemy dodać tekst dla pola `Discussion`. Możemy tutaj dodać tyle linijek ile potrzebujemy, a cały ten tekst pojawi się w definicji tej metody, aby pomóc kolejnym osobom, które będą zaglądać do tego kodu.
    /// ```
    /// setup(with: data, on: mapView) -> true
    /// setup(with: data, on: mapView) -> false
    /// ```
    ///
    /// - Attention: Tutaj możemy dodać jakieś rzeczy warte uwagi.
    /// - Warning: Tutaj możemy dodać jakieś ważne ostrzeżenia.
    /// - Parameters:
    ///   - data: Data for setup the view.
    ///   - screen: Parent view that presents this view.
    /// - Returns: The configuration was successful or not.
    private func setup(
        with data: Data,
        on screen: UIView
    ) -> Bool {
        // TODO: Action...
        return true
    }
}

// MARK: - Previews

#Preview {
    DocumentationExample()
}
