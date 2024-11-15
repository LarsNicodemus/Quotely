//
//  CategoryDetailView.swift
//  Quotely
//
//  Created by Lars Nicodemus on 12.11.24.
//

import SwiftUI

struct CategoryDetailView: View {
    @Environment(\.dismiss) private var dismiss
    var category: String
    var translatedCategorie: String
    @State var quotes: [Quote] = []
    
    var body: some View {
        VStack {
            ZStack{
                HStack{
                    Button(action:{
                    dismiss()
                  }){
                    Image(systemName:"arrow.left")
                          .font(.system(size: 40))
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
                    Text(translatedCategorie)
                        .font(.system(size: 50))
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
                    CategoryDetailQuote(quoteText: quote.text, quoteAuthor: quote.author)
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
            fetchCategoryQuotes()
        }
    }
    func fetchCategoryQuotes() {
        Task {
                do {
                    quotes = try await QuoteRepository().fetchCategoryQuotes(category: category)
                    print(quotes)
                } catch let error as HTTPError {
                    print(error.message)
                } catch {
                    print(error)
                }
            }
    }
}

#Preview {
    CategoryDetailView(category: "motivation", translatedCategorie: "Glück")
}
