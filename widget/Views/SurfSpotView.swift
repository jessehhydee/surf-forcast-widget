//
//  SurfSpotView.swift
//  macOs-widgetExtension
//
//  Created by Jesse Hyde on 27/08/2024.
//

import SwiftUI

struct SurfSpotView: View {
    let spotInfo: Spot
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(spotInfo.name)
                .font(.headline)
                .fontWeight(.bold)
            HStack(alignment: .top) {
                Capsule()
                    .fill(Color(hex: GetGradeColor(grade: spotInfo.grade)))
                    .frame(maxWidth: 5, maxHeight: 48)
                HStack(alignment: .top, spacing: 50.0) {
                    VStack(alignment: .leading) {
                        Text(spotInfo.sizeHumanReadable)
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(Color(hex: 0x424242))
                        HStack(alignment: .firstTextBaseline) {
                            Text(spotInfo.sizeFt)
                                .font(.title2)
                                .fontWeight(.bold)
                            Text("ft")
                                .font(.subheadline)
                                .fontWeight(.bold)
                        }
                        Text(spotInfo.grade)
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(Color(hex: GetGradeColor(grade: spotInfo.grade)))
                    }
                    VStack(alignment: .leading) {
                        Text(spotInfo.windDir)
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(Color(hex: 0x424242))
                        HStack(alignment: .firstTextBaseline) {
                            Text(spotInfo.windSpeed)
                                .font(.title2)
                                .fontWeight(.bold)
                            Text("kts")
                                .font(.subheadline)
                                .fontWeight(.bold)
                        }
                    }
                }
            }
            .padding(.horizontal, 1.0)
        }
        .padding(.all, 10.0)
        .padding(.trailing, 20)
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .background(Color(hex: 0xffffff, opacity: 0.8))
        .cornerRadius(10)
    }
}
