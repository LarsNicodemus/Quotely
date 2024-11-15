//
//  QuoteResponse.swift
//  Quotely
//
//  Created by Lars Nicodemus on 13.11.24.
//

import SwiftUI

struct QuoteResponse: Decodable {
    let quotes: [Quote]
}
struct CategoryResponse: Decodable {
    var categories: [String]
}

