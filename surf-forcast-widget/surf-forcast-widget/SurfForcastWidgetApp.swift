//
//  SurfForcastWidgetApp.swift
//  surf-forcast-widget
//
//  Created by Jesse Hyde on 26/08/2024.
//

import SwiftUI

@main
struct SurfForcastWidgetApp: App {
    let spots = SurflineWebScraper()
 
    var body: some Scene {
        WindowGroup {
            ContentView(spots: spots)
        }
    }
}
