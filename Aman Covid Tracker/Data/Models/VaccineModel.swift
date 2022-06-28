//
//  VaccineModel.swift
//  Aman Covid Tracker
//
//  Created by Michael Caesario on 26/06/22.
//

/*
 
 JSON Response:
 {
   "All": {
     "administered": 7927771,
     "people_vaccinated": 2297100,
     "people_partially_vaccinated": 5630671,
     "country": "France",
     "population": 64979548,
     "sq_km_area": 551500,
     "life_expectancy": "78.8",
     "elevation_in_meters": 375,
     "continent": "Europe",
     "abbreviation": "FR",
     "location": "Western Europe",
     "iso": 250,
     "capital_city": "Paris",
     "lat": "46.2276",
     "long": "2.2137",
     "updated": "2020/12/26 12:21:56+00"
   }
 }
 */

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
}
