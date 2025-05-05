//
//  ObservableObjectExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 19/04/2024.
//

import SwiftUI

// MARK: - VIEW
// Widok głowny

struct ObservableObjectExample: View {
    
    // MARK: - Properties
    /// @StateObject używamy gdy obiekt jest tworzony lokalnie i zarządzany przez ten widok.
    @StateObject private var viewModel = ObservableObjectExampleVM()
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            List {
                if viewModel.isLoading { 
                    ProgressView()
                } else {
                    ForEach(viewModel.fruits) { fruit in
                        HStack {
                            Text("\(fruit.count)")
                            Text(fruit.name)
                        }
                    }
                    .onDelete(perform: viewModel.deleteFruit)
                }
            }
            .navigationTitle("Fruits")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink("Next screen") {
                        ObservableObjectExampleSecond(
                            viewModel: viewModel
                        )
                    }
                }
            }
        }
    }
}




// MARK: - VIEW MODEL
// View model dla widoku

final class ObservableObjectExampleVM: ObservableObject {
    
    // MARK: - Structs
    /// Struktura dla obiektu owocu.
    struct Fruit: Identifiable {
        let id: String = UUID().uuidString
        let name: String
        let count: Int
    }
    
    // MARK: - Properties
    /// Aktualna lista owoców i ich ilość.
    @Published private(set) var fruits: [Fruit] = []
    
    /// Czy pobieranie aktualnej listy owoców właśnie trwa.
    @Published private(set) var isLoading: Bool = false
    
    // MARK: - Init
    /// Od razu na starcie view modelu "pobieramy" sobie aktualną listę owoców.
    /// Zamockowany czas (2 sekundy) pobierania danych z serwera.
    init() {
        Task { @MainActor in
            isLoading = true
            try await Task.sleep(nanoseconds: 2_000_000_000)
            isLoading = false
            
            fruits.append(contentsOf: [
                .init(name: "Orange", count: 3),
                .init(name: "Banana", count: 5),
                .init(name: "Apple", count: 7)
            ])
        }
    }
    
    // MARK: - Methods
    /// Motoda usuwa wybraną pozycję z listy.
    func deleteFruit(at indexSet: IndexSet) {
        fruits.remove(atOffsets: indexSet)
    }
    
    /// Metoda usuwa randomową pozycję z listy.
    func deleteRandomFruit() {
        guard !fruits.isEmpty else {
            return
        }
        let index = Int.random(in: 0..<fruits.count)
        fruits.remove(at: index)
    }
}




// MARK: - SECOND VIEW
// Dodatkowy widok otwierany z widoku głównego

struct ObservableObjectExampleSecond: View {
    
    // MARK: - Properties
    /// Zmienna środowiskowa pozwalająca zamknąć widok.
    @Environment(\.dismiss) private var dismiss
    
    /// @ObservedObject używamy gdy obiekt jest przekazywany z zewnątrz i może być używany też w innych widokach.
    @ObservedObject var viewModel: ObservableObjectExampleVM
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 30) {
                ForEach(viewModel.fruits) { fruit in
                    Text(fruit.name)
                }
            }
            
            Button("Delete fruit") {
                viewModel.deleteRandomFruit()
                dismiss()
            }
        }
    }
}




// MARK: - PREVIEW
// Podgląd

#Preview {
    ObservableObjectExample()
}
