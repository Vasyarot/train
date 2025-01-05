// RouteSelectionView.swift
import SwiftUI

struct RouteSelectionView: View {
    @Binding var selectedMainDepot: String?
    let allStations: [String]
    let allLocomotives: [String]
    let paths: [String]
    @Binding var selectedCategory: Category?
    @Binding var showTimeTable: Bool
    @Binding var selectedDepartureStation: String?
    @Binding var selectedArrivalStation: String?
    @Binding var selectedLocomotive: String?
    @Binding var selectedPath: String?
    let routeTimes: [RouteTime]

    var body: some View {
        VStack {
            Text("Выберите маршрут")
                .font(.largeTitle)
                .padding()

            // Выбор станции отправления
            StationSelectorView(
                title: "Станция отправления",
                selectedStation: $selectedDepartureStation,
                allStations: allStations,
                excludedStation: selectedArrivalStation
            )

            // Выбор станции прибытия
            StationSelectorView(
                title: "Станция прибытия",
                selectedStation: $selectedArrivalStation,
                allStations: allStations,
                excludedStation: selectedDepartureStation
            )

            // Выбор локомотива
            LocomotiveSelectorView(
                selectedLocomotive: $selectedLocomotive,
                allLocomotives: allLocomotives,
                selectedDepartureStation: selectedDepartureStation,
                selectedArrivalStation: selectedArrivalStation
            )

            // Выбор пути
            PathSelectorView(
                selectedPath: $selectedPath,
                paths: paths,
                showTimeTable: $showTimeTable
            )

            // Кнопка для перехода к таблице времени
            Button(action: {
                showTimeTable = true
            }) {
                Text("Показать таблицу времени")
                    .font(.title2)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .padding()
    }
}
