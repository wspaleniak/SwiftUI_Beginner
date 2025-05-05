//
//  ImagesExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 28/12/2023.
//

import SwiftUI

struct ImagesExample: View {
    var body: some View {
        Image("MyNewBook")
            .resizable()
            .scaledToFit()
            .frame(width: 300)
            .clipShape(
                RoundedRectangle(cornerRadius: 15)
            )
    }
}

#Preview {
    ImagesExample()
}
