//
//  PaginationDotsView.swift
//  Atlys Carousel
//
//  Created by weye on 19/04/25.
//

import SwiftUI

struct PaginationDotsView: View {
    let itemCount: Int
    let currentIndex: Int

    var body: some View {
        HStack(spacing: 10) {
            ForEach(0..<itemCount, id: \.self) { index in
                Circle()
                    .fill(index == currentIndex ? Color.primary : Color.gray.opacity(0.3))
                    .frame(width: 10, height: 10)
            }
        }
    }
}
