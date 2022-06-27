//
//  ContentView.swift
//  Aman Covid Tracker
//
//  Created by Michael Caesario on 26/06/22.
//

import SwiftUI
import BottomSheet

struct HomeView: View {
    @EnvironmentObject var viewModel: CovidDataService
    @AppStorage("first_time") var OnboardingView: Bool = true
    
    // BottomSheet options
    let bottomSheetOptions: [BottomSheet.Options] = [ .disableBottomSafeAreaInsets ,.allowContentDrag, .noDragIndicator, .shadow(color: .black.opacity(0.1), radius: 20, x: 0, y: -20), .cornerRadius(25), .appleScrollBehavior, .noBottomPosition, .animation(.interactiveSpring(response: 0.2, dampingFraction: 0.9))]
    
    var body: some View {
        NavigationView{
            
            switch viewModel.cases {
            case .available:
                CaseView
            default:
                LoadingView
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(CovidDataService())
    }
}

extension HomeView {
    
    var LoadingView: some View {
        VStack {
            
        }
        .navigationTitle("Loading")
    }
    
    var CaseView: some View {
        VStack {
            Circle()
                .fill(Color.main.accentColor)
                .padding()
            
            // to fill out the spaces and pushing the Circle up below the NavigationTitle, Spacer don't work
            Rectangle()
                .fill(.clear)
        }
        .navigationTitle(viewModel.caseData?.countryText ?? "Unknown Location")
        .bottomSheet(bottomSheetPosition: $viewModel.sheetsPosition, options: bottomSheetOptions, headerContent: { SheetHeader() }) { SheetScrollview().environmentObject(viewModel) }
    }
}
