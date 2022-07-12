//
//  CovidDataViewModel.swift
//  Aman Covid Tracker
//
//  Created by Michael Caesario on 26/06/22.
//

import Foundation
import Combine
import SwiftUI

class CovidDataViewModel: ObservableObject {
    @Published var caseData: CaseModel? = nil
    @Published var vaccineData: VaccineModel? = nil
    @Published var caseLoading: Bool = true
    @Published var vaccineLoading: Bool = true
    
    @Published var sheetPosition: sheetSizes = .middle
    
    @Published var showAlert: Bool = false
    @Published var alertMessage: String? = nil
    
    var caseDataSubscription: AnyCancellable?
    var vaccineDataSubscription: AnyCancellable?
        
    @AppStorage("selected_country", store: UserDefaults(suiteName: "group.Aman-Covid-Tracker")) var country: CountryList = .global

    enum sheetSizes: CGFloat, CaseIterable {
        case top = 0.8, middle = 0.5
    }
    
    init() {
        getAllData()
    }
    
    // MARK: - Functions
    
    func getAllData() {
        
        DispatchQueue.main.async {
            
            // send back the UI components to redacted
            self.caseLoading = true
            self.vaccineLoading = true
            
            // remove the data
            self.caseData = nil
            self.vaccineData = nil
        }
        
        do {
            
            // try to fetch the data
            try getCase(country: country.id.replaceSpace())
            try getVaccine(country: country.id.replaceSpace())
            print("API called")
        } catch(let error) {
            
            // if fails, present an error based on throwing APIError
            self.showAlert = true
            self.alertMessage = error.localizedDescription
        }
    }
    
    func getCase(country: String) throws {
        // check if the URL is available, else throw an error
        guard let url = URL(string: "https://covid-19.dataflowkit.com/v1/\(country.lowercased())") else { throw APIError.invalidURL }
        
        caseDataSubscription = NetworkingManager.downloadData(url: url)
            .decode(type: CaseModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedCases in
                self?.caseData = returnedCases
                self?.caseDataSubscription?.cancel()
                self?.caseLoading = false
            })
    }
    
    func getVaccine(country: String) throws {
        // check if the URL is available, else throw an error
        guard let url = URL(string: "https://covid-api.mmediagroup.fr/v1/vaccines?country=\(country)") else { throw APIError.invalidURL }
        
        vaccineDataSubscription = NetworkingManager.downloadData(url: url)
            .decode(type: VaccineModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedVaccine in
                self?.vaccineData = returnedVaccine
                self?.vaccineDataSubscription?.cancel()
                self?.vaccineLoading = false
            })
    }
}
