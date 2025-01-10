// Views/MainView.swift
import SwiftUI

struct MainView: View {
    @State private var selectedTab: Int = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            // Экран "Времена" с иконкой паровоза
            ContentView()
                .tabItem {
                    Image(systemName: "train.side.front.car")
                    Text("Времена")
                }
                .tag(0)

            // Экран "Поиск" с иконкой лупы
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Поиск")
                }
                .tag(1)

            // Экран "Настройки"
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Настройки")
                }
                .tag(2)
        }
        .accentColor(.red) // Устанавливаем красный цвет для активной вкладки
    }
}
