//
//  GradientsExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 11/11/2023.
//

import SwiftUI

struct GradientsExample: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0)
//            .fill(Color.red)
//            .fill(
//                LinearGradient(
//                    colors: [
//                        .blue,
//                        .purple,
//                        .red
//                    ],
//                    startPoint: .leading,
//                    endPoint: .trailing
//                )
//            )
//            .fill(
//                RadialGradient(
//                    colors: [
//                        .blue,
//                        .purple,
//                        .red
//                    ],
//                    center: .top,
//                    startRadius: 30,
//                    endRadius: 200
//                )
//            )
//            .fill(
//                AngularGradient(
//                    colors: [
//                        .blue,
//                        .purple,
//                        .red
//                    ],
//                    center: .center,
//                    angle: .degrees(90)
//                )
//            )
            .fill(
                EllipticalGradient(
                    colors: [
                        .red,
                        .purple,
                        .blue
                    ],
                    center: .top,
                    startRadiusFraction: 0.0,
                    endRadiusFraction: 0.75
                )
            )
            .frame(width: 300, height: 200)
            .overlay(
                Text("Hello")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.white)
            )
    }
}

#Preview {
    GradientsExample()
}
