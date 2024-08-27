//
//  WebScraper.swift
//  surf-forecast-widget
//
//  Created by Jesse Hyde on 27/08/2024.
//

import SwiftUI
import SwiftSoup

func SurflineWebScraper() -> [Spot]? {
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
