// Views/CalculationsView.swift
import SwiftUI

struct CalculationsView: View {
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
                        CalculationsTableView(route: route)
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
                        CalculationsTableView(route: route)
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
        .navigationTitle("Таблица расчетов")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// Структура для отображения таблицы расчетов
struct CalculationsTableView: View {
    let route: Route // Используем протокол Route

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Маршрут: \(route.routeName)")
                .font(.headline)
                .padding(.bottom, 10)

            Text("Локомотив: \(route.locomotive)")
                .font(.subheadline)
                .padding(.bottom, 10)

            // Таблица с временными интервалами
            VStack(spacing: 10) {
                ForEach(route.stages, id: \.name) { stage in
                    HStack {
                        Text(stage.name)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text(stage.time)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.vertical, 4)
                }
            }
            .padding()
        }
        .padding()
    }
}
