// Components/StationSelectorView.swift
import SwiftUI

struct StationSelectorView: View {
    let title: String
    @Binding var selectedStation: String?
    let allStations: [String]
    let excludedStation: String?
    @Binding var otherSelectedStation: String?
    var onStationSelected: (String) -> Void = { _ in }

    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
                .padding(.top)

            if let selectedStationValue = selectedStation {
                HStack {
                    Text(selectedStationValue)
                        .font(.title2)
                        .padding()
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                    Button(action: {
                        selectedStation = nil
                        otherSelectedStation = nil
                    }) {
                        Image(systemName: "x.circle.fill")
                            .foregroundColor(.red)
                            .font(.title)
                            .padding(.trailing)
                    }
                }
            } else {
                ScrollView {
                    ForEach(filteredStations(), id: \.self) { station in
                        Button(action: {
                            selectedStation = station
                            onStationSelected(station)
                            updateOtherStationSelection(station)
                        }) {
                            Text(station)
                                .foregroundColor(.blue)
                                .font(.title2)
                                .padding()
                        }
                    }
                }
            }
        }
    }

    func filteredStations() -> [String] {
        if let excludedStation = excludedStation {
            return allStations.filter { $0 != excludedStation }
        } else {
            return allStations
        }
    }

    func updateOtherStationSelection(_ selectedStation: String) {
        if selectedStation == "Вязьма" {
            otherSelectedStation = nil
        } else {
            otherSelectedStation = "Вязьма"
        }
    }
}
