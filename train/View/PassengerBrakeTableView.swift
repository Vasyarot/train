// Views/PassengerBrakeTableView.swift
import SwiftUI

struct PassengerBrakeTableView: View {
    let selectedStation: String
    let selectedTestType: String

    var body: some View {
        VStack {
            Text("Тип пробы: \(selectedTestType)")
                .font(.headline)
                .padding()

            Text("Станция: \(selectedStation)")
                .font(.headline)
                .padding()

            Text("Данные для пассажирских поездов будут здесь.")
                .font(.title2)
                .padding()
        }
    }
}
