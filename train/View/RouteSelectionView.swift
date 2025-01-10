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

    var body: some View {
        ScrollView {
            VStack {
                Text("Выберите маршрут")
                    .font(.largeTitle)
                    .padding()

                StationSelectorView(
                    title: "Станция отправления",
                    selectedStation: $selectedDepartureStation,
                    allStations: allStations,
                    excludedStation: selectedArrivalStation,
                    otherSelectedStation: $selectedArrivalStation
                )

                StationSelectorView(
                    title: "Станция прибытия",
                    selectedStation: $selectedArrivalStation,
                    allStations: allStations,
                    excludedStation: selectedDepartureStation,
                    otherSelectedStation: $selectedDepartureStation
                )

                LocomotiveSelectorView(
                    selectedLocomotive: $selectedLocomotive,
                    allLocomotives: allLocomotives,
                    selectedDepartureStation: selectedDepartureStation,
                    selectedArrivalStation: selectedArrivalStation
                )

                PathSelectorView(
                    selectedPath: $selectedPath,
                    paths: paths,
                    showTimeTable: $showTimeTable
                )

                if selectedDepartureStation != nil && selectedArrivalStation != nil && selectedLocomotive != nil && selectedPath != nil {
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
                } else {
                    Text("Выберите все параметры для отображения таблицы времени")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .padding()
                }
            }
            .padding()
        }
    }
}
