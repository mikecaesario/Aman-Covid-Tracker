//
//  Provider.swift
//  Aman Covid Tracker WidgetExtension
//
//  Created by Michael Caesario on 02/07/22.
//

import Combine
import SwiftUI
import WidgetKit

class Provider: TimelineProvider {
    
    // MARK: - Property

    @AppStorage("selected_country", store: UserDefaults(suiteName: "group.Aman-Covid-Tracker")) var country: CountryList = .global
    var caseDataSubscription: AnyCancellable?
    
    // MARK: - Combine Functions

    func createTimelineEntry(date: Date, country: String, completion: @escaping (CovidCaseEntry) -> ()) {
        guard let url = URL(string: "https://covid-19.dataflowkit.com/v1/\(country)") else { return }

        caseDataSubscription = NetworkingManager.downloadData(url: url)
            .decode(type: CovidCaseEntry.CaseData.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion,
                  receiveValue: { returnedCases in
                
                let entry = CovidCaseEntry(date: Date(), error: false, cases: returnedCases)
                completion(entry)
            })
    }
    
    func createTimeline(date: Date, country: String, completion: @escaping (Timeline<CovidCaseEntry>) -> ()) {
        guard let url = URL(string: "https://covid-19.dataflowkit.com/v1/\(country)") else { return }

        caseDataSubscription = NetworkingManager.downloadData(url: url)
            .decode(type: CovidCaseEntry.CaseData.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion,
                  receiveValue: { returnedCases in
                
                let entry = CovidCaseEntry(date: Date(), error: false, cases: returnedCases)
                let refresh = Calendar.current.date(byAdding: .hour, value: 4, to: date)!
                let timeline = Timeline(entries: [entry], policy: .after(refresh))
                completion(timeline)
            })
    }

    // MARK: - Widget Functions

    func placeholder(in context: Context) -> CovidCaseEntry {
        CovidCaseEntry(date: Date(), error: false, cases: .previewData)
    }

    func getSnapshot(in context: Context, completion: @escaping (CovidCaseEntry) -> ()) {
        createTimelineEntry(date: Date(), country: country.id.replaceSpace(), completion: completion)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<CovidCaseEntry>) -> ()) {
        createTimeline(date: Date(), country: country.id.replaceSpace(), completion: completion)
    }
}
