//
//  CategoryView.swift
//  Quotely
//
//  Created by Lars Nicodemus on 11.11.24.
//

import SwiftUI

struct CategoryView: View {
    @State var categories: [String] = []
    @State var quotes: [Quote] = []
    
    var body: some View {
        let translatedCategories = translateCategories(categories: categories)
        NavigationStack{
            ScrollView {
                Text("Categories")
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
                Grid {
                    ForEach(
                        Array(stride(from: 0, to: categories.count, by: 2)),
                        id: \.self
                    ) { index in
                        GridRow {
                            ForEach(
                                index..<min(index + 2, categories.count), id: \.self
                            ) { subIndex in
                                NavigationLink(destination: CategoryDetailView(category: categories[subIndex], translatedCategorie: translatedCategories[subIndex]).navigationBarBackButtonHidden(true)){
                                    
                                    GridBox(category: translatedCategories[subIndex])
                                }
                            }
                        }
                    }
                }
            }
            
            .scrollIndicators(.hidden)
            .task{
                fetchCategories()
            }
        }
        

    }
    func fetchCategories() {
        Task {
                do {
                    categories = try await getCategoriesFromAPI()
                    print(categories)
                } catch let error as HTTPError {
                    print(error.message)
                } catch {
                    print(error)
                }
            }

    }
    func getCategoriesFromAPI() async throws -> [String] {
        let urlString = "https://api.syntax-institut.de/categories"
        
        guard let url = URL(string: urlString) else {
            throw HTTPError.invalidURL
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let result = try JSONDecoder().decode([String].self, from: data)
        
        return result
        
    }
    
    
}

#Preview {
    CategoryView()
}
