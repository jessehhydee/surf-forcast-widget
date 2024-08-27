//
//  SurfForcastWidgetApp.swift
//  surf-forcast-widget
//
//  Created by Jesse Hyde on 26/08/2024.
//

import SwiftUI

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

func ParseSurfSpotJSON() -> SurfSpots? {
    var surfSpots: SurfSpots?
    
    let homeURL = FileManager.default.homeDirectoryForCurrentUser
    let forcastDataURL = homeURL.appendingPathComponent("code/surf-notify/forcast-data/data.json")
    
    do {
        let jsonData = try Data(contentsOf: forcastDataURL)
        surfSpots = try JSONDecoder().decode(SurfSpots.self, from: jsonData)
    }
    catch {
        print("Error: \(error)")
    }
    
    return surfSpots
}

@main
struct SurfForcastWidgetApp: App {
    let surf = ParseSurfSpotJSON()
 
    var body: some Scene {
        WindowGroup {
            ContentView(surf: surf)
        }
    }
}
