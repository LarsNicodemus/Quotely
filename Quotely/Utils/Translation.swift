//
//  Translation.swift
//  Quotely
//
//  Created by Lars Nicodemus on 15.11.24.
//

let translationMap: [String: String] = [
    "motivation": "Motivation",
    "life": "Leben",
    "love": "Liebe",
    "wisdom": "Weisheit",
    "success": "Erfolg",
    "happiness": "Glück",
    "courage": "Mut",
    "friendship": "Freundschaft",
    "education": "Bildung",
    "future": "Zukunft"
]


func translateCategories(categories: [String]) -> [String]{
    return categories.map { category in
        translationMap[category] ?? category}
}

func translateCategory(_ category: String) -> String {
    return translationMap[category] ?? category
}
