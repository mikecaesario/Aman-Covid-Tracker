//
//  Provider.swift
//  Aman Covid Tracker WidgetExtension
//
//  Created by Michael Caesario on 02/07/22.
//

import WidgetKit
import Combine

class Provider: TimelineProvider {
    let caseURL = URL(string: "https://covid-19.dataflowkit.com/v1/indonesia")
    var caseDataSubscription: AnyCancellable?
    
    func createTimelineEntry(date: Date, completion: @escaping (CovidCaseEntry) -> ()) {
        guard let url = caseURL else { return }

        caseDataSubscription = NetworkingManager.downloadData(url: url)
            .decode(type: CovidCaseEntry.CaseData.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion,
                  receiveValue: { returnedCases in
                
                let entry = CovidCaseEntry(date: Date(), error: false, cases: returnedCases)
                completion(entry)
            })
    }
    
    func createTimeline(date: Date, completion: @escaping (Timeline<CovidCaseEntry>) -> ()) {
        guard let url = caseURL else { return }

        caseDataSubscription = NetworkingManager.downloadData(url: url)
            .decode(type: CovidCaseEntry.CaseData.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion,
                  receiveValue: { returnedCases in
                
                let entry = CovidCaseEntry(date: Date(), error: false, cases: returnedCases)
                let refresh = Calendar.current.date(byAdding: .hour, value: 6, to: date)!
                let timeline = Timeline(entries: [entry], policy: .after(refresh))
                completion(timeline)
            })
    }

    func placeholder(in context: Context) -> CovidCaseEntry {
        CovidCaseEntry(date: Date(), error: false, cases: .previewData)
    }

    func getSnapshot(in context: Context, completion: @escaping (CovidCaseEntry) -> ()) {
        createTimelineEntry(date: Date(), completion: completion)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<CovidCaseEntry>) -> ()) {
        createTimeline(date: Date(), completion: completion)
    }
}
