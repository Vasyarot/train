// Main.swift
import SwiftUI

// MARK: - Основное View с TabBar

struct MainView: View {
    @State private var selectedTab: Int = 0 // Для управления TabBar

    var body: some View {
        // Таб-бар должен быть корневым элементом
        TabView(selection: $selectedTab) {
            // Вкладка "Домой"
            ContentView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Домой")
                }
                .tag(0)

            // Вкладка "Настройки"
            SettingsView() // Используем SettingsView из SettingsView.swift
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Настройки")
                }
                .tag(1)
        }
    }
}

// MARK: - Основной ContentView

struct ContentView: View {
    @State private var selectedMainDepot: String? = "Вязьма"
    @State private var selectedCategory: Category? = nil
    @State private var showTimeTable = false

    @State private var selectedDepartureStation: String? = nil
    @State private var selectedArrivalStation: String? = nil
    @State private var selectedLocomotive: String? = nil
    @State private var selectedPath: String? = nil

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
                                self.selectedMainDepot = nil
                            }) {
                                Image(systemName: "x.circle.fill")
                                    .foregroundColor(.red)
                                    .font(.title)
                            }
                        }
                        .padding()

                        // Список категорий
                        List(categories, id: \.id) { category in
                            Button(action: {
                                selectedCategory = category
                            }) {
                                Text(category.name)
                                    .foregroundColor(.blue)
                                    .font(.title2)
                            }
                        }
                        .navigationTitle("Категории")

                        // Кнопка для перехода к таблице расчетов
                        Button(action: {
                            selectedCategory = Category(name: "Таблица расчетов")
                        }) {
                            Text("Таблица расчетов")
                                .font(.title2)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .padding()
                    }
                } else {
                    // Если выбрана категория "Пробы тормозов", показываем BrakeView
                    if selectedCategory?.name == "Пробы тормозов" {
                        BrakeView() // Отображаем интерфейс для проверки тормозов
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
                            selectedPath: $selectedPath,
                            routeTimes: selectedPath == "Деповские пути" ? depotRoutes : stationRoutes
                        )
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .sheet(isPresented: $showTimeTable) {
                // Показываем таблицу времени, если все данные выбраны
                if let selectedPath = selectedPath,
                   let selectedDepartureStation = selectedDepartureStation,
                   let selectedArrivalStation = selectedArrivalStation,
                   let selectedLocomotive = selectedLocomotive {
                    TimesView(
                        selectedPath: selectedPath,
                        selectedDepartureStation: selectedDepartureStation,
                        selectedArrivalStation: selectedArrivalStation,
                        selectedLocomotive: selectedLocomotive,
                        routeTimes: selectedPath == "Деповские пути" ? depotRoutes : stationRoutes
                    )
                } else {
                    // Если данные не выбраны, показываем ошибку
                    Text("Ошибка: Не все данные выбраны")
                        .font(.largeTitle)
                        .padding()
                }
            }
        }
    }
}

// MARK: - Preview

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
