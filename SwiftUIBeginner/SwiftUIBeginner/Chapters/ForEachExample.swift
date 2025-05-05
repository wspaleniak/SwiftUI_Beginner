//
//  ForEachExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 02/01/2024.
//

import SwiftUI

struct ForEachExample: View {
    
    struct Car: Identifiable {
        let id = UUID()
        let name: String
    }
    
    let data: [Car] = [
        Car(name: "Mercedes"),
        Car(name: "BMW"),
        Car(name: "Porsche"),
        Car(name: "Audi")
    ]
    
    var body: some View {
        HStack {
            VStack {
                ForEach(0..<4) { index in
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.orange)
                        .frame(width: 50, height: 50)
                        .overlay {
                            Text("\(index)")
                                .font(.headline)
                        }
                }
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                ForEach(data) { car in
                    Text(car.name)
                        .font(.headline)
                        .frame(height: 50)
                        .padding(.horizontal)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.yellow)
                        )
                }
            }
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// MARK: - Preview
#Preview {
    ForEachExample()
}
