//
//  SettingsView.swift
//  Aman Covid Tracker Watch WatchKit Extension
//
//  Created by Michael Caesario on 12/07/22.
//

import SwiftUI

struct SettingsView: View {
    
    // MARK: - Property
    
    @EnvironmentObject private var viewModel: CovidDataViewModel
        
    // MARK: - View

    var body: some View {
        VStack {
            pickedCountryText
            manualPicker
        }
    }
}

// MARK: - Previews

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

// MARK: - View Extension

extension SettingsView {
    
    var pickedCountryText: some View {
        Text(viewModel.country.id)
            .minimumScaleFactor(0.5)
            .lineLimit(1)
            .frame(maxWidth: .infinity, alignment: .center)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 5, style: .continuous)
                    .foregroundColor(Color.main.accentColor)
            )
            .padding(.bottom)
    }
    
    var manualPicker: some View {
        ScrollView {
            VStack {
                ForEach(CountryList.allCases, id: \.self) { country in
                    HStack {
                        Text(country.id)
                            .font(.body)
                            .minimumScaleFactor(0.5)
                            .lineLimit(1)
                        
                        Spacer()

                        if country == viewModel.country {
                            Text(Image(systemName: "checkmark"))
                                .font(.caption)
                                .fontWeight(.medium)
                        }
                    }
                    .padding(10)
                    .background(
                        RoundedRectangle(cornerRadius: 5, style: .continuous)
                            .foregroundColor(country == viewModel.country ? Color.main.accentColor : .gray.opacity(0.2))
                    )
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .onTapGesture {
                        viewModel.country = country
                        viewModel.getAllData()
                    }
                }
            }
        }
    }
}
