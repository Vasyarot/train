// Routes/StationTimesTableView.swift
import SwiftUI

struct StationTimesTableView: View {
    let route: StationRoute

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
    func getStages(route: StationRoute) -> [RouteStage] {
        return [
            RouteStage(name: "От явки до начала приёмки", time: "\(route.yavkaToStart) мин"),
            RouteStage(name: "От начала приёмки до окончания приёмки", time: "\(route.startToEnd) мин"),
            RouteStage(name: "КП", time: route.kp),
            RouteStage(name: "От окончания приёмки до отправления", time: "\(route.endToDeparture) мин"),
            RouteStage(name: "От прибытия до начала сдачи", time: route.arrivalToStartHandover),
            RouteStage(name: "КП прибытия", time: route.kpArrival),
            RouteStage(name: "От начала сдачи до окончания сдачи локомотива", time: "\(route.startToEndHandover) мин"),
            RouteStage(name: "От сдачи локомотива до сдачи бригады", time: route.handoverToBrigade)
        ]
    }
}
