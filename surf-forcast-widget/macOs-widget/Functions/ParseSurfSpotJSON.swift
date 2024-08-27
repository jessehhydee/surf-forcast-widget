//
//  ParseSurfSpotJSON.swift
//  macOs-widgetExtension
//
//  Created by Jesse Hyde on 27/08/2024.
//

import WidgetKit

func ParseSurfSpotJSON() -> SurfSpots? {
    var surfSpots: SurfSpots?
    
    let homeURL = FileManager.default.homeDirectoryForCurrentUser
    print("homeURL: \(homeURL)")
    let forcastDataURL = homeURL.appendingPathComponent("code/surf-notify/forcast-data/data.json")
    
    print("forcastDataURL: \(forcastDataURL)")
    
    do {
        let jsonData = try Data(contentsOf: forcastDataURL)
        surfSpots = try JSONDecoder().decode(SurfSpots.self, from: jsonData)
        
        print("surfSpots: \(String(describing: surfSpots))")
    }
    catch {
        print("Error: \(error)")
    }
    
    return surfSpots
}
