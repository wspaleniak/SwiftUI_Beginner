//
//  ListExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 09/02/2024.
//

import SwiftUI

struct ListExample: View {
    
    @State private var cars: [String] = [
        "BMW 750i", "Mercedes CLS500", "Audi RS7", "Jaguar XJR"
    ]
    @State private var devices: [String] = [
        "Studio Display", "Macbook Pro 16", "iPhone 14 Pro", "AirPods Pro 2"
    ]
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(cars, id: \.self) { car in
                        NavigationLink("Navigation link: \(car)") {
                            Text(car)
                        }
                        Button("Button: \(car)") {
                            print("\(car) tapped")
                        }
                    }
                    .onMove(perform: moveItem)
                    .onDelete(perform: deleteItem)
                    .listRowBackground(Color.yellow)
                    .listRowSeparatorTint(.green)
                } header: {
                    HStack {
                        Text("Cars")
                        Image(systemName: "car")
                    }
                    .font(.headline)
                    .foregroundStyle(.blue)
                }
                
                Section {
                    ForEach(devices, id: \.self) { device in
                        Text(device)
                    }
                } header: {
                    HStack {
                        Text("Devices")
                        Image(systemName: "iphone")
                    }
                    .font(.headline)
                    .foregroundStyle(.purple)
                }
            }
            .navigationTitle("Your items")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .topBarTrailing) {
                    topBarTrailingButton
                }
            }
        }
        .tint(.red)
    }
    
    // MARK: - Subviews
    /// Prawy przycisk na pasku nawigacji.
    private var topBarTrailingButton: some View {
        Button("Add") {
            addItem(item: "Porsche 911")
        }
    }
    
    // MARK: - Methods
    /// Metoda pozwala dodać nowy element do tablicy.
    private func addItem(item: String) {
        cars.append(item)
    }
    
    /// Metoda pozwala przesunąć element tablicy na inne miejsce.
    private func moveItem(indices: IndexSet, newOffset: Int) {
        cars.move(fromOffsets: indices, toOffset: newOffset)
    }
    
    /// Metoda pozwala usunąć element z tablicy.
    private func deleteItem(at indexSet: IndexSet) {
        cars.remove(atOffsets: indexSet)
    }
}

// MARK: - Preview
#Preview {
    ListExample()
}
