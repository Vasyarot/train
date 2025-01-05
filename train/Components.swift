// Components.swift
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

struct StationSelectorView: View {
    let title: String
    @Binding var selectedStation: String?
    let allStations: [String]
    let excludedStation: String?
    var onStationSelected: (String) -> Void = { _ in }

    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
                .padding(.top)
            if let selectedStationValue = selectedStation {
                HStack {
                    Text(selectedStationValue)
                        .font(.title2)
                        .padding()
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                    Button(action: {
                        selectedStation = nil
                    }) {
                        Image(systemName: "x.circle.fill")
                            .foregroundColor(.red)
                            .font(.title)
                            .padding(.trailing)
                    }
                }
            } else {
                ForEach(allStations.filter { $0 != excludedStation }, id: \.self) { station in
                    Button(action: {
                        selectedStation = station
                        onStationSelected(station)
                    }) {
                        Text(station)
                            .foregroundColor(.blue)
                            .font(.title2)
                            .padding()
                    }
                }
            }
        }
    }
}

// MARK: - Компонент для выбора локомотива

struct LocomotiveSelectorView: View {
    @Binding var selectedLocomotive: String?
    let allLocomotives: [String]
    let selectedDepartureStation: String?
    let selectedArrivalStation: String?

    var body: some View {
        VStack(alignment: .leading) {
            Text("Список локомотивов")
                .font(.headline)
                .padding(.top)
            ForEach(filteredLocomotives(), id: \.self) { locomotive in
                Button(action: {
                    selectedLocomotive = locomotive
                }) {
                    HStack {
                        Text(locomotive)
                            .foregroundColor(.blue)
                            .font(.title2)
                        Spacer()
                        if selectedLocomotive == locomotive {
                            Image(systemName: "checkmark")
                                .foregroundColor(.blue)
                        }
                    }
                    .padding()
                }
            }
        }
    }

    /// Фильтрует локомотивы на основе выбранных станций.
    func filteredLocomotives() -> [String] {
        guard let departure = selectedDepartureStation, let arrival = selectedArrivalStation else {
            return []
        }

        let stationsForVL = ["Бекасово", "Рыбное", "Вековка"]
        let stationsForM62 = ["Смоленск", "Калуга", "Ржев"]

        // Определяем, является ли маршрут Вязьма-Ржев или Ржев-Вязьма
        let isVyazmaRzhev = (departure == "Вязьма" && arrival == "Ржев") || (departure == "Ржев" && arrival == "Вязьма")

        if isVyazmaRzhev {
            return ["2М62 / 2ТЭ25КМ", "3М62"] // Показываем оба локомотива для Вязьма-Ржев и Ржев-Вязьма
        } else if stationsForVL.contains(departure) || stationsForVL.contains(arrival) {
            return ["ВЛ10У", "ВЛ10 КРП / 2ЭС6", "3ВЛ11", "ВЛ10У СМЕТ"]
        } else if stationsForM62.contains(departure) || stationsForM62.contains(arrival) {
            return ["2М62 / 2ТЭ25КМ"] // Для остальных маршрутов показываем только 2М62 / 2ТЭ25КМ
        } else {
            return []
        }
    }
}

// MARK: - Компонент для выбора пути

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
