//
//  APIKEY.swift
//  Quotely
//
//  Created by Lars Nicodemus on 14.11.24.
//

import SwiftUI

var APIKEYSyntax: String {
    
    guard let filePath = Bundle.main.path(forResource: "config", ofType: "plist") else {
        return ""
    }
    
    let plist = NSDictionary(contentsOfFile: filePath)
    
    guard let apiKey = plist?.object(forKey: "API_KEY") as? String else {
        return ""
    }
    return apiKey
}

var APIKEYUnsplash: String {
    
    guard let filePath = Bundle.main.path(forResource: "config", ofType: "plist") else {
        return ""
    }
    
    let plist = NSDictionary(contentsOfFile: filePath)
    
    guard let apiKey = plist?.object(forKey: "API_KEY_UNSPLASH") as? String else {
        return ""
    }
    return apiKey
}


