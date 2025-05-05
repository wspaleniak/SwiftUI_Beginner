//
//  FramesExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 28/12/2023.
//

import SwiftUI

struct FramesExample: View {
    var body: some View {
//        Text("Hello world!")
//            .background(.yellow)
//            .frame(
//                width: 200,
//                height: 200,
//                alignment: .leading
//            )
//            .background(.blue)
        
//        Text("Witam świat!")
//            .background(.green)
//            .frame(
//                maxWidth: .infinity,
//                alignment: .leading
//            )
//            .background(.purple)
        
        Text("Helo Elo 420")
            .background(.red)
            .frame(height: 100, alignment: .top)
            .background(.orange)
            .frame(width: 150)
            .background(.purple)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.pink)
            .frame(height: 400)
            .background(.green)
            .frame(maxHeight: .infinity, alignment: .top)
            .background(.yellow)
    }
}

#Preview {
    FramesExample()
}
