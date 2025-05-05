//
//  TextExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 10/11/2023.
//

import SwiftUI

struct TextExample: View {
    var body: some View {
        Text("Hello world!\nWitam serdecznie.\nPozdrawiam...")
//            .font(.body)
//            .fontWeight(.semibold)
//            .bold()
//            .italic()
//            .underline(true, color: .red)
//            .strikethrough(true, color: .green)
            .font(.system(size: 24, weight: .semibold, design: .serif))
            .baselineOffset(8)
            .kerning(6)
            .multilineTextAlignment(.leading)
            .foregroundStyle(.blue)
            .frame(width: 200, height: 100, alignment: .leading)
            .minimumScaleFactor(0.5)
    }
}

#Preview {
    TextExample()
}
