//
//  QuoteViewBackground.swift
//  Quotely
//
//  Created by Lars Nicodemus on 11.11.24.
//

import SwiftUI

struct QuoteViewBackground: View {
    @Binding var swipeOffset: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color.blue.opacity(0.4),
                                Color.green.opacity(0.4),
                            ]), startPoint: .topLeading,
                            endPoint: .bottomTrailing)
                    )
                    .frame(
                        width: 450, height: 450
                    )
                    .rotationEffect(.degrees(CGFloat(65) + (swipeOffset / 18)))
                    .offset(x: 80 + swipeOffset, y: 100 - swipeOffset / 6)

                Rectangle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color.blue.opacity(0.3),
                                Color.green.opacity(0.4),
                            ]), startPoint: .topLeading,
                            endPoint: .bottomTrailing)
                    )
                    .frame(
                        width: 450, height: 450
                    )
                    .rotationEffect(.degrees(CGFloat(71) + (swipeOffset / 6)))
                    .offset(x: 80 + swipeOffset, y: 100 - swipeOffset / 2)

                Rectangle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color.blue.opacity(0.3),
                                Color.green.opacity(0.4),
                            ]), startPoint: .topLeading,
                            endPoint: .bottomTrailing)
                    )
                    .frame(
                        width: 450, height: 450
                    )
                    .rotationEffect(.degrees(CGFloat(78) + (swipeOffset / 7)))
                    .offset(x: 80 + swipeOffset, y: 100 - swipeOffset / 2)

                Rectangle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color.blue.opacity(0.3),
                                Color.green.opacity(0.4),
                            ]), startPoint: .topLeading,
                            endPoint: .bottomTrailing)
                    )
                    .frame(
                        width: 450, height: 450
                    )
                    .rotationEffect(.degrees(CGFloat(84) + (swipeOffset / 8))) 
                    .offset(x: 80 + swipeOffset, y: 100 - swipeOffset / 2)
            }
        }
    }
}
#Preview {
    QuoteViewBackground(swipeOffset: .constant(CGFloat(0)))
}
