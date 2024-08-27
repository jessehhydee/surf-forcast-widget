//
//  SurfSpotElement.swift
//  surf-forcast-widget
//
//  Created by Jesse Hyde on 26/08/2024.
//

import SwiftUI

func GetGradeColor(grade: String) -> Int {
    switch grade {
    case "FLAT":
        return 0xF44A6D
    case "VERY POOR":
        return 0xF44A6D
    case "POOR":
        return 0xFF9500
    case "POOR TO FAIR":
        return 0xFFCD1D
    case "FAIR":
        return 0x0AD674
    case "FAIR TO GOOD":
        return 0x009371
    case "GOOD":
        return 0x6851F4
    case "EPIC":
        return 0x641EC8
    default:
        return 0x0AD674
    }
}

struct SurfSpotElement: View {
    let spotInfo: Spot
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(spotInfo.name)
                .font(.headline)
                .fontWeight(.bold)
            HStack(alignment: .top) {
                Capsule()
                    .fill(Color(hex: GetGradeColor(grade: spotInfo.grade)))
                    .frame(maxWidth: 5, maxHeight: 55)
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
        .frame(alignment: .topLeading)
        .background(Color(hex: 0xffffff, opacity: 0.8))
        .cornerRadius(10)
    }
}

struct NoSurfSpotElement: View {
    var body: some View {
        HStack(alignment: .top) {
            Capsule()
                .fill(Color(hex: 0xFF0000))
                .frame(maxWidth: 5)
            Text("No surf spot info...")
                .font(.largeTitle)
                .fontWeight(.bold)
        }
        .padding(.all, 10.0)
        .padding(.trailing, 20)
        .frame(alignment: .topLeading)
        .background(Color(hex: 0xffffff, opacity: 0.8))
        .cornerRadius(10)
    }
}
