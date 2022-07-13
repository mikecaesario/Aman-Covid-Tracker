//
//  ContentView.swift
//  Aman Covid Tracker
//
//  Created by Michael Caesario on 26/06/22.
//

import SwiftUI
import BottomSheet
import WidgetKit

struct HomeView: View {
    
    // MARK: - Property

    @EnvironmentObject private var viewModel: CovidDataViewModel
    @Environment(\.scenePhase) var scenePhase
    @AppStorage("first_time") var onboardingView: Bool = true
    
    @State var showSplashScreen: Bool = true
    
    // BottomSheet options
    let bottomSheetOptions: [BottomSheet.Options] = [.disableBottomSafeAreaInsets ,.allowContentDrag, .noDragIndicator, .shadow(color: .black.opacity(0.1), radius: 20, x: 0, y: -40), .cornerRadius(25), .noBottomPosition, .animation(.interactiveSpring(response: 0.2, dampingFraction: 0.9))]
    
    // MARK: - View

    var body: some View {
        ZStack {
            // Home screen
            CaseView
            
            // Show SplashScreen when the app runs
            ZStack {
                if showSplashScreen {
                    SplashScreen(splashScreen: $showSplashScreen)
                }
            }
        }
        .onChange(of: scenePhase, perform: { phase in
            
            // Fetch the data when the app become active and reload the Widget when the app goes to the background
            switch phase {
            case .active:
                viewModel.getAllData()
            case .background:
                WidgetCenter.shared.reloadAllTimelines()
            default:
                break
            }
        })
        .alert(isPresented: $viewModel.showAlert, content: {
            Alert(title: Text("Error"), message: Text(viewModel.alertMessage ?? "Unknown Error."), dismissButton: .default(Text("OK"))) })
    }
}

// MARK: - Previews

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(preview.covidDataViewModel)
        
        HomeView()
            .environmentObject(preview.covidDataViewModel)
            .preferredColorScheme(.dark)
    }
}

// MARK: - View Extension

extension HomeView {
    
   private var CaseView: some View {
        NavigationView {
            VStack {
                CircleInformation(data: viewModel.caseData?.new ?? "N/A", label: "NEW CASE")
                
                // to fill out the spaces and pushing the Circle up below the NavigationTitle, Spacer don't work
                Rectangle()
                    .fill(.clear)
            }
            .navigationTitle(viewModel.caseData?.countryText ?? "Loading")
            .toolbar {
                
                // Refresh button
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        viewModel.getAllData()
                    } label: {
                        NavigationBarItem(image: "arrow.clockwise")
                            .accessibilityLabel("Refresh")
                            .accessibilityAddTraits(.isButton)
                    }
                }
                
                // Segue to SettingsView
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        SettingsView()
                    } label: {
                        NavigationBarItem(image: "ellipsis")
                            .accessibilityLabel("Settings")
                            .accessibilityAddTraits(.isButton)
                    }
                }
            }
            // present on boarding if its the first time the user launch the app
            .sheet(isPresented: $onboardingView, content: { OnBoardingView() })
            .bottomSheet(bottomSheetPosition: $viewModel.sheetPosition, options: bottomSheetOptions, headerContent: { SheetHeader() }) { SheetScrollview().ignoresSafeArea() }
        }
    }
}
