//
//  ParseSurfSpotJSON.swift
//  surf-forcast-widget
//
//  Created by Jesse Hyde on 27/08/2024.
//

import SwiftUI

func ParseSurfSpotJSON() -> SurfSpots? {
    var surfSpots: SurfSpots?
    
    let homeURL = FileManager.default.homeDirectoryForCurrentUser
    print("homeURL: \(homeURL)")
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
