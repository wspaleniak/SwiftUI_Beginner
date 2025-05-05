//
//  ColorsExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 10/11/2023.
//

import SwiftUI

struct ColorsExample: View {
    
    // Poniżej użyto: Color(#colorLiteral()).
    // Ale nie można tego użyć wewnątrz body.
    let colorLiteral = Color(#colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1))
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0)
//            .fill(Color.primary)
//            .fill(colorLiteral)
//            .fill(Color(uiColor: UIColor.secondarySystemBackground))
            .fill(Color("CustomColor"))
            .frame(width: 300, height: 200)
//            .shadow(radius: 10)
            .shadow(
                color: .black.opacity(0.7),
                radius: 10,
                x: -10,
                y: -10
            )
    }
}

#Preview {
    ColorsExample()
        .preferredColorScheme(.light)
//        .preferredColorScheme(.dark)
}
