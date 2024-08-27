//
//  GetGradeColor.swift
//  surf-forcast-widget
//
//  Created by Jesse Hyde on 27/08/2024.
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
