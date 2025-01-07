// Routes/StationRoutes.swift
import SwiftUI

struct StationRoute: Identifiable {
    let id = UUID()
    let routeName: String
    let locomotive: String
    let yavkaToStart: Int
    let startToEnd: Int
    let kp: String
    let endToDeparture: Int
    let arrivalToStartHandover: String
    let kpArrival: String
    let startToEndHandover: Int
    let handoverToBrigade: String
}

let stationRoutes: [StationRoute] = [
    // Вязьма-Бекасово
    StationRoute(routeName: "Вязьма-Бекасово", locomotive: "ВЛ10У", yavkaToStart: 27, startToEnd: 8, kp: "Ходом", endToDeparture: 43, arrivalToStartHandover: "22", kpArrival: "Ходом", startToEndHandover: 8, handoverToBrigade: "30"),
    StationRoute(routeName: "Вязьма-Бекасово", locomotive: "ВЛ10 КРП, 2ЭС6", yavkaToStart: 29, startToEnd: 8, kp: "Ходом", endToDeparture: 43, arrivalToStartHandover: "22", kpArrival: "Ходом", startToEndHandover: 8, handoverToBrigade: "30"),
    StationRoute(routeName: "Вязьма-Бекасово", locomotive: "3ВЛ11", yavkaToStart: 27, startToEnd: 13, kp: "Ходом", endToDeparture: 43, arrivalToStartHandover: "22", kpArrival: "Ходом", startToEndHandover: 13, handoverToBrigade: "30"),
    StationRoute(routeName: "Вязьма-Бекасово", locomotive: "ВЛ10У СМЕТ", yavkaToStart: 27, startToEnd: 16, kp: "Ходом", endToDeparture: 44, arrivalToStartHandover: "22", kpArrival: "Ходом", startToEndHandover: 16, handoverToBrigade: "30"),

    // Бекасово-Вязьма
    StationRoute(routeName: "Бекасово-Вязьма", locomotive: "ВЛ10У", yavkaToStart: 31, startToEnd: 8, kp: "Ходом", endToDeparture: 45, arrivalToStartHandover: "54", kpArrival: "Ходом", startToEndHandover: 8, handoverToBrigade: "19"),
    StationRoute(routeName: "Бекасово-Вязьма", locomotive: "ВЛ10 КРП, 2ЭС6", yavkaToStart: 31, startToEnd: 8, kp: "Ходом", endToDeparture: 46, arrivalToStartHandover: "56", kpArrival: "Ходом", startToEndHandover: 8, handoverToBrigade: "19"),
    StationRoute(routeName: "Бекасово-Вязьма", locomotive: "3ВЛ11", yavkaToStart: 31, startToEnd: 13, kp: "Ходом", endToDeparture: 46, arrivalToStartHandover: "55", kpArrival: "Ходом", startToEndHandover: 13, handoverToBrigade: "19"),
    StationRoute(routeName: "Бекасово-Вязьма", locomotive: "ВЛ10У СМЕТ", yavkaToStart: 31, startToEnd: 16, kp: "Ходом", endToDeparture: 47, arrivalToStartHandover: "57", kpArrival: "Ходом", startToEndHandover: 16, handoverToBrigade: "19"),

    // Вязьма-Рыбное
    StationRoute(routeName: "Вязьма-Рыбное", locomotive: "ВЛ10У", yavkaToStart: 27, startToEnd: 8, kp: "Ходом", endToDeparture: 43, arrivalToStartHandover: "Парк А,Г-30     парк Е-38", kpArrival: "Ходом", startToEndHandover: 8, handoverToBrigade: "Парк А,Е-37 ;        М133-21"),
    StationRoute(routeName: "Вязьма-Рыбное", locomotive: "ВЛ10 КРП, 2ЭС6", yavkaToStart: 29, startToEnd: 8, kp: "Ходом", endToDeparture: 43, arrivalToStartHandover: "Парк А,Г-30     парк Е-38", kpArrival: "Ходом", startToEndHandover: 13, handoverToBrigade: "Парк А,Е-37 ;        М133-21"),
    StationRoute(routeName: "Вязьма-Рыбное", locomotive: "3ВЛ11", yavkaToStart: 27, startToEnd: 13, kp: "Ходом", endToDeparture: 43, arrivalToStartHandover: "Парк А,Г-31     парк Е-39", kpArrival: "Ходом", startToEndHandover: 13, handoverToBrigade: "Парк А,Е-37 ;        М133-21"),
    StationRoute(routeName: "Вязьма-Рыбное", locomotive: "ВЛ10У СМЕТ", yavkaToStart: 27, startToEnd: 16, kp: "Ходом", endToDeparture: 44, arrivalToStartHandover: "Парк А,Г-31     парк Е-39", kpArrival: "Ходом", startToEndHandover: 16, handoverToBrigade: "Парк А,Е-37 ;        М133-21"),

    // Рыбное-Вязьма
    StationRoute(routeName: "Рыбное-Вязьма", locomotive: "ВЛ10У", yavkaToStart: 33, startToEnd: 8, kp: "Ходом", endToDeparture: 19, arrivalToStartHandover: "56", kpArrival: "Ходом", startToEndHandover: 8, handoverToBrigade: "19"),
    StationRoute(routeName: "Рыбное-Вязьма", locomotive: "ВЛ10 КРП, 2ЭС6", yavkaToStart: 33, startToEnd: 13, kp: "Ходом", endToDeparture: 19, arrivalToStartHandover: "56", kpArrival: "Ходом", startToEndHandover: 8, handoverToBrigade: "19"),
    StationRoute(routeName: "Рыбное-Вязьма", locomotive: "3ВЛ11", yavkaToStart: 33, startToEnd: 13, kp: "Ходом", endToDeparture: 18, arrivalToStartHandover: "55", kpArrival: "Ходом", startToEndHandover: 13, handoverToBrigade: "19"),
    StationRoute(routeName: "Рыбное-Вязьма", locomotive: "ВЛ10У СМЕТ", yavkaToStart: 33, startToEnd: 16, kp: "Ходом", endToDeparture: 19, arrivalToStartHandover: "57", kpArrival: "Ходом", startToEndHandover: 16, handoverToBrigade: "19"),

    // Вязьма-Вековка
    StationRoute(routeName: "Вязьма-Вековка", locomotive: "ВЛ10У", yavkaToStart: 27, startToEnd: 8, kp: "Ходом", endToDeparture: 43, arrivalToStartHandover: "25", kpArrival: "Ходом", startToEndHandover: 8, handoverToBrigade: "32"),
    StationRoute(routeName: "Вязьма-Вековка", locomotive: "ВЛ10 КРП, 2ЭС6", yavkaToStart: 29, startToEnd: 8, kp: "Ходом", endToDeparture: 43, arrivalToStartHandover: "25", kpArrival: "Ходом", startToEndHandover: 8, handoverToBrigade: "32"),
    StationRoute(routeName: "Вязьма-Вековка", locomotive: "3ВЛ11", yavkaToStart: 27, startToEnd: 13, kp: "Ходом", endToDeparture: 43, arrivalToStartHandover: "26", kpArrival: "Ходом", startToEndHandover: 13, handoverToBrigade: "32"),
    StationRoute(routeName: "Вязьма-Вековка", locomotive: "ВЛ10У СМЕТ", yavkaToStart: 27, startToEnd: 16, kp: "Ходом", endToDeparture: 44, arrivalToStartHandover: "26", kpArrival: "Ходом", startToEndHandover: 16, handoverToBrigade: "32"),

    // Вековка-Вязьма
    StationRoute(routeName: "Вековка-Вязьма", locomotive: "ВЛ10У", yavkaToStart: 38, startToEnd: 8, kp: "Ходом", endToDeparture: 25, arrivalToStartHandover: "54", kpArrival: "Ходом", startToEndHandover: 8, handoverToBrigade: "19"),
    StationRoute(routeName: "Вековка-Вязьма", locomotive: "ВЛ10 КРП, 2ЭС6", yavkaToStart: 38, startToEnd: 8, kp: "Ходом", endToDeparture: 25, arrivalToStartHandover: "56", kpArrival: "Ходом", startToEndHandover: 8, handoverToBrigade: "19"),
    StationRoute(routeName: "Вековка-Вязьма", locomotive: "3ВЛ11", yavkaToStart: 38, startToEnd: 13, kp: "Ходом", endToDeparture: 25, arrivalToStartHandover: "55", kpArrival: "Ходом", startToEndHandover: 13, handoverToBrigade: "19"),
    StationRoute(routeName: "Вековка-Вязьма", locomotive: "ВЛ10У СМЕТ", yavkaToStart: 38, startToEnd: 16, kp: "Ходом", endToDeparture: 25, arrivalToStartHandover: "57", kpArrival: "Ходом", startToEndHandover: 16, handoverToBrigade: "16"),

    // Вязьма-Ржев
    StationRoute(routeName: "Вязьма-Ржев", locomotive: "2М62 / 2ТЭ25КМ", yavkaToStart: 29, startToEnd: 8, kp: "Ходом", endToDeparture: 45, arrivalToStartHandover: "30", kpArrival: "Ходом", startToEndHandover: 8, handoverToBrigade: "17"),
    StationRoute(routeName: "Вязьма-Ржев", locomotive: "3М62", yavkaToStart: 29, startToEnd: 13, kp: "Ходом", endToDeparture: 45, arrivalToStartHandover: "30", kpArrival: "Ходом", startToEndHandover: 13, handoverToBrigade: "17"),

    // Ржев-Вязьма
    StationRoute(routeName: "Ржев-Вязьма", locomotive: "2М62 / 2ТЭ25КМ", yavkaToStart: 38, startToEnd: 8, kp: "Ходом", endToDeparture: 38, arrivalToStartHandover: "12", kpArrival: "Ходом", startToEndHandover: 8, handoverToBrigade: "27"),
    StationRoute(routeName: "Ржев-Вязьма", locomotive: "3М62", yavkaToStart: 38, startToEnd: 13, kp: "Ходом", endToDeparture: 38, arrivalToStartHandover: "12", kpArrival: "Ходом", startToEndHandover: 13, handoverToBrigade: "27"),

    // Вязьма-Калуга
    StationRoute(routeName: "Вязьма-Калуга", locomotive: "2М62 / 2ТЭ25КМ", yavkaToStart: 29, startToEnd: 8, kp: "Ходом", endToDeparture: 45, arrivalToStartHandover: "12", kpArrival: "Ходом", startToEndHandover: 8, handoverToBrigade: "16"),

    // Калуга-Вязьма
    StationRoute(routeName: "Калуга-Вязьма", locomotive: "2М62 / 2ТЭ25КМ", yavkaToStart: 20, startToEnd: 8, kp: "Ходом", endToDeparture: 39, arrivalToStartHandover: "12", kpArrival: "Ходом", startToEndHandover: 8, handoverToBrigade: "27"),

    // Вязьма-Смоленск
    StationRoute(routeName: "Вязьма-Смоленск", locomotive: "2М62 / 2ТЭ25КМ", yavkaToStart: 29, startToEnd: 8, kp: "Ходом", endToDeparture: 45, arrivalToStartHandover: "30", kpArrival: "Ходом", startToEndHandover: 8, handoverToBrigade: "15"),

    // Смоленск-Вязьма
    StationRoute(routeName: "Смоленск-Вязьма", locomotive: "2М62 / 2ТЭ25КМ", yavkaToStart: 20, startToEnd: 8, kp: "Ходом", endToDeparture: 39, arrivalToStartHandover: "12", kpArrival: "Ходом", startToEndHandover: 8, handoverToBrigade: "27")
]
