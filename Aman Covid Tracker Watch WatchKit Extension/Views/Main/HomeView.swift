//
//  ContentView.swift
//  Aman Covid Tracker Watch WatchKit Extension
//
//  Created by Michael Caesario on 04/07/22.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: CovidDataViewModel
    @Environment(\.scenePhase) var scenePhase
    
    let dataUnavailable: String = "Unavailable"
    
    var body: some View {
        VStack{
            Text("hello")
        }
//        TabView {
//            newCaseView
//            caseView
//        }
//        .onChange(of: scenePhase) { phase in
//            switch phase {
//            case .active:
//                viewModel.getAllData()
//            default:
//                break
//            }
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(preview.covidDataViewModel)
    }
}

extension HomeView {
    
    var newCaseView: some View {
        
        VStack(alignment: .leading) {
            
            Text(viewModel.caseData?.new ?? "Unavailable")
                .font(Font.system(.title, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(Color.main.accentColor)
                .redacted(reason: viewModel.caseLoading ? .placeholder : [])

            Spacer()
            
            Text("New Confirmed\nCase")
                .font(.caption2)
                .fontWeight(.medium)
                .foregroundColor(.white)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var caseView: some View {
        ScrollView {
            VStack(spacing: 5) {
                
                CaseCell(label: "Active Case", data: viewModel.caseData?.active ?? dataUnavailable, divide: false, redact: viewModel.caseLoading)
                CaseCell(label: "Newly Deceased", data: viewModel.caseData?.newDeath ?? dataUnavailable, divide: true, redact: viewModel.caseLoading)
                CaseCell(label: "Total Case", data: viewModel.caseData?.totalCasesText ?? dataUnavailable, divide: true, redact: viewModel.caseLoading)
                
                Button { viewModel.getAllData() } label: { Text("Refresh") }.padding(.vertical)
            }
        }
    }
}
