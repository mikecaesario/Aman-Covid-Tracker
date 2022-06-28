//
//  CaseModel.swift
//  Aman Covid Tracker
//
//  Created by Michael Caesario on 26/06/22.
//

/*
 
 JSON Response:
 {
     "Active Cases_text": "+42,935",
     "Country_text": "Indonesia",
     "Last Update": "2022-03-02 15:41",
     "New Cases_text": "+40,920",
     "New Deaths_text": "+376",
     "Total Cases_text": "5,630,096",
     "Total Deaths_text": "149,036",
     "Total Recovered_text": "4,944,237"
 }
 */

import Foundation

struct CaseModel: Codable {
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
}
