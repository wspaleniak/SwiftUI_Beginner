//
//  IconsExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 28/12/2023.
//

import SwiftUI

struct IconsExample: View {
    var body: some View {
        Image(systemName: "doc.fill.badge.plus")
//            .font(.largeTitle)
//            .font(.system(size: 100))
            .resizable()
//            .aspectRatio(contentMode: .fit)
            .scaledToFit()
            .foregroundStyle(.green, .blue)
            .frame(width: 200, height: 200)
//            .clipped()
    }
}

#Preview {
    IconsExample()
}
