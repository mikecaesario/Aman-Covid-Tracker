//
//  Aman_Covid_Tracker_Widget.swift
//  Aman Covid Tracker Widget
//
//  Created by Michael Caesario on 28/06/22.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func getSnapshot(in context: Context, completion: @escaping (Entry) -> Void) {
        <#code#>
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        <#code#>
    }
        
    func placeholder(in context: Context) -> some TimelineEntry {
        <#code#>
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct Aman_Covid_Tracker_WidgetEntryView : View {
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var families

    var body: some View {
        
        switch families {
        case .systemSmall:
            Rectangle()
        case .systemMedium:
            Rectangle()
        default:
            Rectangle()
        }
    }
}

@main
struct Aman_Covid_Tracker_Widget: Widget {
    let kind: String = "Aman_Covid_Tracker_Widget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            Aman_Covid_Tracker_WidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct Aman_Covid_Tracker_Widget_Previews: PreviewProvider {
    static var previews: some View {
        Aman_Covid_Tracker_WidgetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
