//
//  PopoverExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 01/02/2024.
//

import SwiftUI

struct PopoverExample: View {
    
    @State private var show: Bool = false
    
    var body: some View {
        ZStack {
            Color.indigo.ignoresSafeArea()
            
            VStack {
                Button("Button") {
                    // MARK: OPCJA 1: SHEET
                    // show.toggle()
                    
                    // MARK: OPCJA 2: TRANSITION
                    // withAnimation(.spring) {
                    //     show.toggle()
                    // }
                    
                    // MARK: OPCJA 3: ANIMATION OFFSET
                    // show.toggle()
                }
                .font(.title)
                .fontWeight(.medium)
                .foregroundStyle(.white)
                
                Spacer()
            }
            // MARK: OPCJA 1: SHEET
            // .sheet(isPresented: $show) {
            //     PopoverExampleSecondView()
            // }
            
            // MARK: OPCJA 2: TRANSITION
            // ZStack {
            //     if show {
            //         PopoverExampleSecondView(show: $show)
            //             .padding(.top, 250)
            //             .transition(.move(edge: .bottom))
            //     }
            // }
            // .zIndex(1.0)
            
            // MARK: OPCJA 3: ANIMATION OFFSET
            // PopoverExampleSecondView(show: $show)
            //     .padding(.top, 250)
            //     .offset(y: show ? 0 : UIScreen.main.bounds.height)
            //     .animation(.spring, value: show)
        }
    }
}

// MARK: - Second view
struct PopoverExampleSecondView: View {
    
    // MARK: OPCJA 1: SHEET
    // @Environment(\.dismiss) private var dismiss
    
    // MARK: OPCJA 2: TRANSITION
    // @Binding var show: Bool
    
    // MARK: OPCJA 3: ANIMATION OFFSET
    // @Binding var show: Bool
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color.green.ignoresSafeArea()
            
            Button(action: {
                // MARK: OPCJA 1: SHEET
                // dismiss()
                
                // MARK: OPCJA 2: TRANSITION
                // withAnimation(.spring) {
                //     show.toggle()
                // }
                
                // MARK: OPCJA 3: ANIMATION OFFSET
                // show.toggle()
                
            }, label: {
                Image(systemName: "xmark")
                    .font(.title)
                    .foregroundStyle(.black)
                    .padding()
            })
        }
    }
}

// MARK: - Preview
#Preview {
    PopoverExample()
}
