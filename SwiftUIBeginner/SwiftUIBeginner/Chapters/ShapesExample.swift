//
//  ShapesExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 10/11/2023.
//

import SwiftUI

struct ShapesExample: View {
    var body: some View {
        VStack(spacing: 50) {
            Circle()
//                .fill(.blue)
//                .foregroundStyle(.pink)
//                .stroke()
//                .stroke(.red, lineWidth: 20)
//                .stroke(.blue, style: .init(lineWidth: 30, lineCap: .round, dash: [50]))
                .trim(from: 0.0, to: 0.65)
                .rotation(.degrees(-90))
                .stroke(.pink, lineWidth: 30)
                .frame(width: 100, height: 100)
            
            Ellipse()
                .frame(width: 100, height: 50)
            
            Capsule(style: .continuous)
                .frame(width: 200, height: 50)
            
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 200, height: 100)
        }
    }
}

#Preview {
    ShapesExample()
}
