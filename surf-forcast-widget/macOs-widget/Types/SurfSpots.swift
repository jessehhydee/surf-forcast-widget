//
//  SurfSpots.swift
//  macOs-widgetExtension
//
//  Created by Jesse Hyde on 27/08/2024.
//

struct SurfSpots: Codable {
    let surfSpots: [Spot]
}

struct Spot: Codable {
    let name: String
    let sizeHumanReadable: String
    let sizeFt: String
    let windDir: String
    let windSpeed: String
    let grade: String
}
