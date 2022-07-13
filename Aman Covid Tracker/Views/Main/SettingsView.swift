//
//  SettingsView.swift
//  Aman Covid Tracker
//
//  Created by Michael Caesario on 26/06/22.
//

import SwiftUI

struct SettingsView: View {
    
    // MARK: - Property
    @EnvironmentObject private var viewModel: CovidDataViewModel

    let devDescription: String = "This app was built by Michael Caesario, for this project he used Swift, SwiftUI and Combine.\n\nThis app use third party source for the data, and the Developer is not held responsible for any abuse of the information provided by the external source."
        
    // MARK: - View

    var body: some View {
        List {
            countryPicker
            developerInfo
            version
        }
        .listStyle(.insetGrouped)
        .onChange(of: viewModel.country) { _ in
            viewModel.getAllData()
        }
    }
}

// MARK: - Previews

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(preview.covidDataViewModel)
        
        SettingsView()
            .environmentObject(preview.covidDataViewModel)
            .preferredColorScheme(.dark)
    }
}

// MARK: - View Extension

extension SettingsView {
    
    private var countryPicker: some View {
        Section {
            Picker("Country", selection: $viewModel.country) {
                ForEach(CountryList.allCases, id: \.self) { country in
                    Text(country.id)
                        .tag(country)
                        .foregroundColor(Color.main.accentColor)
                }
            }
        }
        .listRowBackground(Color.main.accentColor.opacity(0.4))
        .font(.headline)
        .foregroundColor(.white)
    }
    
    private var developerInfo: some View {
        Section {
            VStack(alignment: .leading, spacing: 15) {
                
                Text("Developer")
                
                Divider()
                
                Text(devDescription)
                    .font(.body)
                    .accessibilityLabel(devDescription)
            }
            .padding(.vertical, 15)
        }
        .listRowBackground(Color.main.accentColor.opacity(0.4))
        .font(.headline)
        .foregroundColor(.white)
    }
    
    private var version: some View {
        Section {
            VStack(alignment: .leading, spacing: 15) {
                
                Text("App Version")
                
                Divider()
                
                Text("Version " + (UIApplication.appVersion ?? "0"))
                    .font(.body)
                    .accessibilityLabel(devDescription)
            }
            .padding(.vertical, 15)
        }
        .listRowBackground(Color.main.accentColor.opacity(0.4))
        .font(.headline)
        .foregroundColor(.white)
    }
}
