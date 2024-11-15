//
//  InspirationGrid.swift
//  Quotely
//
//  Created by Lars Nicodemus on 12.11.24.
//

import SwiftUI

struct InspirationGrid: View {
    var url: String
    @Binding var preview: Bool
    @Binding var selectedImageIndex: Int
    var currentIndex: Int
    
    var body: some View {
        AsyncImage(url: URL(string: url)) { image in
            image
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .clipShape(
                    RoundedRectangle(cornerRadius: 10)
                )
                
                .onTapGesture {
                    selectedImageIndex = currentIndex
                    withAnimation {
                        preview = true
                    }
                }
                
        } placeholder: {
            ProgressView()
        }
        
    }
}

#Preview {
    InspirationGrid(url: "https://plus.unsplash.com/premium_photo-1663933533712-eef7095f782b?q=80&w=2565&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", preview: .constant(false), selectedImageIndex: .constant(1), currentIndex: 1)
}
