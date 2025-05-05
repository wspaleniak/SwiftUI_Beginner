//
//  EnvironmentObjectExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 20/04/2024.
//

import SwiftUI

// MARK: - MAIN VIEW

struct EnvironmentObjectExample: View {
    
    @StateObject private var viewModel = EnvironmentObjectExampleVM()
    
    var body: some View {
        NavigationStack {
            List(viewModel.data, id: \.self) { item in
                NavigationLink(item) {
                    EnvironmentObjectExampleDetail(
                        selectedItem: item
                    )
                }
            }
            .navigationTitle("Devices")
        }
        .environmentObject(viewModel)
    }
}




// MARK: - DETAIL VIEW

struct EnvironmentObjectExampleDetail: View {
    
    let selectedItem: String
    
    var body: some View {
        NavigationStack {
            NavigationLink {
                EnvironmentObjectExampleExtra()
            } label: {
                Text(selectedItem)
                    .foregroundStyle(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(Capsule())
            }
            .navigationTitle("Your Device")
        }
    }
}




// MARK: - EXTRA VIEW

struct EnvironmentObjectExampleExtra: View {
    
    @EnvironmentObject private var viewModel: EnvironmentObjectExampleVM
    
    var body: some View {
        VStack {
            ForEach(viewModel.data, id: \.self) { item in
                Text(item)
            }
            
            Button("Add new device") {
                viewModel.addNewData()
            }
        }
    }
}




// MARK: - VIEW MODEL

final class EnvironmentObjectExampleVM: ObservableObject {
    
    @Published private(set) var data: [String] = []
    
    init() {
        fetchData()
    }
    
    func addNewData() {
        data.append("Vision Pro")
    }
    
    private func fetchData() {
        data.append(contentsOf: [
            "iPhone", "iPad", "MacBook", "iMac"
        ])
    }
}




// MARK: - PREVIEW

#Preview {
    EnvironmentObjectExample()
}
