//
//  PopoverModifierExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 23/06/2024.
//

import SwiftUI

struct PopoverModifierExample: View {
    
    // MARK: - Properties
    
    private let options: [String] = [
        "Option 1", "Option 2", "Option 3", "Option 4"
    ]
    
    @State private var showPopover: Bool = false
    
    // MARK: - Body
    
    var body: some View {
        Button("Options") {
            showPopover.toggle()
        }
        .padding()
        .foregroundStyle(.white)
        .background(Capsule().fill(.indigo))
        .popover(
            isPresented: $showPopover,
            attachmentAnchor: .point(.top)
        ) {
            ScrollView {
                VStack(spacing: 12) {
                    ForEach(options, id: \.self) { option in
                        Button(option) {
                            showPopover.toggle()
                            // + action...
                        }
                        if option != options.last {
                            Divider()
                        }
                    }
                }
                .padding()
            }
            .presentationCompactAdaptation(.popover)
        }
    }
}

// MARK: - Preview

#Preview {
    PopoverModifierExample()
}
