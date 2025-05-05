//
//  AnyLayoutExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 25/06/2024.
//

import SwiftUI

struct AnyLayoutExample: View {
    
    // MARK: - Properties
    
    @Environment(\.horizontalSizeClass)
    private var horizontalSizeClass
    
    @Environment(\.verticalSizeClass)
    private var verticalSizeClass
    
    // MARK: - Body
    
    var body: some View {
        let layout = if verticalSizeClass == .regular {
            AnyLayout(VStackLayout())
        } else {
            AnyLayout(HStackLayout())
        }
        layout {
            Text("Alpha")
            Text("Beta")
            Text("Gamma")
        }
    }
}

// MARK: - Preview

#Preview {
    AnyLayoutExample()
}
