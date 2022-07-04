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
    
    #warning("WARNING! fill in valid URL before running the app.")
    
    
    
    
    enum sheetSizes: CGFloat, CaseIterable {
        case top = 0.8, middle = 0.5
    }
    
    init() {
        getAllData()
    }
    
    func getAllData() {
        // send back the UI components to redacted
        self.caseLoading = true
        self.vaccineLoading = true
        
        // remove the data from the publisher
        self.caseData = nil
        self.vaccineData = nil

        #warning("DispatchQueue Async After is ONLY for testing purposes, remove after testing")
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) { [weak self] in
            do {
                // try to fetch the data
                try self?.getCase()
                try self?.getVaccine()
            } catch {
                // if fails, present an error based on throwing APIError
                self?.showAlert = true
                self?.alertMessage = error.localizedDescription
            }
        }
    }
    
    func getCase() throws {
        // check if the URL is available, else throw an error
        guard let url = caseURL else { throw APIError.invalidURL }
        
        caseDataSubscription = NetworkingManager.downloadData(url: url)
            .decode(type: CaseModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedCases in
                self?.caseData = returnedCases
                self?.caseDataSubscription?.cancel()
                self?.caseLoading = false
            })
    }
    
    func getVaccine() throws {
        // check if the URL is available, else throw an error
        guard let url = vaccineURL else { throw APIError.invalidURL }
        
        vaccineDataSubscription = NetworkingManager.downloadData(url: url)
            .decode(type: VaccineModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedVaccine in
                self?.vaccineData = returnedVaccine
                self?.vaccineDataSubscription?.cancel()
                self?.vaccineLoading = false
            })
    }
}
