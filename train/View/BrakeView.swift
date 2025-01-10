// Views/BrakeView.swift
import SwiftUI

struct BrakeView: View {
    @State private var selectedTestType: String? = nil
    @State private var selectedTrainType: String? = nil
    @State private var selectedStation: String? = nil

    let stations = ["Вязьма", "Мещёрская", "Туманово", "Гагарин", "Уваровка", "Бородино", "Можайск", "Дорохово", "Тучково", "Кубинка-1", "Акулово", "Пожитково", "Бекасово"]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    if selectedTestType == nil {
                        VStack {
                            Text("Выберите тип пробы тормозов")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .padding()

                            Button(action: {
                                selectedTestType = "Основная проба"
                            }) {
                                Text("Основная проба")
                                    .font(.title2)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.black)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.blue, lineWidth: 2)
                                    )
                            }
                            .padding()

                            Button(action: {
                                selectedTestType = "Зимняя проба"
                            }) {
                                Text("Зимняя проба")
                                    .font(.title2)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.black)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.blue, lineWidth: 2)
                                    )
                            }
                            .padding()
                        }
                    } else if selectedTrainType == nil {
                        VStack {
                            Text("Выберите тип поезда")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .padding()

                            Button(action: {
                                selectedTrainType = "Грузовые поезда"
                            }) {
                                Text("Грузовые поезда")
                                    .font(.title2)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.black)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.blue, lineWidth: 2)
                                    )
                            }
                            .padding()

                            Button(action: {
                                selectedTrainType = "Пассажирские поезда"
                            }) {
                                Text("Пассажирские поезда")
                                    .font(.title2)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.black)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.blue, lineWidth: 2)
                                    )
                            }
                            .padding()
                        }
                    } else if selectedStation == nil {
                        VStack {
                            Text("Выберите станцию")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .padding()

                            List(stations, id: \.self) { station in
                                Button(action: {
                                    selectedStation = station
                                }) {
                                    Text(station)
                                        .foregroundColor(.blue)
                                        .font(.title2)
                                }
                            }
                            .navigationTitle("Станции")
                        }
                    } else {
                        if selectedTrainType == "Грузовые поезда" {
                            FreightBrakeTableView(selectedStation: selectedStation!, selectedTestType: selectedTestType!)
                        } else {
                            PassengerBrakeTableView(selectedStation: selectedStation!, selectedTestType: selectedTestType!)
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}
