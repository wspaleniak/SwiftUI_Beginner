//
//  NavigationViewExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 08/02/2024.
//

import SwiftUI

struct NavigationViewExample: View {
    var body: some View {
        NavigationView { // Deprecated -> NavigationStack, NavigationSplitView
            NavigationLink("Go to the second screen") {
                NavigationViewExampleSecondView()
                    .navigationTitle("Second")
                    .navigationBarTitleDisplayMode(.inline)
            }
            .navigationTitle("Main screen")
            .navigationBarTitleDisplayMode(.large)
            // .toolbar(.hidden, for: .navigationBar)
        }
    }
}

// MARK: - Second view
struct NavigationViewExampleSecondView: View {
    var body: some View {
        ZStack {
            Color.yellow.ignoresSafeArea()
            
            NavigationLink("Go to the third screen") {
                NavigationViewExampleThirdView()
                    .navigationTitle("Third")
                    .navigationBarBackButtonHidden()
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Button(action: {
                                // action...
                            }, label: {
                                Image(systemName: "person.fill")
                            })
                        }
                        
                        ToolbarItem(placement: .topBarTrailing) {
                            Button(action: {
                                // action...
                            }, label: {
                                Image(systemName: "gear")
                            })
                        }
                    }
            }
        }
    }
}

// MARK: - Third view
struct NavigationViewExampleThirdView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            Text("Hello on third screen!")
            
            Button("BACK BUTTON") {
                dismiss()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.green)
    }
}

// MARK: - Preview
#Preview {
    NavigationViewExample()
}
