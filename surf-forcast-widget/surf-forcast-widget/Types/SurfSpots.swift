//
//  SurfSpots.swift
//  surf-forcast-widget
//
//  Created by Jesse Hyde on 27/08/2024.
//

struct Spot: Codable {
    let name: String
    let sizeHumanReadable: String
    let sizeFt: String
    let windDir: String
    let windSpeed: String
    let grade: String
}
