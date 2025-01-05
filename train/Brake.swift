// Brake.swift
import SwiftUI

// MARK: - Основное View для пробы тормозов

struct BrakeView: View {
    @State private var selectedTestType: String? = nil
    @State private var selectedStation: String? = nil

    // Уникальный список станций для "Пробы тормозов"
    let stations = ["Вязьма", "Мещерская", "Туманово", "Гагарин", "Уваровка", "Бородино", "Можайск", "Дорохово", "Тучково", "Кубинка-1", "Акулово", "Пожитково", "Бекасово-1", "Бекасово", "Вязьма-Новотожская", "Новодугинская", "Сычёвка", "Осуга", "Ржев"]

    var body: some View {
        NavigationView {
            VStack {
                if selectedTestType == nil {
                    // Выбор типа пробы: Основная или Зимняя
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
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .padding()

                        Button(action: {
                            selectedTestType = "Зимняя проба"
                        }) {
                            Text("Зимняя проба")
                                .font(.title2)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .padding()
                    }
                } else if selectedStation == nil {
                    // Выбор станции
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
                    // Отображение таблицы с данными
                    BrakeTableView(selectedStation: selectedStation!, selectedTestType: selectedTestType!)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

// MARK: - Таблица с данными о пробе тормозов

struct BrakeTableView: View {
    let selectedStation: String
    let selectedTestType: String

    // Уникальные данные для таблицы "Пробы тормозов"
    let brakeTests: [BrakeTest] = [
        BrakeTest(route: "Маршрут 1", km: "10 км", speed: "60 км/ч"),
        BrakeTest(route: "Маршрут 2", km: "15 км", speed: "70 км/ч"),
        BrakeTest(route: "Маршрут 3", km: "20 км", speed: "80 км/ч")
    ]

    var body: some View {
        VStack {
            Text("Тип пробы: \(selectedTestType)")
                .font(.headline)
                .padding()

            Text("Станция: \(selectedStation)")
                .font(.headline)
                .padding()

            List {
                Section(header: Text("Данные о пробе тормозов")) {
                    ForEach(brakeTests) { test in
                        HStack {
                            Text(test.route)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text(test.km)
                                .frame(maxWidth: .infinity, alignment: .center)
                            Text(test.speed)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
        }
        .padding()
    }
}

// MARK: - Preview

struct BrakeView_Previews: PreviewProvider {
    static var previews: some View {
        BrakeView()
    }
}
