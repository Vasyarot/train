// Views/BrakeTableView.swift
import SwiftUI

struct BrakeTableView: View {
    let selectedStation: String
    let selectedTestType: String

    // Уникальные данные для таблицы "Пробы тормозов"
    let brakeTests: [BrakeTest] = [
        BrakeTest(route: "Маршрут 1", direction: "Чётное", km: 10, picket: 1, speed: 60, brakingDistance: 850, criticalBrakingDistance: 1150),
        BrakeTest(route: "Маршрут 2", direction: "Чётное", km: 15, picket: 2, speed: 70, brakingDistance: 700, criticalBrakingDistance: 1000),
        BrakeTest(route: "Маршрут 3", direction: "Чётное", km: 20, picket: 3, speed: 80, brakingDistance: 750, criticalBrakingDistance: 950)
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
                            Text("\(test.speed) км/ч")
                                .frame(maxWidth: .infinity, alignment: .center)
                            Text("\(test.brakingDistance) м")
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
