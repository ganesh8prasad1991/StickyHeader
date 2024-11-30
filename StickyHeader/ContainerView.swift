//
//  ContainerView.swift
//  StickyHeader
//
//  Created by Ganesh Prasad on 30/11/24.
//

import SwiftUI

struct ContainerView: View {
    var body: some View {
        GeometryReader {
            DetailsView(
                size: $0.size,
                safeArea: $0.safeAreaInsets,
                percentageHeight: 0.5, content: {
                    ContentView()
                        .padding(.horizontal, 10)
                }
            )
            .ignoresSafeArea(.all, edges: .top)
        }
    }
}

#Preview {
    ContainerView()
}
