//
//  Aman_Covid_TrackerApp.swift
//  Aman Covid Tracker Watch WatchKit Extension
//
//  Created by Michael Caesario on 04/07/22.
//

import SwiftUI

@main
struct Aman_Covid_TrackerApp: App {
    @StateObject var viewModel = CovidDataViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .environmentObject(viewModel)
                    .onAppear { UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable") }
            }
        }
    }
}
