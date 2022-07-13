//
//  ContentView.swift
//  Aman Covid Tracker Watch WatchKit Extension
//
//  Created by Michael Caesario on 04/07/22.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Property

    @EnvironmentObject private var viewModel: CovidDataViewModel
    @Environment(\.scenePhase) var scenePhase

    @AppStorage("selected_country", store: UserDefaults(suiteName: "group.Aman-Covid-Tracker")) var country: CountryList = .global

    let dataUnavailable: String = "N/A"
    
    // MARK: - View

    var body: some View {
        NavigationView {
            home
        }
        .onChange(of: scenePhase) { phase in
            switch phase {
            case .active:
                viewModel.getAllData()
            default:
                break
            }
        }
    }
}

// MARK: - Previews

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .environmentObject(preview.covidDataViewModel)
        }
    }
}

// MARK: - View Extension

extension HomeView {
    
    var home: some View {
        ScrollView {
            VStack(spacing: 10) {
                
                MainCaseCell(data: viewModel.caseData?.new ?? dataUnavailable, country: viewModel.caseData?.countryText ?? "Loading", loading: viewModel.caseLoading)
                
                CaseCell(label: "Active Case", data: viewModel.caseData?.active ?? dataUnavailable, divide: false, loading: viewModel.caseLoading)
                CaseCell(label: "Newly Deceased", data: viewModel.caseData?.newDeath ?? dataUnavailable, divide: true, loading: viewModel.caseLoading)
                CaseCell(label: "Total Case", data: viewModel.caseData?.totalCasesText ?? dataUnavailable, divide: true, loading: viewModel.caseLoading)
                
                VStack(spacing: 0) {
                    NavigationLink("Settings") { SettingsView().environmentObject(viewModel) }
                    
                    Button { viewModel.getAllData() } label: { Text("Refresh") }.padding(.vertical)
                }
            }
        }
    }
}
