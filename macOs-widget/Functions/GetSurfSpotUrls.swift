//
//  GetSurfSpotUrls.swift
//  macOs-widgetExtension
//
//  Created by Jesse Hyde on 29/08/2024.
//

import WidgetKit

func GetSurfSpotUrls() -> [String] {
    return UserDefaults(suiteName: "NPRMYP26B7.group.com.hydeit.surf-forcast-widget")?.value(forKey: "surfSpotUrls") as? [String] ?? []
}
