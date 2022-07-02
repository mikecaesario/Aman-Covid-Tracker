//
//  Provider.swift
//  Aman Covid Tracker WidgetExtension
//
//  Created by Michael Caesario on 02/07/22.
//

import WidgetKit

struct Provider: TimelineProvider {
    let service = WidgetService()

    func placeholder(in context: Context) -> CovidCaseEntry {
        CovidCaseEntry(date: Date(), error: false, cases: .previewData)
    }

    func getSnapshot(in context: Context, completion: @escaping (CovidCaseEntry) -> ()) {
        service.getCaseData { data in
            let entry = CovidCaseEntry(date: Date(), error: data == nil, cases: data ?? .error)
            completion(entry)
        }
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<CovidCaseEntry>) -> ()) {
        service.getCaseData { data in
            let date = Date()
            let refresh = Calendar.current.date(byAdding: .hour, value: 6, to: date)!
            let timeline = Timeline(entries: [CovidCaseEntry(date: Date(), error: data == nil, cases: data ?? .error)], policy: .after(refresh)
            )
            completion(timeline)
        }
    }
}
