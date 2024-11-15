//
//  AuthorDetailView.swift
//  Quotely
//
//  Created by Lars Nicodemus on 14.11.24.
//

import SwiftUI

struct AuthorDetailView: View {
    @Environment(\.dismiss) private var dismiss
    var author: Author?
    let fetchAuthorQuotes: () -> Void
    @Binding var quotes: [Quote]
    var body: some View {
        VStack {
            ZStack{
                HStack{
                    Button(action:{
                    dismiss()
                  }){
                    Image(systemName:"arrow.left")
                          .font(.system(size: 35))
                          .bold()
                          .foregroundStyle(
                              RadialGradient(
                                  colors: [.blue, .purple],
                                  center: .leading,
                                  startRadius: 0,
                                  endRadius: 100
                              )
                          )
                      
                  }
                
                    Spacer()
                    Text(author?.name ?? "Kein Author gefunden")
                        .font(.system(size: 35))
                        .bold()
                        .foregroundStyle(
                            RadialGradient(
                                colors: [.blue, .purple],
                                center: .center,
                                startRadius: 0,
                                endRadius: 100
                            )
                        )
                    Spacer()
                }
            }
            List {
                ForEach(quotes) { quote in
                    CategoryDetailQuote(
                        quoteText: quote.text, quoteAuthor: quote.author
                    )
                    
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                    
                    .clipShape(
                        RoundedRectangle(cornerRadius: 8)
                    )
                    .padding(.horizontal, -16)
                }

            }
            .scrollIndicators(.hidden)
            .listStyle(.plain)
        }

        .task {
            fetchAuthorQuotes()
        }
    }
}

