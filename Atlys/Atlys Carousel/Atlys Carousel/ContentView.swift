//
//  ContentView.swift
//  Atlys Carousel
//
//  Created by weye on 19/04/25.
//

import SwiftUI

struct ContentView: View {
    let countries = [
        Country(imageName: "malaysia"),
        Country(imageName: "thailand"),
        Country(imageName: "dubai"),
    ]

    var body: some View {
        CarouselView(itemCount: countries.count) { index in
            Image(countries[index].imageName)
                .resizable()
            
        }
    }
}

#Preview {
    ContentView()
}
