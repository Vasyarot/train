// Views/BrakeDetailsView.swift
import SwiftUI

struct BrakeDetailsView: View {
    let selectedStation: String
    let selectedDirection: String
    let selectedTrainType: String
    let selectedTestType: String

    var body: some View {
        VStack {
            Text("Станция: \(selectedStation)")
                .font(.headline)
                .padding()

            Text("Направление: \(selectedDirection)")
                .font(.headline)
                .padding()

            Text("Тип поезда: \(selectedTrainType)")
                .font(.headline)
                .padding()

            Text("Тип пробы: \(selectedTestType)")
                .font(.headline)
                .padding()

            // Пример данных для отображения
            if selectedTrainType == "Грузовая" {
                if selectedTestType == "Основная" {
                    Text("Данные для грузовой основной пробы")
                        .font(.title2)
                        .padding()
                } else if selectedTestType == "Зимняя" {
                    Text("Данные для грузовой зимней пробы")
                        .font(.title2)
                        .padding()
                }
            } else if selectedTrainType == "Пассажирская" {
                if selectedTestType == "Основная" {
                    Text("Данные для пассажирской основной пробы")
                        .font(.title2)
                        .padding()
                } else if selectedTestType == "Зимняя" {
                    Text("Данные для пассажирской зимней пробы")
                        .font(.title2)
                        .padding()
                }
            }

            Spacer()
        }
        .padding()
    }
}
