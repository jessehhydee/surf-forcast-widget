//
//  ContentView.swift
//  surf-forcast-widget
//
//  Created by Jesse Hyde on 26/08/2024.
//

import SwiftUI

struct SurfSpots: Codable {
    let surfSpots: [Spot]
}

struct Spot: Codable {
    let name: String
    let sizeHumanReadable: String
    let sizeFt: String
    let windDir: String
    let windSpeed: String
    let grade: String
}

private func parseSurfSpotJSON() {
    guard let path = Bundle.main.path(forResource: "data", ofType: "json") else {
        return
    }
    let url = URL(fileURLWithPath: path)
    
    var surfSpots: SurfSpots?
    do {
        let jsonData = try Data(contentsOf: url)
        surfSpots = try JSONDecoder().decode(SurfSpots.self, from: jsonData)
        
        if let surfSpots = surfSpots {
            print(surfSpots)
        }
        else {
            print("Failed to parse")
        }
        return
    }
    catch {
        print("Error: \(error)")
    }
}

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            VStack(alignment: .leading) {
                Text("Taylors Mistake Surf Report")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                HStack(alignment: .top) {
                    Capsule()
                        .fill(Color(hex: 0xFFCD1D))
                        .frame(maxWidth: 7)
                    HStack(alignment: .top, spacing: 70.0) {
                        VStack(alignment: .leading) {
                            Text("Thigh to waist")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(Color(hex: 0x424242))
                            HStack(alignment: .firstTextBaseline) {
                                Text("1-2")
                                    .font(.title)
                                    .fontWeight(.bold)
                                Text("ft")
                                    .font(.title3)
                                    .fontWeight(.bold)
                            }
                            Text("POOR TO FAIR")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(Color(hex: 0xFFCD1D))
                                .padding(.top, 0.1)
                        }
                        VStack(alignment: .leading) {
                            Text("Offshore wind")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(Color(hex: 0x424242))
                            HStack(alignment: .firstTextBaseline) {
                                Text("13")
                                    .font(.title)
                                    .fontWeight(.bold)
                                Text("kts")
                                    .font(.title3)
                                    .fontWeight(.bold)
                            }
                        }
                    }
                }
                .padding(.horizontal, 1.0)
            }
            .padding(.all, 15.0)
            .padding(.trailing, 30)
            .frame(alignment: .topLeading)
            .background(Color(hex: 0xffffff, opacity: 0.8))
            .cornerRadius(10)
            VStack(alignment: .leading) {
                Text("Taylors Surf Report")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                HStack(alignment: .top) {
                    Capsule()
                        .fill(Color(hex: 0x0AD674))
                        .frame(maxWidth: 7)
                    HStack(alignment: .top, spacing: 70.0) {
                        VStack(alignment: .leading) {
                            Text("Thigh to waist")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(Color(hex: 0x424242))
                            HStack(alignment: .firstTextBaseline) {
                                Text("1-2")
                                    .font(.title)
                                    .fontWeight(.bold)
                                Text("ft")
                                    .font(.title3)
                                    .fontWeight(.bold)
                            }
                            Text("POOR TO FAIR")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(Color(hex: 0x0AD674))
                                .padding(.top, 0.1)
                        }
                        VStack(alignment: .leading) {
                            Text("Offshore wind")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(Color(hex: 0x424242))
                            HStack(alignment: .firstTextBaseline) {
                                Text("13")
                                    .font(.title)
                                    .fontWeight(.bold)
                                Text("kts")
                                    .font(.title3)
                                    .fontWeight(.bold)
                            }
                        }
                    }
                }
                .padding(.horizontal, 1.0)
            }
            .padding(.all, 15.0)
            .padding(.trailing, 30)
            .frame(alignment: .topLeading)
            .background(Color(hex: 0xffffff, opacity: 0.8))
            .cornerRadius(10)
        }
        .padding(/*@START_MENU_TOKEN@*/.all, 15.0/*@END_MENU_TOKEN@*/)
    }
}

extension Color {
    init(hex: Int, opacity: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: opacity
        )
    }
}

#Preview {
    ContentView()
}
