//
//  SheetScrollview.swift
//  Aman Covid Tracker
//
//  Created by Michael Caesario on 27/06/22.
//

import SwiftUI

struct SheetScrollview: View {
    @EnvironmentObject var viewModel: CovidDataViewModel
    
    let dataUnavailable: String = "Unavailable"
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 15) {
                topCell
                caseCell
                vaccinationCell
                refreshButton
            }
            .padding(.vertical)
        }
    }
}

struct SheetScrollview_Previews: PreviewProvider {
    static var previews: some View {
        SheetScrollview()
            .environmentObject(preview.covidDataViewModel)
    }
}

extension SheetScrollview {
    
    var topCell: some View {
        HStack(spacing: 15) {
            SheetTopCell(title: "Active Case", data: viewModel.caseData?.active ?? dataUnavailable, padding: true, loading: viewModel.caseLoading)
            SheetTopCell(title: "Newly Deceased", data: viewModel.caseData?.newDeath ?? dataUnavailable, padding: false, loading: viewModel.caseLoading)
        }
    }
    
    var caseCell: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            Text("Cases")
                .font(.title3)
                .fontWeight(.bold)
                .padding(.bottom)
            
            SheetListItem(title: "Total Case", data: viewModel.caseData?.totalCasesText ?? dataUnavailable, loading: viewModel.caseLoading)
            
            Divider()
            
            SheetListItem(title: "Total Recovered", data: viewModel.caseData?.totalRecoveredText ?? dataUnavailable, loading: viewModel.caseLoading)
            
            Divider()

            SheetListItem(title: "Total Deceased", data: viewModel.caseData?.totalDeathsText ?? dataUnavailable, loading: viewModel.caseLoading)
            
        }
        .padding()
        .background(SheetBackground())
        .padding(.horizontal)
    }
    
    var vaccinationCell: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            Text("Vaccination")
                .font(.title3)
                .fontWeight(.bold)
                .padding(.bottom)
            
            SheetListItem(title: "Fully Vaccinated", data: viewModel.vaccineData?.all.vaccinated ?? dataUnavailable, loading: viewModel.vaccineLoading)
            
            Divider()
            
            SheetListItem(title: "Partially Vaccinated", data: viewModel.vaccineData?.all.partialVaccinated ?? dataUnavailable, loading: viewModel.vaccineLoading)
            
            Divider()
            
            SheetListItem(title: "Total Administered", data: viewModel.vaccineData?.all.admin ?? dataUnavailable, loading: viewModel.vaccineLoading)
        }
        .padding()
        .background(SheetBackground())
        .padding(.horizontal)
    }
    
    var refreshButton: some View {
        Button {
            viewModel.getAllData()
        } label: {
            MainButton(title: "Refresh")
                .padding(.bottom)
        }
    }
}
