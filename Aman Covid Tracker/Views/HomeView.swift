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
    @AppStorage("first_time") var onboardingView: Bool = true
    @State var isAnimating: Bool = false
    
    // BottomSheet options
    let bottomSheetOptions: [BottomSheet.Options] = [.disableBottomSafeAreaInsets ,.allowContentDrag, .noDragIndicator, .shadow(color: .black.opacity(0.1), radius: 20, x: 0, y: -40), .cornerRadius(25), .noBottomPosition, .animation(.interactiveSpring(response: 0.2, dampingFraction: 0.9))]
    
    // Transition
    let transition: AnyTransition = AnyTransition.opacity
    
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
        
        HomeView()
            .preferredColorScheme(.dark)
            .environmentObject(CovidDataService())
    }
}

extension HomeView {
    
    var LoadingView: some View {
        ZStack {
            Color.main.accentColor.ignoresSafeArea()
            
            
        }
    }
    
    var CaseView: some View {
        VStack {
            CircleInformation(header: viewModel.caseData?.new ?? "Unavailable", subheader: "NEW CASE")
            
            // to fill out the spaces and pushing the Circle up below the NavigationTitle, Spacer don't work
            Rectangle()
                .fill(.clear)
        }
        .onAppear { self.isAnimating = true }
        .navigationTitle(viewModel.caseData?.countryText ?? "Unknown Location")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    SettingsView()
                } label: {
                    NavigationBarItem(image: "ellipsis")
                }
            }
        }
        .sheet(isPresented: $onboardingView, content: { OnBoardingView() })
        .bottomSheet(bottomSheetPosition: $viewModel.sheetsPosition, options: bottomSheetOptions, headerContent: { SheetHeader() }) { SheetScrollview().environmentObject(viewModel).ignoresSafeArea() }
    }
}
