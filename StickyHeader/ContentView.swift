//
//  ContentView.swift
//  StickyHeader
//
//  Created by Ganesh Prasad on 30/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("SwiftUI: Building Beautiful apps")
                .font(.largeTitle)
            
            Text("SwiftUI uses a declarative syntax, so you can simply state what your user interface should do. For example, you can write that you want a list of items consisting of text fields, then describe alignment, font, and color for each field. Your code is simpler and easier to read than ever before, saving you time and maintenance.")
            
            Text("History of SwiftUI")
                .font(.largeTitle)
            
            Text("SwiftUI uses a declarative syntax, so you can simply state what your user interface should do. For example, you can write that you want a list of items consisting of text fields, then describe alignment, font, and color for each field. Your code is simpler and easier to read than ever before, saving you time and maintenance.")
            
            Text("Why use SwiftUI?")
                .font(.largeTitle)
            
            Text("SwiftUI uses a declarative syntax, so you can simply state what your user interface should do. For example, you can write that you want a list of items consisting of text fields, then describe alignment, font, and color for each field. Your code is simpler and easier to read than ever before, saving you time and maintenance.")
            
            Text("SwiftUI uses a declarative syntax, so you can simply state what your user interface should do. For example, you can write that you want a list of items consisting of text fields, then describe alignment, font, and color for each field. Your code is simpler and easier to read than ever before, saving you time and maintenance.")
        }
        .lineSpacing(6)
        .privacySensitive(true)
        .redacted(reason: .privacy)
    }
}

#Preview {
    ContentView()
}
