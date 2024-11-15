//
//  QuotePartView.swift
//  Quotely
//
//  Created by Lars Nicodemus on 11.11.24.
//

import SwiftUI

struct QuotePartView: View {
    var quote: Quote?
    var body: some View {
        VStack{
            Text("\"  ")
                .foregroundColor(.gray)
                .font(.system(size: 50))
                .italic()
                .bold()
            + Text(quote?.text ?? mockQuote1.text)
                .font(.system(size: 30))
                .italic()
                .bold()
        }
        .frame(width: 350)
        Spacer().frame(height: 80)
        HStack {
            
            Text(quote?.author ?? mockQuote1.author)
                .foregroundColor(.gray)
            Spacer()
        }
    }
}

#Preview {
    QuotePartView()
}
