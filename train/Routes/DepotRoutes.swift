// Routes/DepotRoutes.swift
import SwiftUI

struct DepotRoute: Identifiable {
    let id = UUID()
    let routeName: String
    let locomotive: String
    let yavkaToStart: Int
    let startToEnd: Int
    let endToKP: Int
    let kpToDeparture: Int
    let arrivalToKP: Int
    let kpToStartHandover: Int
    let startToEndHandover: Int
    let handoverToBrigade: Int
}

let depotRoutes: [DepotRoute] = [
    // Вязьма-Бекасово
    DepotRoute(routeName: "Вязьма-Бекасово", locomotive: "ВЛ10У", yavkaToStart: 23, startToEnd: 16, endToKP: 8, kpToDeparture: 58, arrivalToKP: 47, kpToStartHandover: 6, startToEndHandover: 16, handoverToBrigade: 13),
    DepotRoute(routeName: "Вязьма-Бекасово", locomotive: "ВЛ10 КРП, 2ЭС6", yavkaToStart: 25, startToEnd: 16, endToKP: 8, kpToDeparture: 60, arrivalToKP: 48, kpToStartHandover: 6, startToEndHandover: 16, handoverToBrigade: 13),
    DepotRoute(routeName: "Вязьма-Бекасово", locomotive: "3ВЛ11", yavkaToStart: 23, startToEnd: 24, endToKP: 6, kpToDeparture: 59, arrivalToKP: 48, kpToStartHandover: 6, startToEndHandover: 24, handoverToBrigade: 13),
    DepotRoute(routeName: "Вязьма-Бекасово", locomotive: "ВЛ10У СМЕТ", yavkaToStart: 23, startToEnd: 28, endToKP: 8, kpToDeparture: 61, arrivalToKP: 49, kpToStartHandover: 6, startToEndHandover: 28, handoverToBrigade: 13),

    // Бекасово-Вязьма
    DepotRoute(routeName: "Бекасово-Вязьма", locomotive: "ВЛ10У", yavkaToStart: 18, startToEnd: 16, endToKP: 12, kpToDeparture: 58, arrivalToKP: 44, kpToStartHandover: 5, startToEndHandover: 16, handoverToBrigade: 15),
    DepotRoute(routeName: "Бекасово-Вязьма", locomotive: "ВЛ10 КРП, 2ЭС6", yavkaToStart: 18, startToEnd: 16, endToKP: 12, kpToDeparture: 59, arrivalToKP: 45, kpToStartHandover: 5, startToEndHandover: 16, handoverToBrigade: 15),
    DepotRoute(routeName: "Бекасово-Вязьма", locomotive: "3ВЛ11", yavkaToStart: 24, startToEnd: 16, endToKP: 12, kpToDeparture: 59, arrivalToKP: 45, kpToStartHandover: 5, startToEndHandover: 24, handoverToBrigade: 15),
    DepotRoute(routeName: "Бекасово-Вязьма", locomotive: "ВЛ10У СМЕТ", yavkaToStart: 18, startToEnd: 28, endToKP: 12, kpToDeparture: 60, arrivalToKP: 46, kpToStartHandover: 5, startToEndHandover: 28, handoverToBrigade: 15),

    // Вязьма-Рыбное
    DepotRoute(routeName: "Вязьма-Рыбное", locomotive: "ВЛ10У", yavkaToStart: 23, startToEnd: 16, endToKP: 8, kpToDeparture: 58, arrivalToKP: 36, kpToStartHandover: 1, startToEndHandover: 16, handoverToBrigade: 18),
    DepotRoute(routeName: "Вязьма-Рыбное", locomotive: "ВЛ10 КРП, 2ЭС6", yavkaToStart: 25, startToEnd: 16, endToKP: 8, kpToDeparture: 60, arrivalToKP: 36, kpToStartHandover: 1, startToEndHandover: 16, handoverToBrigade: 18),
    DepotRoute(routeName: "Вязьма-Рыбное", locomotive: "3ВЛ11", yavkaToStart: 23, startToEnd: 24, endToKP: 8, kpToDeparture: 59, arrivalToKP: 37, kpToStartHandover: 1, startToEndHandover: 24, handoverToBrigade: 18),
    DepotRoute(routeName: "Вязьма-Рыбное", locomotive: "ВЛ10У СМЕТ", yavkaToStart: 23, startToEnd: 28, endToKP: 8, kpToDeparture: 61, arrivalToKP: 37, kpToStartHandover: 1, startToEndHandover: 28, handoverToBrigade: 18),

    // Рыбное-Вязьма
    DepotRoute(routeName: "Рыбное-Вязьма", locomotive: "ВЛ10У", yavkaToStart: 24, startToEnd: 16, endToKP: 2, kpToDeparture: 58, arrivalToKP: 44, kpToStartHandover: 5, startToEndHandover: 16, handoverToBrigade: 15),
    DepotRoute(routeName: "Рыбное-Вязьма", locomotive: "ВЛ10 КРП, 2ЭС6", yavkaToStart: 24, startToEnd: 16, endToKP: 2, kpToDeparture: 59, arrivalToKP: 45, kpToStartHandover: 5, startToEndHandover: 16, handoverToBrigade: 15),
    DepotRoute(routeName: "Рыбное-Вязьма", locomotive: "3ВЛ11", yavkaToStart: 24, startToEnd: 24, endToKP: 2, kpToDeparture: 59, arrivalToKP: 45, kpToStartHandover: 5, startToEndHandover: 24, handoverToBrigade: 15),
    DepotRoute(routeName: "Рыбное-Вязьма", locomotive: "ВЛ10У СМЕТ", yavkaToStart: 24, startToEnd: 28, endToKP: 2, kpToDeparture: 60, arrivalToKP: 45, kpToStartHandover: 5, startToEndHandover: 28, handoverToBrigade: 15),

    // Вязьма-Вековка
    DepotRoute(routeName: "Вязьма-Вековка", locomotive: "ВЛ10У", yavkaToStart: 23, startToEnd: 16, endToKP: 8, kpToDeparture: 58, arrivalToKP: 41, kpToStartHandover: 5, startToEndHandover: 16, handoverToBrigade: 11),
    DepotRoute(routeName: "Вязьма-Вековка", locomotive: "ВЛ10 КРП, 2ЭС6", yavkaToStart: 25, startToEnd: 16, endToKP: 8, kpToDeparture: 60, arrivalToKP: 42, kpToStartHandover: 5, startToEndHandover: 16, handoverToBrigade: 11),
    DepotRoute(routeName: "Вязьма-Вековка", locomotive: "3ВЛ11", yavkaToStart: 23, startToEnd: 24, endToKP: 8, kpToDeparture: 59, arrivalToKP: 42, kpToStartHandover: 5, startToEndHandover: 24, handoverToBrigade: 11),
    DepotRoute(routeName: "Вязьма-Вековка", locomotive: "ВЛ10У СМЕТ", yavkaToStart: 23, startToEnd: 28, endToKP: 8, kpToDeparture: 61, arrivalToKP: 43, kpToStartHandover: 5, startToEndHandover: 28, handoverToBrigade: 11),

    // Вековка-Вязьма
    DepotRoute(routeName: "Вековка-Вязьма", locomotive: "ВЛ10У", yavkaToStart: 15, startToEnd: 16, endToKP: 14, kpToDeparture: 56, arrivalToKP: 44, kpToStartHandover: 5, startToEndHandover: 16, handoverToBrigade: 15),
    DepotRoute(routeName: "Вековка-Вязьма", locomotive: "ВЛ10 КРП, 2ЭС6", yavkaToStart: 15, startToEnd: 16, endToKP: 14, kpToDeparture: 57, arrivalToKP: 45, kpToStartHandover: 5, startToEndHandover: 16, handoverToBrigade: 15),
    DepotRoute(routeName: "Вековка-Вязьма", locomotive: "3ВЛ11", yavkaToStart: 15, startToEnd: 24, endToKP: 14, kpToDeparture: 57, arrivalToKP: 45, kpToStartHandover: 5, startToEndHandover: 24, handoverToBrigade: 15),
    DepotRoute(routeName: "Вековка-Вязьма", locomotive: "ВЛ10У СМЕТ", yavkaToStart: 15, startToEnd: 28, endToKP: 14, kpToDeparture: 58, arrivalToKP: 46, kpToStartHandover: 5, startToEndHandover: 28, handoverToBrigade: 15),

    // Вязьма-Ржев
    DepotRoute(routeName: "Вязьма-Ржев", locomotive: "2М62, 2ТЭ25КМ", yavkaToStart: 25, startToEnd: 20, endToKP: 16, kpToDeparture: 51, arrivalToKP: 32, kpToStartHandover: 3, startToEndHandover: 20, handoverToBrigade: 10),
    DepotRoute(routeName: "Вязьма-Ржев", locomotive: "3М62", yavkaToStart: 25, startToEnd: 24, endToKP: 17, kpToDeparture: 51, arrivalToKP: 33, kpToStartHandover: 3, startToEndHandover: 24, handoverToBrigade: 10),

    // Ржев-Вязьма
    DepotRoute(routeName: "Ржев-Вязьма", locomotive: "2М62, 2ТЭ25КМ", yavkaToStart: 22, startToEnd: 20, endToKP: 13, kpToDeparture: 53, arrivalToKP: 61, kpToStartHandover: 9, startToEndHandover: 20, handoverToBrigade: 15),
    DepotRoute(routeName: "Ржев-Вязьма", locomotive: "3М62", yavkaToStart: 22, startToEnd: 24, endToKP: 13, kpToDeparture: 54, arrivalToKP: 63, kpToStartHandover: 9, startToEndHandover: 24, handoverToBrigade: 15),

    // Вязьма-Калуга
    DepotRoute(routeName: "Вязьма-Калуга", locomotive: "2М62, 2ТЭ25КМ", yavkaToStart: 25, startToEnd: 20, endToKP: 16, kpToDeparture: 54, arrivalToKP: 32, kpToStartHandover: 6, startToEndHandover: 20, handoverToBrigade: 9),

    // Калуга-Вязьма
    DepotRoute(routeName: "Калуга-Вязьма", locomotive: "2М62, 2ТЭ25КМ", yavkaToStart: 13, startToEnd: 20, endToKP: 14, kpToDeparture: 54, arrivalToKP: 61, kpToStartHandover: 9, startToEndHandover: 20, handoverToBrigade: 15),

    // Вязьма-Смоленск
    DepotRoute(routeName: "Вязьма-Смоленск", locomotive: "2М62, 2ТЭ25КМ", yavkaToStart: 25, startToEnd: 20, endToKP: 16, kpToDeparture: 54, arrivalToKP: 38, kpToStartHandover: 4, startToEndHandover: 20, handoverToBrigade: 14),

    // Смоленск-Вязьма
    DepotRoute(routeName: "Смоленск-Вязьма", locomotive: "2М62, 2ТЭ25КМ", yavkaToStart: 12, startToEnd: 20, endToKP: 12, kpToDeparture: 59, arrivalToKP: 61, kpToStartHandover: 9, startToEndHandover: 20, handoverToBrigade: 15)
]
