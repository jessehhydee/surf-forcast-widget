//
//  WebScraper.swift
//  surf-forecast-widget
//
//  Created by Jesse Hyde on 27/08/2024.
//

import SwiftUI
import SwiftSoup

// For testing
private let dummyData: [Spot] = [
    Spot(
        name: "Taylors Mistake",
        sizeHumanReadable: "Waist to chest",
        sizeFt: "1-2",
        windDir: "Cross-onshore wind",
        windSpeed: "19",
        grade: "POOR"
    ),
    Spot(
        name: "Sumner Bar (Christchurch)",
        sizeHumanReadable: "Waist to chest",
        sizeFt: "2-3",
        windDir: "Offshore wind",
        windSpeed: "8",
        grade: "FAIR TO GOOD"
    ),
    Spot(
        name: "New Brighton Pier",
        sizeHumanReadable: "Waist to chest",
        sizeFt: "1-3",
        windDir: "Onshore wind",
        windSpeed: "5",
        grade: "POOR TO FAIR"
    )
]

func SurflineWebScraper() -> [Spot]? {
    return dummyData;
    
    let spotUrls = [
        "https://www.surfline.com/surf-report/taylors-mistake/584204204e65fad6a770967e",
        "https://www.surfline.com/surf-report/sumner-bar-christchurch-/6178681b18da23e5802a4a10",
        "https://www.surfline.com/surf-report/new-brighton-pier/584204204e65fad6a770967d"
    ]
    var surfSpots: [Spot] = []
    
    for spotUrl in spotUrls {
        let response = URL(string: spotUrl)!
        
        do {
            let html = try String(contentsOf: response)
            let document = try SwiftSoup.parse(html)
            
            surfSpots.append(
                Spot(
                    name: try document.select("div.ForecastHeader_headerDetails__GHe9U div.MuiStack-root div h1").first()!.text().replacingOccurrences(of: " Surf Report", with: ""),
                    sizeHumanReadable: try document.select("div.CurrentSurfConditionsCard_title__ssxa_ h2").first()!.text(),
                    sizeFt: try document.select("div.CurrentWaveHeightAndRating_waveHeight__Hj9bN p span").first()!.text(),
                    windDir: try document.select("p.CurrentWind_directionType__BYdBg").first()!.text(),
                    windSpeed: try document.select("span.CurrentWind_windSpeed__x6FoF").first()!.text(),
                    grade: try document.select("p.conditionsText").first()!.text()
                )
            )
        }
        catch {
            print("Error: \(error)")
        }
    }
    
    return surfSpots
}
