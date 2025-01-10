// Models/BrakeTest.swift
import SwiftUI

struct BrakeTest: Identifiable {
    let id = UUID()
    let route: String
    let direction: String
    let km: Int
    let picket: Int
    let speed: Int
    let brakingDistance: Int
    let criticalBrakingDistance: Int
}
