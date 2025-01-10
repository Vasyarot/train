// Views/ContentView.swift
import SwiftUI

struct ContentView: View {
    @State private var selectedMainDepot: String? = "Вязьма"
    @State private var selectedCategory: Category? = nil

    let categories = [
        Category(name: "Нормы времени"),
        Category(name: "Проба тормозов"),
        Category(name: "Таблица расчетов")
    ]

    let timeAndCalculationStations = ["Вязьма", "Бекасово", "Ржев", "Вековка", "Рыбное", "Калуга", "Смоленск"]
    let brakeStations = ["Вязьма", "Мещёрская", "Туманово", "Гагарин", "Уваровка", "Бородино", "Можайск", "Дорохово", "Тучково", "Кубинка-1", "Акулово", "Пожитково", "Бекасово"]
    let allLocomotives = ["ВЛ10У", "ВЛ10 КРП, 2ЭС6", "3ВЛ11", "ВЛ10У СМЕТ", "2М62 / 2ТЭ25КМ", "3М62"]
    let paths = ["Деповские пути", "Станционные пути"]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    if selectedMainDepot == nil {
                        StationSelectionView(selectedMainDepot: $selectedMainDepot, allStations: timeAndCalculationStations)
                    } else if selectedCategory == nil {
                        // Отображаем список категорий
                        CategorySelectionView(
                            selectedMainDepot: $selectedMainDepot,
                            categories: categories,
                            selectedCategory: $selectedCategory
                        )
                    } else {
                        // Отображаем выбранную категорию
                        SelectedCategoryView(
                            selectedCategory: $selectedCategory,
                            selectedMainDepot: selectedMainDepot ?? "",
                            timeAndCalculationStations: timeAndCalculationStations,
                            brakeStations: brakeStations,
                            allLocomotives: allLocomotives,
                            paths: paths
                        )
                    }
                }
            }
            .navigationBarTitle("Главное меню", displayMode: .inline)
            .navigationBarItems(leading: Button(action: {
                selectedCategory = nil
            }) {
                Image(systemName: "house.fill")
                    .foregroundColor(.blue)
            })
        }
    }
}
