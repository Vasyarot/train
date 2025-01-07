// Models/RouteProtocol.swift
import SwiftUI

protocol Route {
    var routeName: String { get }
    var locomotive: String { get }
    var stages: [RouteStage] { get }
}
