//
//  TransitionsExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 28/01/2024.
//

import SwiftUI

struct TransitionsExample: View {
    
    @State var showView: Bool = false
    
    var body: some View {
        VStack {
            Button("BUTTON") {
                withAnimation {
                    showView.toggle()
                }
            }
            
            Spacer()
            
            if showView {
                VStack {
                    RoundedRectangle(cornerRadius: 30)
                        .frame(height: UIScreen.main.bounds.height * 0.5)
                    Text("Hello")
                }
                .transition(.asymmetric(
                    insertion: .move(edge: .leading),
                    removal: .move(edge: .bottom)
                ))
                .padding()
            }
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

// MARK: - Preview
#Preview {
    TransitionsExample()
}
