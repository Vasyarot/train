// Components/ScrollableContainer.swift
import SwiftUI

struct ScrollableContainer<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        ScrollView {
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
