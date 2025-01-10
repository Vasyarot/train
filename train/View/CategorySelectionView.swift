// Views/CategorySelectionView.swift
import SwiftUI

struct CategorySelectionView: View {
    @Binding var selectedMainDepot: String?
    let categories: [Category]
    @Binding var selectedCategory: Category?

    var body: some View {
        VStack {
            HStack {
                Text("Основное депо: \(selectedMainDepot ?? "")")
                    .font(.headline)
                    .padding(.top)
                Spacer()
                Button(action: {
                    selectedMainDepot = nil
                }) {
                    Image(systemName: "x.circle.fill")
                        .foregroundColor(.red)
                        .font(.title)
                }
            }
            .padding()

            ForEach(categories) { category in
                Button(action: {
                    selectedCategory = category
                }) {
                    Text(category.name)
                        .font(.title2)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.blue, lineWidth: 2)
                        )
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle("Главное меню")
    }
}
