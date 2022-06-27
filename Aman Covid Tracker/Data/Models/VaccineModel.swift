//
//  VaccineModel.swift
//  Aman Covid Tracker
//
//  Created by Michael Caesario on 26/06/22.
//

import Foundation

struct VaccineModel: Codable {
    let all: VaccineDataModel

    enum CodingKeys: String, CodingKey {
        case all = "All"
    }
}

struct VaccineDataModel: Codable {
    let administered, peopleVaccinated, peoplePartiallyVaccinated: Int
    let country: String
    let population: Int
    let lifeExpectancy: String
    let capitalCity, updated: String

    enum CodingKeys: String, CodingKey {
        case administered
        case peopleVaccinated = "people_vaccinated"
        case peoplePartiallyVaccinated = "people_partially_vaccinated"
        case country, population
        case lifeExpectancy = "life_expectancy"
        case capitalCity = "capital_city"
        case updated
    }
    
    var fullyVaccinated: String {
        String(peopleVaccinated / population * 100) + "%"
    }
    
    var partialVaccinated: String {
        String(peopleVaccinated / population * 100) + "%"
    }
}
