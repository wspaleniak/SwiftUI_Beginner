//
//  SheetsExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 29/01/2024.
//

import SwiftUI

struct SheetsExample: View {
    
    @State private var showSheet: Bool = false
    
    var body: some View {
        VStack {
            Button(action: {
                showSheet.toggle()
            }, label: {
                Text("Show new view")
                    .font(.headline)
                    .foregroundStyle(.yellow)
                    .padding(20)
                    .background(.black)
            })
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.yellow)
        .fullScreenCover(isPresented: $showSheet) {
            SheetsExampleSecondView()
        }
//        .sheet(isPresented: $showSheet) {
//            SheetsExampleSecondView()
//        }
    }
}

// MARK: - Second view
struct SheetsExampleSecondView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            Button(action: {
                dismiss()
            }, label: {
                Image(systemName: "xmark")
                    .font(.title)
                    .foregroundStyle(.black)
                    .padding()
            })
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .topTrailing
        )
        .background(.cyan)
    }
}

// MARK: - Preview
#Preview {
    SheetsExample()
}
