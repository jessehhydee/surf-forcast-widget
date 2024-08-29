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
            UserDefaults.standard.set(surfSpotUrls, forKey: "surfSpotUrls")
            Task {
                spotsObserv.surfSpots = await SurflineWebScraper(spotUrls: surfSpotUrls)
            }
        }
    }

    init(surfSpotsObserv: SurfSpotsObserv) {
        self.spotsObserv = surfSpotsObserv
        self.surfSpotUrls = UserDefaults.standard.array(forKey: "surfSpotUrls") as? [String] ?? []
    }
}
