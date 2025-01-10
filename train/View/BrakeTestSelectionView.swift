// Views/BrakeTestSelectionView.swift
import SwiftUI

struct BrakeTestSelectionView: View {
    @Binding var selectedTrainType: String?
    @Binding var selectedTestType: String?

    var body: some View {
        VStack {
            if selectedTrainType == nil {
                // Выбор типа поезда
                VStack {
                    Text("Выберите тип поезда")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()

                    Button(action: {
                        selectedTrainType = "Грузовая"
                    }) {
                        Text("Грузовая")
                            .font(.title2)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding()

                    Button(action: {
                        selectedTrainType = "Пассажирская"
                    }) {
                        Text("Пассажирская")
                            .font(.title2)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding()
                }
            } else if selectedTestType == nil {
                // Выбор типа пробы
                VStack {
                    Text("Выберите тип пробы")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()

                    Button(action: {
                        selectedTestType = "Основная"
                    }) {
                        Text("Основная")
                            .font(.title2)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding()

                    Button(action: {
                        selectedTestType = "Зимняя"
                    }) {
                        Text("Зимняя")
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
        }
    }
}
