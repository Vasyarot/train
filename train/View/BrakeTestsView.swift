// Views/BrakeTestsView.swift
import SwiftUI

struct BrakeTestsView: View {
    @Binding var selectedBrakeStation: String?
    @Binding var selectedDirection: String?
    @Binding var selectedTrainType: String?
    @Binding var selectedTestType: String?
    let brakeStations: [String]

    var body: some View {
        VStack {
            // Шаг 1: Выбор станции
            if selectedBrakeStation == nil {
                List(brakeStations, id: \.self) { station in
                    Button(action: {
                        selectedBrakeStation = station
                    }) {
                        Text(station)
                            .foregroundColor(.blue)
                            .font(.title2)
                    }
                }
                .navigationTitle("Выберите станцию")
            }
            // Шаг 2: Выбор направления
            else if selectedDirection == nil {
                VStack {
                    Text("Выберите направление")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()

                    Button(action: {
                        selectedDirection = "Чётное"
                    }) {
                        Text("Чётное направление")
                            .font(.title2)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding()

                    Button(action: {
                        selectedDirection = "Нечётное"
                    }) {
                        Text("Нечётное направление")
                            .font(.title2)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding()
                }
            }
            // Шаг 3: Выбор типа поезда и типа пробы
            else if selectedTrainType == nil || selectedTestType == nil {
                BrakeTestSelectionView(
                    selectedTrainType: $selectedTrainType,
                    selectedTestType: $selectedTestType
                )
            }
            // Шаг 4: Отображение результатов
            else {
                BrakeDetailsView(
                    selectedStation: selectedBrakeStation ?? "",
                    selectedDirection: selectedDirection ?? "",
                    selectedTrainType: selectedTrainType ?? "",
                    selectedTestType: selectedTestType ?? ""
                )
            }
        }
    }
}
