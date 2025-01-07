// Components/LocomotiveSelectorView.swift
import SwiftUI

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

            // Отображение отфильтрованных локомотивов
            ForEach(filteredLocomotives(), id: \.self) { locomotive in
                Button(action: {
                    selectedLocomotive = locomotive // Выбор локомотива
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
            return [] // Если станции не выбраны, возвращаем пустой список
        }

        // Определяем группы станций для разных типов локомотивов
        let stationsForVL = ["Бекасово", "Рыбное", "Вековка"]
        let stationsForM62 = ["Смоленск", "Калуга", "Ржев"]

        // Проверяем, является ли маршрут Вязьма-Ржев или Ржев-Вязьма
        let isVyazmaRzhev = (departure == "Вязьма" && arrival == "Ржев") || (departure == "Ржев" && arrival == "Вязьма")

        if isVyazmaRzhev {
            // Для маршрута Вязьма-Ржев или Ржев-Вязьма показываем только локомотивы 2М62 и 3М62
            return ["2М62 / 2ТЭ25КМ", "3М62"]
        } else if stationsForVL.contains(departure) || stationsForVL.contains(arrival) {
            // Для станций, связанных с ВЛ, показываем локомотивы ВЛ
            return ["ВЛ10У", "ВЛ10 КРП, 2ЭС6", "3ВЛ11", "ВЛ10У СМЕТ"]
        } else if stationsForM62.contains(departure) || stationsForM62.contains(arrival) {
            // Для станций, связанных с М62, показываем только 2М62
            return ["2М62 / 2ТЭ25КМ"]
        } else {
            // Если маршрут не подходит под условия, возвращаем пустой список
            return []
        }
    }
}
