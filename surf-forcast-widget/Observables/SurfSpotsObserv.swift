//
//  SurfSpotsObserv.swift
//  surf-forcast-widget
//
//  Created by Jesse Hyde on 29/08/2024.
//

import SwiftUI

@MainActor class SurfSpotsObserv: ObservableObject {
    @Published var surfSpots: [Spot] = []

    init() {
        Task {
            self.surfSpots = await SurflineWebScraper(spotUrls: UserDefaults.standard.array(forKey: "surfSpotUrls") as? [String] ?? [])
        }
    }
}

