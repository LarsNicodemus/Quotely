//
//  TabView.swift
//  Quotely
//
//  Created by Lars Nicodemus on 11.11.24.
//

import SwiftUI

struct BottomNavView: View {
    var body: some View {
        TabView {
            Tab("DailyQuotes", systemImage: "quote.bubble") {
                QuoteView()
                    .padding(.top, 16)
                    .padding(.horizontal, 16)
            }
            Tab("Category", systemImage: "square.grid.2x2") {
                CategoryView()
                    .padding(.top, 16)
                    .padding(.horizontal, 16)
            }
            Tab("Inspiration", systemImage: "sparkles") {
                InspirationView()
                    .padding(.top, 16)
                    .padding(.horizontal, 16)
            }
            Tab("Author", systemImage: "person.crop.badge.magnifyingglass") {
                AuthorListView()
                    .padding(.top, 16)
                    .padding(.horizontal, 16)
            }
        }
        .tint(.teal)
    }
}

#Preview {
    BottomNavView()
}
