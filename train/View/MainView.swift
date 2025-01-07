// Views/MainView.swift
import SwiftUI

struct MainView: View {
    @State private var selectedTab: Int = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            // Экран "Времена" с иконкой паровоза
            ContentView() // ContentView не требует параметров
                .tabItem {
                    Image(systemName: "train.side.front.car") // Иконка паровоза
                        .renderingMode(.template) // Позволяет изменить цвет иконки
                        .foregroundColor(.red) // Красный цвет в стиле РЖД
                    Text("Времена") // Подпись
                        .foregroundColor(.red) // Красный цвет текста
                }
                .tag(0)

            // Экран "Настройки"
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape.fill") // Иконка настроек
                    Text("Настройки") // Подпись
                }
                .tag(1)
        }
        .accentColor(.red) // Устанавливаем красный цвет для активной вкладки
    }
}
