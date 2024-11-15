//
//  Quote.swift
//  Quotely
//
//  Created by Lars Nicodemus on 11.11.24.
//
import SwiftUI

struct Quote: Identifiable, Codable {
    let id: String
    let text: String
    let author: String
    let category: String
    let language: String
}
