// Views/TimesView.swift
import SwiftUI

struct TimesView: View {
    let selectedPath: String
    let selectedDepartureStation: String
    let selectedArrivalStation: String
    let selectedLocomotive: String

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                if selectedPath == "Деповские пути" {
                    if let route = depotRoutes.first(where: {
                        $0.routeName == "\(selectedDepartureStation)-\(selectedArrivalStation)" &&
                        $0.locomotive == selectedLocomotive
                    }) {
                        TimesTableView(route: route)
                    } else {
                        Text("Данные для выбранного маршрута и локомотива не найдены.")
                            .font(.headline)
                            .foregroundColor(.red)
                            .padding()
                    }
                } else if selectedPath == "Станционные пути" {
                    if let route = stationRoutes.first(where: {
                        $0.routeName == "\(selectedDepartureStation)-\(selectedArrivalStation)" &&
                        $0.locomotive == selectedLocomotive
                    }) {
                        StationTimesTableView(route: route)
                    } else {
                        Text("Данные для выбранного маршрута и локомотива не найдены.")
                            .font(.headline)
                            .foregroundColor(.red)
                            .padding()
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Таблица времени")
        .navigationBarTitleDisplayMode(.inline)
    }
}
