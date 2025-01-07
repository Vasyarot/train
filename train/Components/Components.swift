// Components/Components.swift
import SwiftUI

// MARK: - Компоненты для выбора станции

struct StationSelectionView: View {
    @Binding var selectedMainDepot: String?
    let allStations: [String]
    
    var body: some View {
        VStack {
            Spacer()
            Text("Выберите Основное депо")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            List(allStations, id: \.self) { station in
                Button(action: {
                    selectedMainDepot = station
                }) {
                    Text(station)
                        .foregroundColor(.blue)
                        .font(.title2)
                }
            }
            .navigationTitle("Основное депо")
            Spacer()
        }
    }
}
