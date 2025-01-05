// TimesView.swift
import SwiftUI

struct TimesView: View {
    let selectedPath: String
    let selectedDepartureStation: String
    let selectedArrivalStation: String
    let selectedLocomotive: String
    let routeTimes: [RouteTime]

    @State private var yavkaTime: Date = Date()
    @State private var kpTime: Date = Date()
    @State private var departureTime: Date = Date()
    @State private var arrivalTime: Date = Date()
    @State private var kpArrivalTime: Date = Date()

    @State private var showYavkaTimePicker = false
    @State private var showKpTimePicker = false
    @State private var showDepartureTimePicker = false
    @State private var showArrivalTimePicker = false
    @State private var showKpArrivalTimePicker = false

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                // Кнопка "Время явки"
                Button(action: {
                    showYavkaTimePicker = true
                }) {
                    Text("Время явки")
                        .font(.title2)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                .sheet(isPresented: $showYavkaTimePicker) {
                    TimePickerView(selectedTime: $yavkaTime, title: "Выберите время явки")
                }

                // Отображение выбранного времени явки
                if showYavkaTimePicker {
                    Text("Время явки: \(formattedTime(yavkaTime))")
                        .font(.headline)
                }

                // Кнопка "КП"
                if selectedPath == "Деповские пути" {
                    Button(action: {
                        showKpTimePicker = true
                    }) {
                        Text("КП")
                            .font(.title2)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding()
                    .sheet(isPresented: $showKpTimePicker) {
                        TimePickerView(selectedTime: $kpTime, title: "Выберите время КП")
                    }

                    // Отображение выбранного времени КП
                    if showKpTimePicker {
                        Text("Время КП: \(formattedTime(kpTime))")
                            .font(.headline)
                    }
                } else {
                    Text("КП ходом")
                        .font(.headline)
                        .padding()
                }

                // Таблица для деповских путей
                if selectedPath == "Деповские пути" {
                    if let route = routeTimes.first(where: { $0.departureStation == selectedDepartureStation && $0.arrivalStation == selectedArrivalStation && $0.locomotive == selectedLocomotive }) {
                        // Таблица "От явки до КП"
                        VStack(alignment: .leading) {
                            Text("От явки до КП")
                                .font(.headline)
                                .padding(.top)
                            ForEach(route.stages) { stage in
                                HStack {
                                    Text(stage.stageName)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    Text("\(calculateTime(yavkaTime, stage.duration)) / (\(stage.duration))")
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                                .padding(.vertical, 4)
                            }
                        }
                        .padding()

                        // Кнопка "Время отправления"
                        Button(action: {
                            showDepartureTimePicker = true
                        }) {
                            Text("Время отправления")
                                .font(.title2)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .padding()
                        .sheet(isPresented: $showDepartureTimePicker) {
                            TimePickerView(selectedTime: $departureTime, title: "Выберите время отправления")
                        }

                        // Отображение выбранного времени отправления
                        if showDepartureTimePicker {
                            Text("Время отправления: \(formattedTime(departureTime))")
                                .font(.headline)
                        }

                        // Таблица "От КП до отправления"
                        if showDepartureTimePicker {
                            VStack(alignment: .leading) {
                                Text("От КП до отправления")
                                    .font(.headline)
                                    .padding(.top)
                                let timeDifference = timeDifferenceInMinutes(kpTime, departureTime)
                                let stage = route.stages[3]
                                HStack {
                                    Text(stage.stageName)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    Text("\(timeDifference) мин / (\(stage.duration))")
                                        .foregroundColor(timeDifference < Int(stage.duration)! ? .red : .primary)
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                                .padding(.vertical, 4)
                            }
                            .padding()
                        }

                        // Кнопка "Время прибытия"
                        Button(action: {
                            showArrivalTimePicker = true
                        }) {
                            Text("Время прибытия")
                                .font(.title2)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .padding()
                        .sheet(isPresented: $showArrivalTimePicker) {
                            TimePickerView(selectedTime: $arrivalTime, title: "Выберите время прибытия")
                        }

                        // Отображение выбранного времени прибытия
                        if showArrivalTimePicker {
                            Text("Время прибытия: \(formattedTime(arrivalTime))")
                                .font(.headline)
                        }

                        // Таблица "От прибытия до КП"
                        if showArrivalTimePicker {
                            VStack(alignment: .leading) {
                                Text("От прибытия до КП")
                                    .font(.headline)
                                    .padding(.top)
                                let stage = route.afterKpStages[0]
                                HStack {
                                    Text(stage.stageName)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    Text("\(calculateTime(arrivalTime, stage.duration)) / (\(stage.duration))")
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                                .padding(.vertical, 4)
                            }
                            .padding()
                        }

                        // Кнопка "КП прибытия"
                        Button(action: {
                            showKpArrivalTimePicker = true
                        }) {
                            Text("КП прибытия")
                                .font(.title2)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .padding()
                        .sheet(isPresented: $showKpArrivalTimePicker) {
                            TimePickerView(selectedTime: $kpArrivalTime, title: "Выберите время КП прибытия")
                        }

                        // Отображение выбранного времени КП прибытия
                        if showKpArrivalTimePicker {
                            Text("Время КП прибытия: \(formattedTime(kpArrivalTime))")
                                .font(.headline)
                        }

                        // Таблица "От КП до сдачи бригады"
                        if showKpArrivalTimePicker {
                            VStack(alignment: .leading) {
                                Text("От КП до сдачи бригады")
                                    .font(.headline)
                                    .padding(.top)
                                ForEach(route.afterKpStages.dropFirst()) { stage in
                                    HStack {
                                        Text(stage.stageName)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        Text("\(calculateTime(kpArrivalTime, stage.duration)) / (\(stage.duration))")
                                            .frame(maxWidth: .infinity, alignment: .trailing)
                                    }
                                    .padding(.vertical, 4)
                                }
                            }
                            .padding()
                        }
                    }
                }
            }
            .padding()
        }
    }

    // Форматирование времени
    private func formattedTime(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }

    // Расчет времени с добавлением минут
    private func calculateTime(_ baseTime: Date, _ minutes: String) -> String {
        guard let minutesInt = Int(minutes) else { return "" }
        let calendar = Calendar.current
        if let newTime = calendar.date(byAdding: .minute, value: minutesInt, to: baseTime) {
            return formattedTime(newTime)
        }
        return ""
    }

    // Разница во времени в минутах
    private func timeDifferenceInMinutes(_ start: Date, _ end: Date) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.minute], from: start, to: end)
        return components.minute ?? 0
    }
}

// Вью для выбора времени
struct TimePickerView: View {
    @Binding var selectedTime: Date
    let title: String

    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
                .padding()
            DatePicker("", selection: $selectedTime, displayedComponents: .hourAndMinute)
                .labelsHidden()
                .datePickerStyle(WheelDatePickerStyle())
            Button("Принять") {
                // Закрыть вью
            }
            .padding()
        }
    }
}
