// Routes/TimesTableView.swift
import SwiftUI

struct TimesTableView: View {
    let route: DepotRoute

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Заголовок маршрута и локомотива
            VStack(alignment: .leading, spacing: 5) {
                Text("Маршрут: \(route.routeName)")
                    .font(.headline)
                Text("Локомотив: \(route.locomotive)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(.bottom, 10)

            // Таблица с временными интервалами
            VStack(spacing: 0) {
                ForEach(getStages(route: route), id: \.name) { stage in
                    HStack {
                        Text(stage.name)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical, 8)
                        
                        // Вертикальная разделительная полоса
                        Divider()
                            .background(Color.gray)
                            .frame(width: 1, height: 20)
                        
                        Text(stage.time)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(.vertical, 8)
                    }
                    .padding(.horizontal)
                    
                    // Горизонтальная разделительная полоса
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

    // Функция для получения этапов маршрута
    func getStages(route: DepotRoute) -> [RouteStage] {
        return [
            RouteStage(name: "От явки до начала приёмки", time: "\(route.yavkaToStart) мин"),
            RouteStage(name: "От начала приёмки до окончания приёмки", time: "\(route.startToEnd) мин"),
            RouteStage(name: "От окончания приёмки до КП", time: "\(route.endToKP) мин"),
            RouteStage(name: "От КП до отправления", time: "\(route.kpToDeparture) мин"),
            RouteStage(name: "От прибытия до КП", time: "\(route.arrivalToKP) мин"),
            RouteStage(name: "От КП до начала сдачи локомотива", time: "\(route.kpToStartHandover) мин"),
            RouteStage(name: "От начала сдачи до окончания сдачи локомотива", time: "\(route.startToEndHandover) мин"),
            RouteStage(name: "От сдачи локомотива до сдачи бригады", time: "\(route.handoverToBrigade) мин")
        ]
    }
}
