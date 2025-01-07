// Views/ContentView.swift
import SwiftUI

// Определение структуры Category
struct Category: Identifiable {
    let id = UUID()
    let name: String
}

struct ContentView: View {
    @State private var selectedMainDepot: String? = "Вязьма"
    @State private var selectedCategory: Category? = nil
    @State private var showTimeTable = false
    @State private var showCalculationsTable = false

    @State private var selectedDepartureStation: String? = nil
    @State private var selectedArrivalStation: String? = nil
    @State private var selectedLocomotive: String? = nil
    @State private var selectedPath: String? = nil

    // Данные для отображения
    let categories = [
        Category(name: "Нормы времени"),
        Category(name: "Пробы тормозов"),
        Category(name: "Таблица расчетов")
    ]

    let allStations = ["Бекасово", "Вязьма", "Ржев", "Рыбное", "Вековка", "Калуга", "Смоленск"]
    let allLocomotives = ["ВЛ10У", "ВЛ10 КРП, 2ЭС6", "3ВЛ11", "ВЛ10У СМЕТ", "2М62 / 2ТЭ25КМ", "3М62"]
    let paths = ["Деповские пути", "Станционные пути"]

    var body: some View {
        NavigationView {
            VStack {
                if selectedMainDepot == nil {
                    // Если основное депо не выбрано, показываем экран выбора депо
                    StationSelectionView(selectedMainDepot: $selectedMainDepot, allStations: allStations)
                } else if selectedCategory == nil {
                    // Если категория не выбрана, показываем список категорий
                    VStack {
                        HStack {
                            Text("Основное депо: \(selectedMainDepot!)")
                                .font(.headline)
                                .padding(.top)
                            Spacer()
                            Button(action: {
                                self.selectedMainDepot = nil // Сброс выбора депо
                            }) {
                                Image(systemName: "x.circle.fill")
                                    .foregroundColor(.red)
                                    .font(.title)
                            }
                        }
                        .padding()

                        // Список категорий
                        List(categories) { category in
                            Button(action: {
                                selectedCategory = category
                            }) {
                                Text(category.name)
                                    .foregroundColor(.blue)
                                    .font(.title2)
                                    .padding()
                            }
                        }
                        .navigationTitle("Категории")
                    }
                } else {
                    // Если выбрана категория "Пробы тормозов", показываем BrakeView
                    if selectedCategory?.name == "Пробы тормозов" {
                        BrakeView() // Отображаем интерфейс для проверки тормозов
                    } else {
                        // Для категорий "Нормы времени" и "Таблица расчетов"
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
                                // Показываем выбранную станцию отправления с возможностью изменения
                                HStack {
                                    Text("Станция отправления: \(selectedDepartureStation!)")
                                        .font(.headline)
                                        .padding()
                                    Spacer()
                                    Button(action: {
                                        selectedDepartureStation = nil
                                        selectedArrivalStation = nil // Сброс выбора станции прибытия
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
                                // Показываем выбранную станцию прибытия с возможностью изменения
                                HStack {
                                    Text("Станция прибытия: \(selectedArrivalStation!)")
                                        .font(.headline)
                                        .padding()
                                    Spacer()
                                    Button(action: {
                                        selectedArrivalStation = nil
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
                                // Показываем выбранный локомотив с возможностью изменения
                                HStack {
                                    Text("Локомотив: \(selectedLocomotive!)")
                                        .font(.headline)
                                        .padding()
                                    Spacer()
                                    Button(action: {
                                        selectedLocomotive = nil
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
                                    showTimeTable: $showTimeTable
                                )
                            } else if selectedPath != nil {
                                // Показываем выбранный путь с возможностью изменения
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

                            // Кнопка для перехода к таблице времени или расчетов
                            if selectedDepartureStation != nil && selectedArrivalStation != nil && selectedLocomotive != nil && selectedPath != nil {
                                Button(action: {
                                    if selectedCategory?.name == "Нормы времени" {
                                        showTimeTable = true
                                    } else if selectedCategory?.name == "Таблица расчетов" {
                                        showCalculationsTable = true
                                    }
                                }) {
                                    Text("Показать таблицу")
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
            .navigationBarTitle("Главное меню", displayMode: .inline)
            .navigationBarItems(leading: Button(action: {
                // Сброс всех состояний
                selectedCategory = nil
                selectedDepartureStation = nil
                selectedArrivalStation = nil
                selectedLocomotive = nil
                selectedPath = nil
            }) {
                Image(systemName: "house.fill")
                    .foregroundColor(.blue)
            })
            .sheet(isPresented: $showTimeTable) {
                if let selectedPath = selectedPath,
                   let selectedDepartureStation = selectedDepartureStation,
                   let selectedArrivalStation = selectedArrivalStation,
                   let selectedLocomotive = selectedLocomotive {
                    TimesView(
                        selectedPath: selectedPath,
                        selectedDepartureStation: selectedDepartureStation,
                        selectedArrivalStation: selectedArrivalStation,
                        selectedLocomotive: selectedLocomotive
                    )
                } else {
                    Text("Ошибка: Не все данные выбраны")
                        .font(.largeTitle)
                        .padding()
                }
            }
            .sheet(isPresented: $showCalculationsTable) {
                if let selectedPath = selectedPath,
                   let selectedDepartureStation = selectedDepartureStation,
                   let selectedArrivalStation = selectedArrivalStation,
                   let selectedLocomotive = selectedLocomotive {
                    CalculationsView(
                        selectedPath: selectedPath,
                        selectedDepartureStation: selectedDepartureStation,
                        selectedArrivalStation: selectedArrivalStation,
                        selectedLocomotive: selectedLocomotive
                    )
                } else {
                    Text("Ошибка: Не все данные выбраны")
                        .font(.largeTitle)
                        .padding()
                }
            }
        }
    }
}
