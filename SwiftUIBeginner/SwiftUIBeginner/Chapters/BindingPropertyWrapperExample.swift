//
//  BindingPropertyWrapperExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 08/01/2024.
//

import SwiftUI

struct BindingPropertyWrapperExample: View {
    @State var backgroundColor: Color = .green
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            
            VStack {
                BindingPropertyWrapperExampleItemFirst(
                    firstColor: $backgroundColor
                )
                BindingPropertyWrapperExampleItemSecond(
                    secondColor: $backgroundColor
                )
            }
        }
    }
}

struct BindingPropertyWrapperExampleItemFirst: View {
    @Binding var firstColor: Color
    
    var body: some View {
        Button(action: {
            firstColor = .yellow
        }, label: {
            Text("Button_1")
                .font(.headline)
                .foregroundStyle(.black)
                .background(firstColor)
                .padding(.all, 30)
                .background(.blue)
        })
    }
}

struct BindingPropertyWrapperExampleItemSecond: View {
    @Binding var secondColor: Color
    
    var body: some View {
        Button(action: {
            secondColor = .orange
        }, label: {
            Text("Button_2")
                .font(.headline)
                .foregroundStyle(.black)
                .background(secondColor)
                .padding(.all, 30)
                .background(.red)
        })
    }
}

// MARK: - Preview
#Preview {
    BindingPropertyWrapperExample()
}
