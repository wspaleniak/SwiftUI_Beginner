//
//  AnimationsExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 11/01/2024.
//

import SwiftUI

struct AnimationsExample: View {
    
    @State var isAnimated: Bool = false
    
    var body: some View {
        VStack {
            Button("Button") {
                
                // MARK: #1
                // withAnimation(.default.delay(2)) {
                //     isAnimated.toggle()
                // }
                
                // MARK: #2
                // withAnimation(
                //     Animation
                //         .default
                //         .repeatCount(3, autoreverses: true)
                // ) {
                //     isAnimated.toggle()
                // }
                
                // MARK: #3
                isAnimated.toggle()
            }
            
            Spacer()
            
            RoundedRectangle(cornerRadius: isAnimated ? 50.0 : 25.0)
                .fill(isAnimated ? .red : .blue)
                .frame(
                    width: isAnimated ? 300 : 200,
                    height: isAnimated ? 200 : 300)
                .rotationEffect(Angle(degrees: isAnimated ? 135 : 0))
                .offset(y: isAnimated ? 200 : 0)
                .animation(
                    Animation
                        .default
                        .repeatCount(3, autoreverses: true),
                    value: isAnimated
                )
            
            Spacer()
        }
    }
}

// MARK: - Preview
#Preview {
    AnimationsExample()
}
