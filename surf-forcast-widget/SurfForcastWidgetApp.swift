//
//  SurfForecastWidgetApp.swift
//  surf-forecast-widget
//
//  Created by Jesse Hyde on 26/08/2024.
//

import SwiftUI

@main
struct SurfForecastWidgetApp: App {
    let spots = SurflineWebScraper()
 
    var body: some Scene {
        WindowGroup {
            ContentView(spots: spots)
        }
    }
}
