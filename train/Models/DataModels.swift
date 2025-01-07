// Models/DataModels.swift
import SwiftUI

// Реализация протокола для DepotRoute
extension DepotRoute: Route {
    var stages: [RouteStage] {
        return [
            RouteStage(name: "От явки до начала приёмки", time: "\(yavkaToStart) мин"),
            RouteStage(name: "От начала приёмки до окончания приёмки", time: "\(startToEnd) мин"),
            RouteStage(name: "От окончания приёмки до КП", time: "\(endToKP) мин"),
            RouteStage(name: "От КП до отправления", time: "\(kpToDeparture) мин"),
            RouteStage(name: "От прибытия до КП", time: "\(arrivalToKP) мин"),
            RouteStage(name: "От КП до начала сдачи локомотива", time: "\(kpToStartHandover) мин"),
            RouteStage(name: "От начала сдачи до окончания сдачи локомотива", time: "\(startToEndHandover) мин"),
            RouteStage(name: "От сдачи локомотива до сдачи бригады", time: "\(handoverToBrigade) мин")
        ]
    }
}

// Реализация протокола для StationRoute
extension StationRoute: Route {
    var stages: [RouteStage] {
        return [
            RouteStage(name: "От явки до начала приёмки", time: "\(yavkaToStart) мин"),
            RouteStage(name: "От начала приёмки до окончания приёмки", time: "\(startToEnd) мин"),
            RouteStage(name: "КП", time: kp),
            RouteStage(name: "От окончания приёмки до отправления", time: "\(endToDeparture) мин"),
            RouteStage(name: "От прибытия до начала сдачи", time: arrivalToStartHandover),
            RouteStage(name: "КП прибытия", time: kpArrival),
            RouteStage(name: "От начала сдачи до окончания сдачи локомотива", time: "\(startToEndHandover) мин"),
            RouteStage(name: "От сдачи локомотива до сдачи бригады", time: handoverToBrigade)
        ]
    }
}
