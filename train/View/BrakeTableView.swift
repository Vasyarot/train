// Views/BrakeTableView.swift
import SwiftUI

struct BrakeTest: Identifiable {
    let id = UUID()
    let route: String
    let km: String
    let speed: String
}

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
