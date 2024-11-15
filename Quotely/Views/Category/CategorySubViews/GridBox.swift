//
//  GridBox.swift
//  Quotely
//
//  Created by Lars Nicodemus on 11.11.24.
//

import SwiftUI

struct GridBox: View {
    
    var category: String
    var body: some View {
        VStack {
            Text(category)
                .font(.system(size: 24))
                .bold()
                .foregroundStyle(
                    RadialGradient(
                        colors: [.blue, .purple],
                        center: .center,
                        startRadius: 0,
                        endRadius: 100
                    )
                )
        }
        .frame(width: 180, height: 180)
        .background(
            RoundedRectangle(cornerRadius: 10).fill(
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color.blue.opacity(0.4),
                        Color.green.opacity(0.4),
                    ]), startPoint: .topLeading,
                    endPoint: .bottomTrailing)))
    }
}

#Preview {
    GridBox(category: "motivation")
}
