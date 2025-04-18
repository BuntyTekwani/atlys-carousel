//
//  CarouselItemView.swift
//  Atlys Carousel
//
//  Created by weye on 19/04/25.
//

import SwiftUI


struct CarouselItemView<Content: View>: View {
    let index: Int
    @Binding var currentIndex: Int
    let content: (Int) -> Content

    var body: some View {
        GeometryReader { geo in
            let frame = geo.frame(in: .global)
            let scale = calculateScale(frame: frame)
            let visibleRatio = calculateVisibleRatio(frame: frame)

            content(index)
                .cornerRadius(20)
                .scaleEffect(scale)
                .onChange(of: frame) { _ in
                    if visibleRatio > 0.5 && currentIndex != index {
                        currentIndex = index
                    }
                }
        }
    }

    private func calculateScale(frame: CGRect) -> CGFloat {
        let screenWidth = UIScreen.main.bounds.width
        let screenCenter = screenWidth / 2
        let midX = frame.midX
        let distance = abs(midX - screenCenter)
        return max(0.9, 1 - (distance / screenWidth) * 0.3)
    }

    private func calculateVisibleRatio(frame: CGRect) -> CGFloat {
        let screenWidth = UIScreen.main.bounds.width
        let visibleMinX = max(frame.minX, 0)
        let visibleMaxX = min(frame.maxX, screenWidth)
        let visibleWidth = max(0, visibleMaxX - visibleMinX)
        return visibleWidth / frame.width
    }
}
