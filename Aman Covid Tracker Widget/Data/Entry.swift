//
//  Entry.swift
//  Aman Covid Tracker WidgetExtension
//
//  Created by Michael Caesario on 02/07/22.
//

import WidgetKit

struct CovidCaseEntry: TimelineEntry {
    let date: Date
    var error: Bool = false
    var cases: CaseData = .previewData
    
    struct CaseData: Decodable {
        let activeCasesText, countryText, lastUpdate, newCasesText: String
        let newDeathsText, totalCasesText, totalDeathsText, totalRecoveredText: String

        enum CodingKeys: String, CodingKey {
            case activeCasesText = "Active Cases_text"
            case countryText = "Country_text"
            case lastUpdate = "Last Update"
            case newCasesText = "New Cases_text"
            case newDeathsText = "New Deaths_text"
            case totalCasesText = "Total Cases_text"
            case totalDeathsText = "Total Deaths_text"
            case totalRecoveredText = "Total Recovered_text"
        }
        
        // Sometimes the data returned as an empty space, use the property below to avoid empty data showing in the UI
        
        var active: String {
            if activeCasesText == "" {
                return "Unavailable"
            } else {
                return activeCasesText
            }
        }
        
        var new: String {
            if activeCasesText == "" {
                return "Unavailable"
            } else {
                return newCasesText
            }
        }
        
        var newDeath: String {
            if activeCasesText == "" {
                return "Unavailable"
            } else {
                return newDeathsText
            }
        }
        
        static let previewData = CaseData(activeCasesText: "10,000", countryText: "Indonesia", lastUpdate: "2022-03-14 18:00", newCasesText: "+ 21,311", newDeathsText: "20", totalCasesText: "5,800,000", totalDeathsText: "150,000", totalRecoveredText: "5,650,000")
    }
}
