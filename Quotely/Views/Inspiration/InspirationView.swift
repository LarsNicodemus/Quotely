//
//  InspirationView.swift
//  Quotely
//
//  Created by Lars Nicodemus on 11.11.24.
//

import SwiftUI

struct InspirationView: View {
    @State private var swipeOffset: CGFloat = 0
    @State private var swipeOffsetText: CGFloat = 0
    @State private var currentIndex = 0
    @State private var preview = false
    @State private var selectedImageIndex = 0
    @State private var selectedQueryIndex = 0
    @State private var response: PhotoSearchResponse?
    private var queryList =
        [
            "motivation",
            "life",
            "love",
            "wisdom",
            "success",
            "happiness",
            "courage",
            "friendship",
            "education",
            "future"
        ]
    @State private var query = "motivation"
    @State var photoStrings: [String] = []
    @State var photoStringsPreview: [String] = []
    let columns = [

        GridItem(.flexible())
    ]
    
    var body: some View {

        ZStack {
            ScrollView {
                Text(translateCategory(queryList[selectedQueryIndex]))
                    .foregroundStyle(
                        RadialGradient(
                            colors: [.blue, .purple],
                            center: .topTrailing,
                            startRadius: 0,
                            endRadius: 100
                        )
                    )
                    .font(.system(size: 50))
                    .bold()
                    .rotationEffect(.degrees(CGFloat(0) + (swipeOffsetText / 50)))
                    .offset(x: 0 + swipeOffsetText, y: 0 - swipeOffsetText / 20)
                    .gesture(
                                    DragGesture()
                                        .onChanged { value in
                                            swipeOffsetText = value.translation.width
                                        }
                                        .onEnded { value in
                                            if value.translation.width < -100 && selectedQueryIndex < queryList.count - 1 {
                                                withAnimation(.easeInOut(duration: 0.1)) {
                                                    selectedQueryIndex += 1
                                                }
                                                query = queryList[selectedQueryIndex]
                                                loadPictures()
                                            } else if value.translation.width > 100 && selectedQueryIndex > 0 {
                                                withAnimation(.easeInOut(duration: 0.1)) {
                                                    selectedQueryIndex -= 1
                                                }
                                                query = queryList[selectedQueryIndex]
                                                loadPictures()
                                            }

                                            withAnimation(.easeOut(duration: 0.3)) {
                                                swipeOffsetText = 0
                                            }
                                        }
                                )
                                .animation(.easeInOut(duration: 0.1), value: swipeOffsetText)
                let evenIndices = Array(
                    stride(from: 0, to: photoStrings.count, by: 2))
                let oddIndices = Array(
                    stride(from: 1, to: photoStrings.count, by: 2))

                VStack {
                    HStack(alignment: .top) {
                        LazyVGrid(columns: columns, spacing: 10) {
                            ForEach(evenIndices, id: \.self) { index in
                                InspirationGrid(
                                    url: photoStrings[index],
                                    preview: $preview,
                                    selectedImageIndex: $selectedImageIndex,
                                    currentIndex: index
                                )
                            }
                        }
                        .padding(.vertical, 16)

                        LazyVGrid(columns: columns, spacing: 10) {
                            ForEach(oddIndices, id: \.self) { index in
                                InspirationGrid(
                                    url: photoStrings[index],
                                    preview: $preview,
                                    selectedImageIndex: $selectedImageIndex,
                                    currentIndex: index
                                )
                            }
                        }
                        .padding(.vertical, 16)
                    }
                }
            }
            .scrollIndicators(.hidden)
            VStack {
                if preview {
                    ZStack{
                        Color.black.opacity(0.3)
                                .edgesIgnoringSafeArea(.all)
                                .onTapGesture {
                                    withAnimation(Animation.easeInOut(duration: 0.9)) {
                                        preview = false
                                    }
                                }
                        AsyncImage(
                            url: URL(string: photoStrings[selectedImageIndex])
                        ) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .clipShape(
                                    RoundedRectangle(cornerRadius: 10)
                                )
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .onTapGesture {
                                    selectedImageIndex = currentIndex
                                    withAnimation {
                                        preview = false
                                    }
                                }
                        } placeholder: {
                            ProgressView()
                        }

                        .onTapGesture {
                            withAnimation(Animation.easeInOut(duration: 0.4)) {
                                preview.toggle()
                            }
                        }
                        .rotationEffect(.degrees(CGFloat(0) + (swipeOffset / 18)))
                        .offset(x: 0 + swipeOffset, y: 0 - swipeOffset / 6)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    swipeOffset = value.translation.width
                                }
                                .onEnded { value in
                                    if value.translation.width < -100
                                        && selectedImageIndex < photoStrings.count
                                            - 1
                                    {
                                        withAnimation {
                                            selectedImageIndex += 1
                                        }
                                    } else if value.translation.width > 100
                                        && selectedImageIndex > 0
                                    {
                                        withAnimation {
                                            selectedImageIndex -= 1
                                        }
                                    }
                                    withAnimation {
                                        swipeOffset = 0
                                    }
                                }
                        )
                    }
                }
            }
        }
        .onAppear() {
            loadPictures()
        }
    }

    func loadPictures() {
        Task {
            do {
                let response = try await UnsplashRepository().fetchSearchRequest(query: query, page: 1, perPage: 20)
                photoStrings = response.results.map { $0.urls.regular }
            } catch {
                print(error)
            }
        }
    }
}

#Preview {
    InspirationView()
}
