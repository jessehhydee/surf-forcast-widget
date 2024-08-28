//
//  EntryView.swift
//  macOs-widgetExtension
//
//  Created by Jesse Hyde on 27/08/2024.
//

import SwiftUI

struct WidgetEntryView : View {
    @Environment(\.widgetFamily) var widgetFamily
    var entry: ForecastProvider.Entry

    var body: some View {
        VStack() {
            switch widgetFamily {
                case .systemLarge:
                    SystemLargeView(entry: entry)
                case .systemExtraLarge:
                    SystemExtraLargeView(entry: entry)
                default:
                    SystemLargeView(entry: entry)
            }
            HStack{
                Spacer()
                Text("**Last Update:** \(entry.date.formatted(.dateTime))")
                .font(.caption2)
            }
        }
        .padding(.all, 2.0)
    }
}
