// Views/SelectedCategoryView.swift
import SwiftUI

struct SelectedCategoryView: View {
    @Binding var selectedCategory: Category?
    let selectedMainDepot: String
    let timeAndCalculationStations: [String]
    let brakeStations: [String]
    let allLocomotives: [String]
    let paths: [String]

    @State private var selectedBrakeStation: String? = nil
    @State private var selectedDirection: String? = nil
    @State private var selectedTrainType: String? = nil
    @State private var selectedTestType: String? = nil

    var body: some View {
        VStack {
            Text(selectedCategory?.name ?? "")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()

            if selectedCategory?.name == "Проба тормозов" {
                BrakeTestsView(
                    selectedBrakeStation: $selectedBrakeStation,
                    selectedDirection: $selectedDirection,
                    selectedTrainType: $selectedTrainType,
                    selectedTestType: $selectedTestType,
                    brakeStations: brakeStations
                )
            } else if selectedCategory?.name == "Нормы времени" {
                // Остальной код для других категорий
            }
        }
        .onChange(of: selectedCategory) { _ in
            resetStates()
        }
    }

    private func resetStates() {
        selectedBrakeStation = nil
        selectedDirection = nil
        selectedTrainType = nil
        selectedTestType = nil
    }
}
