//
//  QuoteRepository.swift
//  Quotely
//
//  Created by Lars Nicodemus on 15.11.24.
//

class QuoteRepository {
    private let baseUrl = "https://api.syntax-institut.de/"

    func fetchCategoryQuotes(category: String) async throws -> [Quote] {
        let response: [Quote] = try await WebService().downloadData(urlString: baseUrl + "quotes?category=\(category)&limit=50")
        return response
    }
    
    func fetchQuote() async throws -> Quote {
        let response: [Quote] = try await WebService().downloadData(
            urlString: baseUrl + "quotes")
        
        return response.first ?? mockQuote1
    }
    
    func fetchAuthors() async throws -> [Author] {
        let response: [Author] = try await WebService().downloadData(urlString: baseUrl + "authors?key=\(APIKEYSyntax)")
        return response
    }
    
    func fetchAuthorQuotes(author: String) async throws -> [Quote] {
        let response: [Quote] = try await WebService().downloadData(urlString: baseUrl + "quotes?author=\(author)&key=\(APIKEYSyntax)&limit=50")
        return response
    }
}
