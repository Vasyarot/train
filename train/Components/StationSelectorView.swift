// Components/StationSelectorView.swift
import SwiftUI

struct StationSelectorView: View {
    let title: String
    @Binding var selectedStation: String?
    let allStations: [String]
    let excludedStation: String?
    @Binding var otherSelectedStation: String?
    var onStationSelected: (String) -> Void = { _ in }

    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
                .padding(.top)

            if let selectedStationValue = selectedStation {
                // Показываем выбранную станцию с возможностью изменения
                HStack {
                    Text(selectedStationValue)
                        .font(.title2)
                        .padding()
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                    Button(action: {
                        selectedStation = nil
                        otherSelectedStation = nil // Сброс выбора в другом списке
                    }) {
                        Image(systemName: "x.circle.fill")
                            .foregroundColor(.red)
                            .font(.title)
                            .padding(.trailing)
                    }
                }
            } else {
                // Показываем список станций для выбора
                ScrollView {
                    ForEach(filteredStations(), id: \.self) { station in
                        Button(action: {
                            selectedStation = station
                            onStationSelected(station)
                            updateOtherStationSelection(station)
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

    // Фильтруем станции, исключая выбранную в другом поле
    func filteredStations() -> [String] {
        if let excludedStation = excludedStation {
            // Если есть исключенная станция, показываем все станции, кроме нее
            return allStations.filter { $0 != excludedStation }
        } else {
            // Если исключенной станции нет, показываем все станции
            return allStations
        }
    }

    // Обновляем выбор в другом поле
    func updateOtherStationSelection(_ selectedStation: String) {
        if selectedStation == "Вязьма" {
            // Если выбрана Вязьма, в другом поле можно выбрать любую станцию, кроме Вязьмы
            otherSelectedStation = nil
        } else {
            // Если выбрана другая станция, в другом поле можно выбрать только Вязьму
            otherSelectedStation = "Вязьма"
        }
    }
}
