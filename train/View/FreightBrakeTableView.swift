// Views/FreightBrakeTableView.swift
import SwiftUI

struct FreightBrakeTableView: View {
    let selectedStation: String
    let selectedTestType: String

    // Данные для таблицы "Пробы тормозов"
    let brakeTests: [BrakeTest] = [
        // Вязьма – Мещёрская
        BrakeTest(route: "Вязьма – Мещёрская", direction: "Чётное", km: 236, picket: 10, speed: 60, brakingDistance: 850, criticalBrakingDistance: 1150),
        BrakeTest(route: "Вязьма – Мещёрская", direction: "Чётное", km: 236, picket: 10, speed: 50, brakingDistance: 700, criticalBrakingDistance: 1000),

        // Мещёрская – Туманово
        BrakeTest(route: "Мещёрская – Туманово", direction: "Чётное", km: 218, picket: 5, speed: 60, brakingDistance: 700, criticalBrakingDistance: 900),
        BrakeTest(route: "Мещёрская – Туманово", direction: "Чётное", km: 218, picket: 5, speed: 50, brakingDistance: 600, criticalBrakingDistance: 800),

        // Туманово – Гагарин
        BrakeTest(route: "Туманово – Гагарин", direction: "Чётное", km: 203, picket: 8, speed: 60, brakingDistance: 750, criticalBrakingDistance: 950),
        BrakeTest(route: "Туманово – Гагарин", direction: "Чётное", km: 203, picket: 8, speed: 50, brakingDistance: 600, criticalBrakingDistance: 800),

        // Гагарин – Уваровка
        BrakeTest(route: "Гагарин – Уваровка", direction: "Чётное", km: 159, picket: 5, speed: 60, brakingDistance: 700, criticalBrakingDistance: 900),
        BrakeTest(route: "Гагарин – Уваровка", direction: "Чётное", km: 159, picket: 5, speed: 50, brakingDistance: 600, criticalBrakingDistance: 800),

        // Уваровка – Бородино
        BrakeTest(route: "Уваровка – Бородино", direction: "Чётное", km: 135, picket: 10, speed: 60, brakingDistance: 700, criticalBrakingDistance: 900),
        BrakeTest(route: "Уваровка – Бородино", direction: "Чётное", km: 135, picket: 10, speed: 50, brakingDistance: 600, criticalBrakingDistance: 800),

        // Бородино – Можайск
        BrakeTest(route: "Бородино – Можайск", direction: "Чётное", km: 116, picket: 3, speed: 60, brakingDistance: 700, criticalBrakingDistance: 900),
        BrakeTest(route: "Бородино – Можайск", direction: "Чётное", km: 116, picket: 3, speed: 50, brakingDistance: 600, criticalBrakingDistance: 800),

        // Можайск – Дорохово
        BrakeTest(route: "Можайск – Дорохово", direction: "Чётное", km: 104, picket: 5, speed: 60, brakingDistance: 700, criticalBrakingDistance: 900),
        BrakeTest(route: "Можайск – Дорохово", direction: "Чётное", km: 104, picket: 5, speed: 50, brakingDistance: 600, criticalBrakingDistance: 800),

        // Дорохово – Тучково
        BrakeTest(route: "Дорохово – Тучково", direction: "Чётное", km: 85, picket: 5, speed: 60, brakingDistance: 700, criticalBrakingDistance: 900),
        BrakeTest(route: "Дорохово – Тучково", direction: "Чётное", km: 85, picket: 5, speed: 50, brakingDistance: 600, criticalBrakingDistance: 800),

        // Тучково – Кубинка I
        BrakeTest(route: "Тучково – Кубинка I", direction: "Чётное", km: 75, picket: 3, speed: 60, brakingDistance: 800, criticalBrakingDistance: 1100),
        BrakeTest(route: "Тучково – Кубинка I", direction: "Чётное", km: 75, picket: 3, speed: 50, brakingDistance: 700, criticalBrakingDistance: 1000),

        // Кубинка I – Акулово (по 1-му пути)
        BrakeTest(route: "Кубинка I – Акулово", direction: "Нечётное", km: 210, picket: 6, speed: 60, brakingDistance: 800, criticalBrakingDistance: 1100),
        BrakeTest(route: "Кубинка I – Акулово", direction: "Нечётное", km: 210, picket: 6, speed: 50, brakingDistance: 700, criticalBrakingDistance: 1000),
        BrakeTest(route: "Кубинка I – Акулово", direction: "Нечётное", km: 210, picket: 6, speed: 40, brakingDistance: 600, criticalBrakingDistance: 800),

        // Акулово – Пожитково
        BrakeTest(route: "Акулово – Пожитково", direction: "Нечётное", km: 220, picket: 5, speed: 60, brakingDistance: 670, criticalBrakingDistance: 1059),
        BrakeTest(route: "Акулово – Пожитково", direction: "Нечётное", km: 220, picket: 5, speed: 50, brakingDistance: 600, criticalBrakingDistance: 935),
        BrakeTest(route: "Акулово – Пожитково", direction: "Нечётное", km: 220, picket: 5, speed: 40, brakingDistance: 550, criticalBrakingDistance: 792),

        // Бекасово-Вязьма
        BrakeTest(route: "Бекасово, Пожитково – Акулово", direction: "Чётное", km: 225, picket: 8, speed: 60, brakingDistance: 700, criticalBrakingDistance: 1490),
        BrakeTest(route: "Бекасово, Пожитково – Акулово", direction: "Чётное", km: 225, picket: 8, speed: 50, brakingDistance: 650, criticalBrakingDistance: 1242),

        // Кубинка I – Тучково
        BrakeTest(route: "Кубинка I – Тучково", direction: "Нечётное", km: 70, picket: 9, speed: 60, brakingDistance: 700, criticalBrakingDistance: 900),
        BrakeTest(route: "Кубинка I – Тучково", direction: "Нечётное", km: 70, picket: 9, speed: 50, brakingDistance: 600, criticalBrakingDistance: 800),

        // Тучково – Дорохово
        BrakeTest(route: "Тучково – Дорохово", direction: "Нечётное", km: 83, picket: 5, speed: 60, brakingDistance: 700, criticalBrakingDistance: 850),

        // Дорохово – Можайск
        BrakeTest(route: "Дорохово – Можайск", direction: "Нечётное", km: 89, picket: 5, speed: 60, brakingDistance: 650, criticalBrakingDistance: 850),
        BrakeTest(route: "Дорохово – Можайск", direction: "Нечётное", km: 89, picket: 5, speed: 50, brakingDistance: 600, criticalBrakingDistance: 800),

        // Можайск, Бородино – Уваровка
        BrakeTest(route: "Можайск, Бородино – Уваровка", direction: "Нечётное", km: 126, picket: 5, speed: 60, brakingDistance: 700, criticalBrakingDistance: 900),
        BrakeTest(route: "Можайск, Бородино – Уваровка", direction: "Нечётное", km: 126, picket: 5, speed: 50, brakingDistance: 600, criticalBrakingDistance: 800),

        // Уваровка – Гагарин
        BrakeTest(route: "Уваровка – Гагарин", direction: "Нечётное", km: 149, picket: 5, speed: 60, brakingDistance: 750, criticalBrakingDistance: 900),
        BrakeTest(route: "Уваровка – Гагарин", direction: "Нечётное", km: 149, picket: 5, speed: 50, brakingDistance: 650, criticalBrakingDistance: 800),

        // Гагарин – Туманово
        BrakeTest(route: "Гагарин – Туманово", direction: "Нечётное", km: 189, picket: 1, speed: 60, brakingDistance: 700, criticalBrakingDistance: 900),
        BrakeTest(route: "Гагарин – Туманово", direction: "Нечётное", km: 189, picket: 1, speed: 50, brakingDistance: 600, criticalBrakingDistance: 800),

        // Туманово, Мещёрская – Вязьма
        BrakeTest(route: "Туманово, Мещёрская – Вязьма", direction: "Нечётное", km: 227, picket: 5, speed: 60, brakingDistance: 850, criticalBrakingDistance: 1150),
        BrakeTest(route: "Туманово, Мещёрская – Вязьма", direction: "Нечётное", km: 227, picket: 5, speed: 50, brakingDistance: 750, criticalBrakingDistance: 1000),
    ]

    var body: some View {
        VStack {
            Text("Тип пробы: \(selectedTestType)")
                .font(.headline)
                .padding()

            Text("Станция: \(selectedStation)")
                .font(.headline)
                .padding()

            // Таблица с данными
            VStack(spacing: 0) {
                // Заголовок таблицы
                HStack {
                    Text("Маршрут")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.subheadline)
                        .padding(.vertical, 8)
                    
                    Divider()
                        .background(Color.gray)
                        .frame(width: 1, height: 20)
                    
                    Text("Скорость")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.subheadline)
                        .padding(.vertical, 8)
                    
                    Divider()
                        .background(Color.gray)
                        .frame(width: 1, height: 20)
                    
                    Text("Тормозной путь")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .font(.subheadline)
                        .padding(.vertical, 8)
                }
                .padding(.horizontal)
                .background(Color.gray.opacity(0.1))

                // Данные таблицы
                ForEach(brakeTests) { test in
                    HStack {
                        Text(test.route)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical, 8)
                        
                        Divider()
                            .background(Color.gray)
                            .frame(width: 1, height: 20)
                        
                        Text("\(test.speed) км/ч")
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.vertical, 8)
                        
                        Divider()
                            .background(Color.gray)
                            .frame(width: 1, height: 20)
                        
                        Text("\(test.brakingDistance) м")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(.vertical, 8)
                    }
                    .padding(.horizontal)
                    
                    Divider()
                        .background(Color.gray)
                }
            }
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 2)
        }
        .padding()
    }
}
