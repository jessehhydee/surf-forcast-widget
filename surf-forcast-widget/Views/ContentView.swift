//
//  ContentView.swift
//  surf-forecast-widget
//
//  Created by Jesse Hyde on 26/08/2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var spotsObserv: SurfSpotsObserv
    
    var body: some View {
        if (spotsObserv.surfSpots.count > 0) {
            HStack(alignment: .top, spacing: 7.0) {
                VStack(alignment: .leading, spacing: 7.0) {
                    if (spotsObserv.surfSpots.count > 0) {
                        ForEach(spotsObserv.surfSpots.prefix(3), id: \.self.name) { spot in
                            SurfSpotView(spotInfo: spot)
                        }
                    } else {
                        NoSurfSpotView()
                    }
                }
                .frame(minWidth: 340, maxWidth: 600)
                if (spotsObserv.surfSpots.count > 3) {
                    VStack(alignment: .leading, spacing: 7.0) {
                        ForEach(Array(spotsObserv.surfSpots.dropFirst(3)), id: \.self.name) { spot in
                            SurfSpotView(spotInfo: spot)
                        }
                    }
                    .frame(minWidth: 340, maxWidth: 600)
                }
            }
            .padding(.all, 10.0)
        }
        else {
            VStack {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                    .scaleEffect(0.6, anchor: .center)
            }
            .frame(minWidth: 400, minHeight: 200)
        }
    }
}
