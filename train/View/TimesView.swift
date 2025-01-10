import SwiftUI

struct TimesView: View {
    @Binding var selectedDepartureStation: String?
    @Binding var selectedArrivalStation: String?
    @Binding var selectedLocomotive: String?
    @Binding var selectedPath: String?
    @Binding var showModal: Bool

    let allStations: [String]
    let allLocomotives: [String]
    let paths: [String]

    var body: some View {
        VStack {
            // Выбор станции отправления
            if selectedDepartureStation == nil {
                StationSelectorView(
                    title: "Станция отправления",
                    selectedStation: $selectedDepartureStation,
                    allStations: allStations,
                    excludedStation: selectedArrivalStation,
                    otherSelectedStation: $selectedArrivalStation
                )
            } else {
                HStack {
                    Text("Станция отправления: \(selectedDepartureStation!)")
                        .font(.headline)
                        .padding()
                    Spacer()
                    Button(action: {
                        selectedDepartureStation = nil
                        selectedArrivalStation = nil
                        selectedLocomotive = nil
                        selectedPath = nil
                    }) {
                        Image(systemName: "x.circle.fill")
                            .foregroundColor(.red)
                            .font(.title)
                    }
                }
                .padding()
            }

            // Выбор станции прибытия
            if selectedDepartureStation != nil && selectedArrivalStation == nil {
                StationSelectorView(
                    title: "Станция прибытия",
                    selectedStation: $selectedArrivalStation,
                    allStations: allStations,
                    excludedStation: selectedDepartureStation,
                    otherSelectedStation: $selectedDepartureStation
                )
            } else if selectedArrivalStation != nil {
                HStack {
                    Text("Станция прибытия: \(selectedArrivalStation!)")
                        .font(.headline)
                        .padding()
                    Spacer()
                    Button(action: {
                        selectedArrivalStation = nil
                        selectedLocomotive = nil
                        selectedPath = nil
                    }) {
                        Image(systemName: "x.circle.fill")
                            .foregroundColor(.red)
                            .font(.title)
                    }
                }
                .padding()
            }

            // Выбор локомотива
            if selectedDepartureStation != nil && selectedArrivalStation != nil && selectedLocomotive == nil {
                LocomotiveSelectorView(
                    selectedLocomotive: $selectedLocomotive,
                    allLocomotives: allLocomotives,
                    selectedDepartureStation: selectedDepartureStation,
                    selectedArrivalStation: selectedArrivalStation
                )
            } else if selectedLocomotive != nil {
                HStack {
                    Text("Локомотив: \(selectedLocomotive!)")
                        .font(.headline)
                        .padding()
                    Spacer()
                    Button(action: {
                        selectedLocomotive = nil
                        selectedPath = nil
                    }) {
                        Image(systemName: "x.circle.fill")
                            .foregroundColor(.red)
                            .font(.title)
                    }
                }
                .padding()
            }

            // Выбор пути
            if selectedDepartureStation != nil && selectedArrivalStation != nil && selectedLocomotive != nil && selectedPath == nil {
                PathSelectorView(
                    selectedPath: $selectedPath,
                    paths: paths,
                    showTimeTable: .constant(false)
                )
            } else if selectedPath != nil {
                HStack {
                    Text("Путь: \(selectedPath!)")
                        .font(.headline)
                        .padding()
                    Spacer()
                    Button(action: {
                        selectedPath = nil
                    }) {
                        Image(systemName: "x.circle.fill")
                            .foregroundColor(.red)
                            .font(.title)
                    }
                }
                .padding()
            }

            // Отображение таблицы времени
            if let departure = selectedDepartureStation,
               let arrival = selectedArrivalStation,
               let locomotive = selectedLocomotive,
               let path = selectedPath {
                
                if path == "Деповские пути" {
                    if let route = depotRoutes.first(where: {
                        $0.routeName == "\(departure)-\(arrival)" &&
                        $0.locomotive == locomotive
                    }) {
                        ModalCalculationsView(route: route)
                    } else {
                        Text("Данные для выбранного маршрута и локомотива не найдены.")
                            .font(.headline)
                            .foregroundColor(.red)
                            .padding()
                    }
                } else if path == "Станционные пути" {
                    if let route = stationRoutes.first(where: {
                        $0.routeName == "\(departure)-\(arrival)" &&
                        $0.locomotive == locomotive
                    }) {
                        ModalCalculationsView(route: route)
                    } else {
                        Text("Данные для выбранного маршрута и локомотива не найдены.")
                            .font(.headline)
                            .foregroundColor(.red)
                            .padding()
                    }
                }
            }
        }
        .navigationTitle("Таблица времени")
        .navigationBarTitleDisplayMode(.inline)
    }
}
