//
//  Aman_Covid_Tracker_Widget.swift
//  Aman Covid Tracker Widget
//
//  Created by Michael Caesario on 28/06/22.
//

import WidgetKit
import SwiftUI

@main
struct Aman_Covid_Tracker_Widget: Widget {
    let kind: String = "Aman_Covid_Tracker_Widget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            WidgetView(entry: entry)
        }
        .configurationDisplayName("Aman Covid Tracker")
        .description("Get the latest Covid-19 case information.")
    }
}

struct Aman_Covid_Tracker_Widget_Previews: PreviewProvider {
    static var previews: some View {
        WidgetView(entry: CovidCaseEntry(date: Date(), error: false, cases: .previewData))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
        
        WidgetView(entry: CovidCaseEntry(date: Date(), error: false, cases: .previewData))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
