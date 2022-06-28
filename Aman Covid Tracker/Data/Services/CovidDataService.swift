//
//  CovidDataService.swift
//  Aman Covid Tracker
//
//  Created by Michael Caesario on 26/06/22.
//

import Foundation
import Combine
import SwiftUI

class CovidDataService: ObservableObject {
    @Published var caseData: CaseModel? = nil
    @Published var vaccineData: VaccineModel? = nil
    @Published var cases: data = .unavailable
    @Published var vacinnes: data = .unavailable
    @Published var sheetsPosition: sheetSizes = .middle
    
    var caseDataSubscription: AnyCancellable?
    var vaccineDataSubscription: AnyCancellable?
    
    
    
    enum sheetSizes: CGFloat, CaseIterable {
        case top = 0.8, middle = 0.5
    }
    
    enum data {
        case available, unavailable
    }
    
    init() {
        getAllData()
    }
    
    func getAllData() {
        getCase()
        getVaccine()
    }
    
    func getCase() {
        guard let url = caseURL else { return }
        
        caseDataSubscription = NetworkingManager.downloadData(url: url)
            .decode(type: CaseModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedCases in
                self?.caseData = returnedCases
                self?.caseDataSubscription?.cancel()
                self?.cases = .available
            })
    }
    
    func getVaccine() {
        guard let url = vaccineURL else { return }
        
        vaccineDataSubscription = NetworkingManager.downloadData(url: url)
            .decode(type: VaccineModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedVaccine in
                self?.vaccineData = returnedVaccine
                self?.vaccineDataSubscription?.cancel()
                self?.vacinnes = .available
            })
    }
}
