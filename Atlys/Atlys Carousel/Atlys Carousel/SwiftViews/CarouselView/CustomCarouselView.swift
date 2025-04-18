//
//  CarouselView.swift
//  Atlys Carousel
//
//  Created by weye on 19/04/25.
//

import SwiftUI

struct CarouselView<Content: View>: View {
    let itemCount: Int
    let content: (Int) -> Content
    @State private var currentIndex: Int = 0

    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: -35) {
                    ForEach(0..<itemCount, id: \.self) { index in
                        CarouselItemView(
                            index: index,
                            currentIndex: $currentIndex,
                            content: content
                        )
                        .zIndex(index == currentIndex ? 1 : 0)
                        .aspectRatio(1, contentMode: .fit)
                    }
                }
                .scrollTargetLayout()
            }
            .contentMargins(30, for: .scrollContent)
            .scrollTargetBehavior(.viewAligned)
            .aspectRatio(1, contentMode: .fit)

            PaginationDotsView(
                itemCount: itemCount,
                currentIndex: currentIndex
            )
            .padding(.top, 8)
        }
    }
}
