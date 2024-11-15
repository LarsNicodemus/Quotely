//
//  UnsplashRepository.swift
//  Quotely
//
//  Created by Lars Nicodemus on 15.11.24.
//

class UnsplashRepository {
    private let baseUrl = "https://api.unsplash.com"
    
    func fetchSearchRequest(query: String,page: Int,perPage: Int) async throws -> PhotoSearchResponse {
        let headers = [
            "Authorization": "Client-ID \(APIKEYUnsplash)",
            "Accept": "application/json",
        ]
        let response: PhotoSearchResponse = try await WebService().downloadDataWithHeader(urlString: baseUrl + "/search/photos?query=\(query)&page=\(page)&per_page=\(perPage)", headers: headers)
        return response
    }
}
