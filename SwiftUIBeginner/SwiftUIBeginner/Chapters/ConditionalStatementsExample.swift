//
//  ConditionalStatementsExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 09/01/2024.
//

import SwiftUI

struct ConditionalStatementsExample: View {
    
    @State var showCircle: Bool = false
    @State var showRectangle: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Button("Circle Button: \(showCircle.description)") {
                withAnimation(nil) {
                    showCircle.toggle()
                }
            }
            
            Button("Rectangle Button: \(showRectangle.description)") {
                withAnimation(nil) {
                    withAnimation(nil) {
                        showRectangle.toggle()
                    }
                }
            }
            
            if showCircle {
                Circle()
                    .frame(width: 100, height: 100)
            }
            
            if showRectangle {
                Rectangle()
                    .frame(width: 100, height: 100)
            }
        }
    }
}

#Preview {
    ConditionalStatementsExample()
}
