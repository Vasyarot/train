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

    func filteredLocomotives() -> [String] {
        guard let departure = selectedDepartureStation, let arrival = selectedArrivalStation else {
            return []
        }

        let stationsForVL = ["Бекасово", "Рыбное", "Вековка"]
        let stationsForM62 = ["Смоленск", "Калуга", "Ржев"]

        let isVyazmaRzhev = (departure == "Вязьма" && arrival == "Ржев") || (departure == "Ржев" && arrival == "Вязьма")

        if isVyazmaRzhev {
            return ["2М62 / 2ТЭ25КМ", "3М62"]
        } else if stationsForVL.contains(departure) || stationsForVL.contains(arrival) {
            return ["ВЛ10У", "ВЛ10 КРП / 2ЭС6", "3ВЛ11", "ВЛ10У СМЕТ"]
        } else if stationsForM62.contains(departure) || stationsForM62.contains(arrival) {
            return ["2М62 / 2ТЭ25КМ"]
        } else {
            return []
        }
    }
}
