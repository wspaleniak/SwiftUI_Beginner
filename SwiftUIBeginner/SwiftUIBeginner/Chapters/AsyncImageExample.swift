//
//  AsyncImageExample.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 09/05/2024.
//

import SwiftUI

// MARK: - View

struct AsyncImageExample: View {
    
    // MARK: - Properties
    
    private let url = URL(string: "https://picsum.photos/500")
    
    // MARK: - Body
    
    var body: some View {
        
        // MARK: OPCJA 1:
        //
        // AsyncImage(
        //     url: url,
        //     content: { image in
        //         image
        //             .resizable()
        //             .scaledToFill()
        //             .frame(width: 300, height: 300)
        //             .clipShape(
        //                 RoundedRectangle(cornerRadius: 25.0)
        //             )
        //     },
        //     placeholder: {
        //         ProgressView()
        //     }
        // )
        
        // MARK: OPCJA 2:
        //
        AsyncImage(
            url: url,
            content: { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 300, height: 300)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 25.0)
                        )
                case .failure(let error):
                    let description = error
                        .localizedDescription
                        .components(separatedBy: ".")
                        .first ?? ""
                    
                    VStack {
                        Image(systemName: "xmark.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70, height: 70)
                            .foregroundStyle(.red)
                        
                        Text(description)
                            .font(.headline)
                            .foregroundStyle(.red)
                    }
                @unknown default:
                    EmptyView()
                }
            }
        )
        
    }
}

// MARK: - Preview

#Preview {
    AsyncImageExample()
}
