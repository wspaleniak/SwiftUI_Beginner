//
//  ObservableMacroExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 29/06/2024.
//

import SwiftUI

// MARK: - View model
@Observable
final class ObservableMacroExampleVM {
    
    // MARK: - Properties
    var fruits: [String] = ["Banana"]
    
    @ObservationIgnored
    var title: String = "Fruits"
    
    // MARK: - Methods
    func addOrange() {
        fruits.append("Orange")
    }
    
    func changeTitle() {
        title = "New Title"
    }
}



// MARK: - View
struct ObservableMacroExample: View {
    
    // MARK: - Properties
    @State
    var viewModel = ObservableMacroExampleVM()
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            List(viewModel.fruits, id: \.self) { fruit in
                Text(fruit)
            }
            HStack {
                Button("Title") {
                    viewModel.changeTitle()
                }
                Button("Orange") {
                    viewModel.addOrange()
                }
                ObservableMacroExampleButtonOne(
                    viewModel: viewModel
                )
                ObservableMacroExampleButtonTwo()
                    .environment(viewModel)
            }
            .buttonStyle(.borderedProminent)
            .navigationTitle(viewModel.title)
        }
    }
}



// MARK: - Subview 1
struct ObservableMacroExampleButtonOne: View {
    
    // MARK: - Properties
    @Bindable
    var viewModel: ObservableMacroExampleVM
    
    // MARK: - Body
    var body: some View {
        Button("Apple") {
            viewModel.fruits.append("Apple")
        }
    }
}



// MARK: - Subview 2
struct ObservableMacroExampleButtonTwo: View {
    
    // MARK: - Properties
    @Environment(ObservableMacroExampleVM.self)
    var viewModel
    
    // MARK: - Body
    var body: some View {
        Button("Cherry") {
            viewModel.fruits.append("Cherry")
        }
    }
}



// MARK: - Preview
#Preview {
    ObservableMacroExample()
}
