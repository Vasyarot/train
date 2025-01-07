import SwiftUI

struct BrakeView: View {
    @State private var selectedTestType: String? = nil
    @State private var selectedStation: String? = nil

    // Уникальный список станций для "Пробы тормозов"
    let stations = ["Вязьма", "Мещерская", "Туманово", "Гагарин", "Уваровка", "Бородино", "Можайск", "Дорохово", "Тучково", "Кубинка-1", "Акулово", "Пожитково", "Бекасово-1", "Бекасово", "Вязьма-Новотожская", "Новодугинская", "Сычёвка", "Осуга", "Ржев"]

    var body: some View {
        NavigationView {
            ScrollView {
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
}
