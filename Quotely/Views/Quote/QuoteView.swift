//
//  QuoteView.swift
//  Quotely
//
//  Created by Lars Nicodemus on 11.11.24.
//

import SwiftUI

struct QuoteView: View {
    @State private var showShareSheet = false
    @State private var showSafariView = false
    @State private var safariURL: URL? = nil
    @State private var swipeOffset: CGFloat = 0
    @State private var currentIndex = 0
    @State private var quotesSize = 2
    @State var quotes: [Quote] = []
    @State var qoute: Quote?

    var body: some View {

        VStack {
            Spacer()
            QuotePartView(quote: qoute ?? mockQuote1)
            Spacer()
            HStack {
                Button(action: {
                    if let searchURL = createSearchURL() {
                        safariURL = searchURL
                        showSafariView = true
                    } else {
                        print("Fehler: Die URL ist nil")
                    }
                }) {
                    Text("Info")
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
        .background(QuoteViewBackground(swipeOffset: $swipeOffset))
        .gesture(
            DragGesture()
                .onChanged { value in
                    swipeOffset = value.translation.width
                }
                .onEnded { value in
                    if value.translation.width < -50 {
                        withAnimation {
                            fetchQuote()
                        }
                    } else if value.translation.width > 50 {
                        withAnimation {
                            fetchQuote()
                        }
                    }
                    withAnimation {
                        swipeOffset = 0
                    }
                }
        )
        .sheet(isPresented: $showShareSheet) {
            ShareSheet(
                items: [createShareContent()],
                activities: nil
            )
        }
        .sheet(isPresented: $showSafariView) {
            if safariURL != nil {
                SafariView(url: safariURL!)
            } else {
                let searchQuery = "\(qoute?.author ?? "famous authors")".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                ?? ""
                SafariView(url: URL(string: "https://www.google.com/search?q=\(searchQuery)")!)
            }
        }
        .task {
            fetchQuote()

        }
    }
    func createSearchURL() -> URL? {
        let quoteText = qoute?.text ?? "Beispielzitat"
        let quoteAuthor = qoute?.author ?? "Beispielautor"
        let searchQuery =
            "\(quoteText) \(quoteAuthor)"
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            ?? ""
        let urlString = "https://www.google.com/search?q=\(searchQuery)"
        return URL(string: urlString)
    }

    func createShareContent() -> String {
        let quoteText = qoute?.text ?? "Kein Zitat zum Teilen!"
        let quoteAuthor = qoute?.author ?? "Unbekannter Autor"
        return "\"\(quoteText)\" - \(quoteAuthor)"
    }

    func fetchQuote() {
        Task {
                do {
                    qoute = try await QuoteRepository().fetchQuote()
                    print(qoute ?? mockQuote1)
                } catch let error as HTTPError {
                    print(error.message)
                } catch {
                    print(error)
                }
            }

    }
}

#Preview {
    QuoteView(quotes: [mockQuote1], qoute: mockQuote1)
}
