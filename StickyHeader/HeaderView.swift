//
//  HeaderView.swift
//  StickyHeader
//
//  Created by Ganesh Prasad on 30/11/24.
//

import SwiftUI

struct HeaderView: View {
    let size: CGSize
    let safeArea: EdgeInsets
    let percentageHeight: CGFloat
    private let minHeight: CGFloat
    
    @State private var progress: CGFloat = 0
    @Binding var contentOffset: CGFloat
    
    init(
        size: CGSize,
        safeArea: EdgeInsets,
        percentageHeight: CGFloat,
        contentOffset: Binding<CGFloat>
    ) {
        self.size = size
        self.safeArea = safeArea
        self.percentageHeight = percentageHeight
        self.minHeight = 60 + safeArea.top
        _contentOffset = contentOffset
    }
    var body: some View {
        ZStack {
            GeometryReader {
                let rect = $0.frame(in: .global)
                Image(.sun)
                    .resizable()
                    .scaledToFill()
                    .frame(
                        width: rect.size.width + (52 - rect.width) * progress,
                        height: rect.size.height + (52 - rect.height) * progress
                    )
                    .clipShape(
                        .rect(cornerRadius: 120 * progress)
                    )
                    .offset(x: 52 * progress, y: (safeArea.top - 4) * progress)
                    .onChange(of: contentOffset) { oldValue, newValue in
                        progress = min(max(-contentOffset / (size.height * percentageHeight - minHeight), 0), 1)
                    }
            }
            
            VStack(alignment: .leading) {
                Spacer()
                Text("Success")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.white)
                Text("iOS Developer")
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .scaleEffect(1 - 0.4 * progress, anchor: .leading)
            .offset(x: 100 * progress)
            .padding(.horizontal)
            .padding(.bottom, max(10 - progress * 100, 0))
            
            VStack {
                HStack(alignment: .top) {
                    Image(systemName: "arrow.left")
                        .imageScale(.large)
                        .foregroundStyle(.white)
                    
                    Spacer()
                }
                .padding(.top, safeArea.top + 12)
                .padding(.leading)
                
                Spacer()
            }
        }
        .frame(height: height())
        .background(
            Rectangle()
                .fill(.ultraThinMaterial)
                .opacity(1 * progress)
        )
        .clipped()
    }
}

extension HeaderView {
    func height() -> CGFloat {
        size.height * percentageHeight + contentOffset < minHeight
        ? minHeight
        : size.height * percentageHeight + contentOffset
    }
}

#Preview {
    ContainerView()
}
