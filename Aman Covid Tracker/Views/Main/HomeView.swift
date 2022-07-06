//
//  ContentView.swift
//  Aman Covid Tracker
//
//  Created by Michael Caesario on 26/06/22.
//

import SwiftUI
import BottomSheet

struct HomeView: View {
    @EnvironmentObject var viewModel: CovidDataViewModel
    @Environment(\.scenePhase) var scenePhase
    @AppStorage("first_time") var onboardingView: Bool = true
    
    @State var showSplashScreen: Bool = true
    
    // BottomSheet options
    let bottomSheetOptions: [BottomSheet.Options] = [.disableBottomSafeAreaInsets ,.allowContentDrag, .noDragIndicator, .shadow(color: .black.opacity(0.1), radius: 20, x: 0, y: -40), .cornerRadius(25), .noBottomPosition, .animation(.interactiveSpring(response: 0.2, dampingFraction: 0.9))]
        
    // Toolbar items for navigation buttons to push Settings View
    let toolbarItem: ToolbarItem = ToolbarItem(placement: .navigationBarTrailing) {
        NavigationLink {
            SettingsView()
        } label: {
            NavigationBarItem(image: "ellipsis")
        }
    }
    
    var body: some View {
        ZStack {
            CaseView
            
            // Show SplashScreen when the app runs
            ZStack {
                if showSplashScreen {
                    SplashScreen(splashScreen: $showSplashScreen)
                }
            }
        }
        .onChange(of: scenePhase, perform: { phase in
            
            // Get 
            switch phase {
            case .active:
                viewModel.getAllData()
            default:
                break
            }
        })
        .alert(isPresented: $viewModel.showAlert, content: {
            Alert(title: Text("Error"), message: Text(viewModel.alertMessage ?? "Unknown Error."), dismissButton: .default(Text("OK"))) })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(preview.covidDataViewModel)
        
        HomeView()
            .preferredColorScheme(.dark)
            .environmentObject(preview.covidDataViewModel)
    }
}

extension HomeView {
    
    var CaseView: some View {
        NavigationView {
            VStack {
                CircleInformation(data: viewModel.caseData?.new ?? "Unavailable", label: "NEW CASE")
                
                // to fill out the spaces and pushing the Circle up below the NavigationTitle, Spacer don't work
                Rectangle()
                    .fill(.clear)
            }
            .navigationTitle(viewModel.caseData?.countryText ?? "Unknown")
            .toolbar { toolbarItem }
            // present on boarding if its the first time the user launch the app
            .sheet(isPresented: $onboardingView, content: { OnBoardingView() })
            .bottomSheet(bottomSheetPosition: $viewModel.sheetPosition, options: bottomSheetOptions, headerContent: { SheetHeader() }) { SheetScrollview().environmentObject(viewModel).ignoresSafeArea() }
        }
    }
}
