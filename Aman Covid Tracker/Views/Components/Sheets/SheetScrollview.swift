//
//  SheetScrollview.swift
//  Aman Covid Tracker
//
//  Created by Michael Caesario on 27/06/22.
//

import SwiftUI

struct SheetScrollview: View {
    @EnvironmentObject var viewModel: CovidDataService
    
    let caseUnavailable: String = "Unavailable"
    let vaccineUnavailable: Int = 0
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 15) {
                topCell
                caseCell
                vaccinationCell
            }
            .padding(.vertical)
        }
    }
}

struct SheetScrollview_Previews: PreviewProvider {
    static var previews: some View {
        SheetScrollview()
            .environmentObject(CovidDataService())
    }
}

extension SheetScrollview {
    
    var topCell: some View {
        HStack(spacing: 15) {
            SheetTopCell(title: "Active Case", data: viewModel.caseData?.active ?? caseUnavailable, padding: true)
            SheetTopCell(title: "Newly Deceased", data: viewModel.caseData?.newDeath ?? caseUnavailable, padding: false)
        }
    }
    
    var caseCell: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            Text("Cases")
                .font(.title3)
                .fontWeight(.bold)
                .padding(.bottom)
            
            SheetListItem(title: "Total Case", data: viewModel.caseData?.totalCasesText ?? caseUnavailable)
            
            Divider()
            
            SheetListItem(title: "Total Recovered", data: viewModel.caseData?.totalRecoveredText ?? caseUnavailable)
            
            Divider()

            SheetListItem(title: "Total Deceased", data: viewModel.caseData?.totalDeathsText ?? caseUnavailable)
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
            
            SheetListItem(title: "Fully Vaccinated", data: String(viewModel.vaccineData?.all.peopleVaccinated ?? vaccineUnavailable))
            
            Divider()
            
            SheetListItem(title: "Partially Vaccinated", data: String(viewModel.vaccineData?.all.peoplePartiallyVaccinated ?? vaccineUnavailable))
            
            Divider()
            
            SheetListItem(title: "Total Administered", data: String(viewModel.vaccineData?.all.administered ?? vaccineUnavailable))
        }
        .padding()
        .background(SheetBackground())
        .padding(.horizontal)
    }
}
