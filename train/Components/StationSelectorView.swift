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
        return allStations.filter { $0 != excludedStation }
    }

    // Обновляем выбор в другом поле
    func updateOtherStationSelection(_ selectedStation: String) {
        if selectedStation == "Вязьма" {
            // Если выбрана Вязьма, в другом поле она исчезает
            otherSelectedStation = nil
        } else if otherSelectedStation == nil {
            // Если в другом поле ничего не выбрано, выбираем Вязьма
            otherSelectedStation = "Вязьма"
        }

        // Блокировка несовместимых станций
        let group1 = ["Смоленск", "Ржев", "Калуга"]
        let group2 = ["Бекасово", "Рыбное", "Вековка"]

        if group1.contains(selectedStation) {
            // Если выбрана станция из группы 1, блокируем станции из группы 2
            if let otherStation = otherSelectedStation, group2.contains(otherStation) {
                self.otherSelectedStation = nil
            }
        } else if group2.contains(selectedStation) {
            // Если выбрана станция из группы 2, блокируем станции из группы 1
            if let otherStation = otherSelectedStation, group1.contains(otherStation) {
                self.otherSelectedStation = nil
            }
        }
    }
}
