//
//  WidgetView.swift
//  Aman Covid Tracker WidgetExtension
//
//  Created by Michael Caesario on 02/07/22.
//

import WidgetKit
import SwiftUI

struct WidgetView : View {
    
    // MARK: - Property

    var entry: Provider.Entry
    @Environment(\.widgetFamily) var families

    // MARK: - View

    var body: some View {
        
        switch families {
        case .systemSmall:
            SmallWidgetView(entry: entry)
        case .systemMedium:
            MediumWidgetView(entry: entry)
        default:
            SmallWidgetView(entry: entry)
        }
    }
}

// MARK: - Previews

struct WidgetView_Previews: PreviewProvider {
    static var previews: some View {
        WidgetView(entry: CovidCaseEntry(date: Date(), error: false, cases: .previewData))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
        
        WidgetView(entry: CovidCaseEntry(date: Date(), error: false, cases: .previewData))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
