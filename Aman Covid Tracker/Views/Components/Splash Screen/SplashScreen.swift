//
//  SplashScreen.swift
//  Aman Covid Tracker
//
//  Created by Michael Caesario on 30/06/22.
//

import SwiftUI

struct SplashScreen: View {
    
    // MARK: - Property

    @Binding var splashScreen: Bool
        
    // MARK: - View

    var body: some View {
        ZStack {
            Color.main.accentColor.ignoresSafeArea()
            splashScreenImage
            splashScreenInfo
        }
        .onAppear {
            
            // for testing purpose
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation(.easeOut) {
                    splashScreen = false
                }
            }
        }
    }
}

// MARK: - Previews

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen(splashScreen: .constant(true))
    }
}

// MARK: - View Extension

extension SplashScreen {
    
    private var splashScreenImage: some View {
        Image("AmanLogo")
            .resizable()
            .scaledToFit()
            .shadow(color: .black.opacity(0.2), radius: 15, x: 0, y: 15)
            .frame(width: UIScreen.main.bounds.width / 4.5)
            .frame(maxWidth: .infinity, alignment: .center)
    }
    
    private var splashScreenInfo: some View {
        Text("Version " + (UIApplication.appVersion ?? "0"))
            .font(.footnote)
            .foregroundColor(.white)
            .frame(maxHeight: .infinity, alignment: .bottom)
            .padding()
    }
}
