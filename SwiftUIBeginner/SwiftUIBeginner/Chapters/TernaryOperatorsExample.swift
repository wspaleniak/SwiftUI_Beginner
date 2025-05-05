//
//  TernaryOperatorsExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 10/01/2024.
//

import SwiftUI

struct TernaryOperatorsExample: View {
    
    @State var isStartingState: Bool = false
    
    var body: some View {
        VStack {
            Button("Button: \(isStartingState.description)") {
                withAnimation(nil) {
                    isStartingState.toggle()
                }
            }
            
            RoundedRectangle(cornerRadius: 10)
                .fill(isStartingState ? .red : .blue)
                .frame(
                    width: isStartingState ? 100 : 200,
                    height: isStartingState ? 100 : 200
                )
        }
    }
}

// MARK: - Preview
#Preview {
    TernaryOperatorsExample()
}
