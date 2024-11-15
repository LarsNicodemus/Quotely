//
//  Unsplash.swift
//  Quotely
//
//  Created by Lars Nicodemus on 14.11.24.
//

import SwiftUI


struct PhotoSearchResponse: Codable {
    let total: Int
    let total_pages: Int
    let results: [Photo]
}

struct Photo: Codable {
    let id: String
    let urls: PhotoURLs
}

struct PhotoURLs: Codable {
    let raw: String
    let full: String
    let regular: String
    let small: String
    let thumb: String
}
