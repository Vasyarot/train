// DataModels.swift
import SwiftUI

// MARK: - Модели данных

struct StageTime: Identifiable {
    let id = UUID()
    let stageName: String
    let duration: String // Время в минутах или текст (например, "Ходом" или "Парк А,Г-30")
    let isKpHodom: Bool // Флаг для этапа "КП ходом"
}

struct RouteTime: Identifiable {
    let id = UUID()
    let departureStation: String
    let arrivalStation: String
    let locomotive: String
    let path: String // "Деповские пути" или "Станционные пути"
    let stages: [StageTime] // Этапы отправления
    let afterKpStages: [StageTime] // Этапы прибытия
}

struct Category: Identifiable {
    let id = UUID()
    let name: String
}

struct BrakeTest: Identifiable {
    let id = UUID()
    let route: String
    let km: String
    let speed: String
}

// MARK: - Данные

let allStations = ["Бекасово", "Вязьма", "Ржев", "Рыбное", "Вековка", "Калуга", "Смоленск"]
let allLocomotives = ["ВЛ10У", "ВЛ10 КРП / 2ЭС6", "3ВЛ11", "ВЛ10У СМЕТ", "2М62 / 2ТЭ25КМ", "3М62"]
let paths = ["Деповские пути", "Станционные пути"]
let categories = [
    Category(name: "Нормы времени"),
    Category(name: "Пробы тормозов")
]

// Данные для деповских путей
let depotRoutes: [RouteTime] = [
    // Пример маршрута
    RouteTime(
        departureStation: "Вязьма",
        arrivalStation: "Бекасово",
        locomotive: "ВЛ10У",
        path: "Деповские пути",
        stages: [
            StageTime(stageName: "От явки до начала приёмки", duration: "23", isKpHodom: false),
            StageTime(stageName: "От начала приёмки до окончания приёмки", duration: "16", isKpHodom: false),
            StageTime(stageName: "От окончания приёмки до КП", duration: "8", isKpHodom: false),
            StageTime(stageName: "От КП до отправления", duration: "58", isKpHodom: false)
        ],
        afterKpStages: [
            StageTime(stageName: "От прибытия до КП", duration: "47", isKpHodom: false),
            StageTime(stageName: "От КП до начала сдачи локомотива", duration: "6", isKpHodom: false),
            StageTime(stageName: "От начала сдачи до окончания сдачи локомотива", duration: "16", isKpHodom: false),
            StageTime(stageName: "От сдачи локомотива до сдачи бригады", duration: "13", isKpHodom: false)
        ]
    )
    // Добавьте остальные маршруты...
]

// Данные для станционных путей
let stationRoutes: [RouteTime] = [
    // Пример маршрута
    RouteTime(
        departureStation: "Вязьма",
        arrivalStation: "Бекасово",
        locomotive: "ВЛ10У",
        path: "Станционные пути",
        stages: [
            StageTime(stageName: "От явки до начала приёмки", duration: "27", isKpHodom: false),
            StageTime(stageName: "От начала приёмки до окончания приёмки", duration: "8", isKpHodom: false),
            StageTime(stageName: "КП", duration: "Ходом", isKpHodom: true),
            StageTime(stageName: "От окончания приёмки до отправления", duration: "43", isKpHodom: false)
        ],
        afterKpStages: [
            StageTime(stageName: "От прибытия до начала сдачи", duration: "22", isKpHodom: false),
            StageTime(stageName: "КП", duration: "Ходом", isKpHodom: true),
            StageTime(stageName: "От начала сдачи до окончания сдачи локомотива", duration: "8", isKpHodom: false),
            StageTime(stageName: "От сдачи локомотива до сдачи бригады", duration: "30", isKpHodom: false)
        ]
    )
    // Добавьте остальные маршруты...
]
