//
//  DetailsView.swift
//  StickyHeader
//
//  Created by Ganesh Prasad on 30/11/24.
//

import SwiftUI

struct ContentOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
}

struct DetailsView<Content: View>: View {
    let size: CGSize
    let safeArea: EdgeInsets
    var percentageHeight: CGFloat
    @State private var contentOffset: CGFloat = .zero
    let content: Content
    
    init(
        size: CGSize,
        safeArea: EdgeInsets,
        percentageHeight: CGFloat,
        @ViewBuilder content: () -> Content
    ) {
        self.size = size
        self.safeArea = safeArea
        self.percentageHeight = percentageHeight
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            VStack {
                ScrollView {
                    content
                        .padding(.top, size.height * percentageHeight + 14)
                        .background {
                            GeometryReader { geo in
                                Color.clear
                                    .preference(
                                        key: ContentOffsetKey.self,
                                        value: geo.frame(in: .named("scrollView")).minY
                                    )
                            }
                        }
                }
                .scrollIndicators(.hidden)
                .coordinateSpace(name: "scrollView")
                .onPreferenceChange(ContentOffsetKey.self) { value in
                    self.contentOffset = value
                }
            }
            
            VStack {
                HeaderView(
                    size: size,
                    safeArea: safeArea,
                    percentageHeight: percentageHeight,
                    contentOffset: $contentOffset
                )
                Spacer()
            }
        }
    }
}

#Preview {
    ContainerView()
}
