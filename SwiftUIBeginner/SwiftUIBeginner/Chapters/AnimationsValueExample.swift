//
//  AnimationsValueExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 23/06/2024.
//

import SwiftUI

struct AnimationsValueExample: View {
    
    // MARK: - Properties
    
    @State private var horizontal: Alignment = .leading
    
    @State private var vertical: Alignment = .top
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            VStack {
                VStack(spacing: 10) {
                    Button(action: {
                        vertical = .top
                    }, label: {
                        Image(systemName: "chevron.up")
                    })
                    
                    HStack(spacing: 8) {
                        Button(action: {
                            horizontal = .leading
                        }, label: {
                            Image(systemName: "chevron.left")
                        })
                        
                        Rectangle()
                            .frame(width: 30, height: 30)
                            .foregroundStyle(.blue)
                        
                        Button(action: {
                            horizontal = .trailing
                        }, label: {
                            Image(systemName: "chevron.right")
                        })
                    }
                    
                    Button(action: {
                        vertical = .bottom
                    }, label: {
                        Image(systemName: "chevron.down")
                    })
                }
                .padding()
                .font(.title)
                
                ZStack {
                    Rectangle()
                        .frame(width: 100, height: 100)
                        .frame(maxWidth: .infinity, alignment: horizontal)
                        .frame(maxHeight: .infinity, alignment: vertical)
                        .foregroundStyle(.pink)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.blue.opacity(0.5))
            }
        }
        .animation(.bouncy, value: horizontal)
        .animation(.spring, value: vertical)
    }
}

// MARK: - Preview

#Preview {
    AnimationsValueExample()
}
