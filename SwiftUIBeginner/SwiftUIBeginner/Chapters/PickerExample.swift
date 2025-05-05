//
//  PickerExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 15/02/2024.
//

import SwiftUI

struct PickerExample: View {
    
    // MARK: - Enums
    private enum VehicleType: CaseIterable, Identifiable {
        case sedan
        case coupe
        case cabrio
        case minivan
        case truck
        
        var id: Self { self }
        
        var name: String {
            switch self {
            case .sedan: "Sedan"
            case .coupe: "Coupe"
            case .cabrio: "Kabriolet"
            case .minivan: "Minivan"
            case .truck: "Ciężarówka"
            }
        }
    }
    
    // MARK: - Properties
    @State private var selection: VehicleType = .sedan
    
    // MARK: - View
    var body: some View {
        List {
            Picker(
                selection: $selection,
                content: {
                    ForEach(VehicleType.allCases, id: \.self) { vehicleType in
                        Text(vehicleType.name)
                    }
                }, label: {
                    Text("Typ pojazdu")
                }
            )
            .pickerStyle(.menu)
            
            HStack {
                Text("Wybrany typ pojazdu:")
                Spacer()
                Text(selection.name)
            }
            .font(.headline)
            .foregroundStyle(.red)
        }
    }
}

// MARK: - Preview
#Preview {
    PickerExample()
}
