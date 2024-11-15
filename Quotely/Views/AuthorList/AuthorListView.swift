//
//  AuthorListView.swift
//  Quotely
//
//  Created by Lars Nicodemus on 14.11.24.
//

import SwiftUI

struct AuthorListView: View {
    @State var authors: [Author] = []
    @State var quotes: [Quote] = []
    
    var body: some View {
        NavigationStack{
            ScrollView{
                Text("Authors")
                    .foregroundStyle(
                        RadialGradient(
                            colors: [.blue, .purple],
                            center: .topTrailing,
                            startRadius: 0,
                            endRadius: 100
                        )
                    )
                    .font(.system(size: 50))
                    .bold()
                ForEach(authors, id: \.id) { author in
                    NavigationLink(destination: AuthorDetailView(author: author, fetchAuthorQuotes: { fetchAuthorQuotes(author: author.slug) }, quotes: $quotes ).navigationBarBackButtonHidden(true)){
                        
                        VStack {
                            Text(author.name)
                                .font(.system(size: 24))
                                .bold()
                                .foregroundStyle(
                                    RadialGradient(
                                        colors: [.blue, .purple],
                                        center: .center,
                                        startRadius: 0,
                                        endRadius: 100
                                    )
                                )
                        }
                        .frame(height: 80)
                        .frame(maxWidth: .infinity)
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
            }
            .scrollIndicators(.hidden)
        }
        .task {
            fetchAuthors()
        }
    }
    func fetchAuthors() {
        Task {
                do {
                    authors = try await QuoteRepository().fetchAuthors()
                    print(authors)
                } catch let error as HTTPError {
                    print(error.message)
                } catch {
                    print(error)
                }
            }
    }
    func fetchAuthorQuotes(author: String) {
        Task {
                do {
                    quotes = try await QuoteRepository().fetchAuthorQuotes(author: author )
                    print(authors)
                } catch let error as HTTPError {
                    print(error.message)
                } catch {
                    print(error)
                }
            }
    }
}

#Preview {
    AuthorListView()
}
