// Components/PathSelectorView.swift
import SwiftUI

struct PathSelectorView: View {
    @Binding var selectedPath: String?
    let paths: [String]
    @Binding var showTimeTable: Bool

    var body: some View {
        VStack(alignment: .leading) {
            Text("Список путей")
                .font(.headline)
                .padding(.top)

            ForEach(paths, id: \.self) { path in
                Button(action: {
                    selectedPath = path
                }) {
                    HStack {
                        Text(path)
                            .foregroundColor(.blue)
                            .font(.title2)
                        Spacer()
                        if selectedPath == path {
                            Image(systemName: "checkmark")
                                .foregroundColor(.blue)
                        }
                    }
                    .padding()
                }
            }
        }
    }
}
