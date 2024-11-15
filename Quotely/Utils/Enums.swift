//
//  Enums.swift
//  Quotely
//
//  Created by Lars Nicodemus on 13.11.24.
//

import Foundation

enum HTTPError: Error {
    case invalidURL, fetchFailed
    
    var message: String {
        switch self {
        case .invalidURL: "Die URL ist ungültig"
        case .fetchFailed: "Laden ist fehlgeschlagen"
        }
    }
}

enum InspirationCategory: String, CaseIterable {
    case motivation = "motivation"
    case life = "life"
    case love = "love"
    case wisdom = "wisdom"
    case success = "success"
    case happiness = "happiness"
    case courage = "courage"
    case friendship = "friendship"
    case education = "education"
    case future = "future"
    
    var id: String {
        return self.rawValue.capitalized
    }
}
