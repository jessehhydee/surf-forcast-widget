//
//  SurfSpotUrlsObserv.swift
//  surf-forcast-widget
//
//  Created by Jesse Hyde on 29/08/2024.
//

import SwiftUI

@MainActor class SurfSpotUrlsObserv: ObservableObject {
    @ObservedObject var spotsObserv: SurfSpotsObserv
    @Published var surfSpotUrls: [String] {
        didSet {
            UserDefaults(suiteName: "NPRMYP26B7.group.com.hydeit.surf-forcast-widget")?.set(surfSpotUrls, forKey: "surfSpotUrls")
            Task {
                spotsObserv.surfSpots = await SurflineWebScraper(spotUrls: surfSpotUrls)
            }
        }
    }

    init(surfSpotsObserv: SurfSpotsObserv) {
        self.spotsObserv = surfSpotsObserv
        self.surfSpotUrls = UserDefaults(suiteName: "NPRMYP26B7.group.com.hydeit.surf-forcast-widget")?.array(forKey: "surfSpotUrls") as? [String] ?? []
    }
}
