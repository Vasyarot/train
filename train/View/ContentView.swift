// Views/ContentView.swift
import SwiftUI

struct Category: Identifiable {
    let id = UUID()
    let name: String
}

struct ContentView: View {
    @State private var selectedMainDepot: String? = "Вязьма" // Депо по умолчанию
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
    let allLocomotives = ["ВЛ10У", "ВЛ10 КРП / 2ЭС6", "3ВЛ11", "ВЛ10У СМЕТ", "2М62 / 2ТЭ25КМ", "3М62"]
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
                    } else if selectedCategory?.name == "Таблица расчетов" {
                        // Если выбрана категория "Таблица расчетов", показываем RouteSelectionView
                        RouteSelectionView(
                            selectedMainDepot: $selectedMainDepot,
                            allStations: allStations,
                            allLocomotives: allLocomotives,
                            paths: paths,
                            selectedCategory: $selectedCategory,
                            showTimeTable: $showCalculationsTable,
                            selectedDepartureStation: $selectedDepartureStation,
                            selectedArrivalStation: $selectedArrivalStation,
                            selectedLocomotive: $selectedLocomotive,
                            selectedPath: $selectedPath
                        )
                    } else {
                        // Иначе показываем RouteSelectionView для выбора маршрута
                        RouteSelectionView(
                            selectedMainDepot: $selectedMainDepot,
                            allStations: allStations,
                            allLocomotives: allLocomotives,
                            paths: paths,
                            selectedCategory: $selectedCategory,
                            showTimeTable: $showTimeTable,
                            selectedDepartureStation: $selectedDepartureStation,
                            selectedArrivalStation: $selectedArrivalStation,
                            selectedLocomotive: $selectedLocomotive,
                            selectedPath: $selectedPath
                        )
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
