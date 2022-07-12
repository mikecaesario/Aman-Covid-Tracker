//
//  SettingsView.swift
//  Aman Covid Tracker Watch WatchKit Extension
//
//  Created by Michael Caesario on 12/07/22.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject private var viewModel: CovidDataViewModel
    
    @AppStorage("selected_country", store: UserDefaults(suiteName: "group.Aman-Covid-Tracker")) var country: CountryList = .global
    
    var body: some View {
        VStack {
            Text(country.id)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .foregroundColor(.gray.opacity(0.2))
                )
                .padding(.bottom)
            
            Picker("Country", selection: $country) {
                ForEach(CountryList.allCases, id: \.self) { country in
                    Text(country.id)
                        .tag(country)
                        .foregroundColor(.primary)
                        .padding()
                }
            }
            .frame(height: 100)
        }
        .onDisappear { viewModel.getAllData() }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
