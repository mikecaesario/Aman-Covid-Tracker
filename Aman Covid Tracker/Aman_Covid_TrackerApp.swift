//
//  Aman_Covid_TrackerApp.swift
//  Aman Covid Tracker
//
//  Created by Michael Caesario on 26/06/22.
//

import SwiftUI

@main
struct Aman_Covid_TrackerApp: App {
    @StateObject var viewModel = CovidDataService()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(viewModel)
        }
    }
}
