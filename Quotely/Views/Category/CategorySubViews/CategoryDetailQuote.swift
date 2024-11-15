//
//  CategoryDetailQuote.swift
//  Quotely
//
//  Created by Lars Nicodemus on 12.11.24.
//

import SwiftUI

struct CategoryDetailQuote: View {
    var quoteText: String
    var quoteAuthor: String
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(
                    quoteText
                )
                .font(.system(size: 20))
                Spacer()
            }
            Text(quoteAuthor)
                .font(.system(size: 12))
                .padding(.top, 12)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10).fill(
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color.blue.opacity(0.4),
                        Color.green.opacity(0.4),
                    ]), startPoint: .topLeading,
                    endPoint: .bottomTrailing)))
    }
}

#Preview {
    CategoryDetailQuote(quoteText: "Test Text des Zitats", quoteAuthor: "Autor")
}
