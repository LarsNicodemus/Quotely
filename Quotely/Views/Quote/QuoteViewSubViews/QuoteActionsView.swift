//
//  QuoteActionsView.swift
//  Quotely
//
//  Created by Lars Nicodemus on 11.11.24.
//

import SwiftUI

struct QuoteActionsView: View {
    @Binding var showShareSheet: Bool
    var body: some View {
        HStack{
            Button("Info"){
                
            }
            .buttonStyle(.borderedProminent)
            .tint(.black)
            Image(systemName: "square.and.arrow.up")
                .padding(.leading, 32)
                .onTapGesture {
                    showShareSheet = true
                }
            Spacer()
        }
        Spacer().frame(height: 16)
    }
}

#Preview {
    QuoteActionsView(showShareSheet: .constant(false))
}
