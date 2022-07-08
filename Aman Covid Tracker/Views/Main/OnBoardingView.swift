//
//  OnBoardingView.swift
//  Aman Covid Tracker
//
//  Created by Michael Caesario on 26/06/22.
//

import SwiftUI

struct OnBoardingView: View {
    @AppStorage("first_time") var OnBoardingView: Bool = true
    
    let onBoardingHeader: String = "Welcome to Aman"

    var body: some View {
        VStack {
            Spacer()
            onboardingTitle
            Spacer()
            onboardingContent
            Spacer()
            button
        }
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
        
        OnBoardingView()
            .preferredColorScheme(.dark)
    }
}

extension OnBoardingView {
    private var onboardingTitle: some View {
        Text(onBoardingHeader)
            .font(.largeTitle)
            .foregroundColor(.primary)
            .fontWeight(.bold)
            .padding()
            .accessibilityLabel(onBoardingHeader)
    }
    
    private var onboardingContent: some View {
        VStack(alignment: .leading, spacing: 10) {
            OnBoardingContentCell(image: "exclamationmark.triangle",
                              label: "Track Covid Case",
                              content: "Get the latest Covid data")
            OnBoardingContentCell(image: "square.stack",
                              label: "Covid Case Breakdown",
                              content: "Get more detailed Covid information based on Province")
            OnBoardingContentCell(image: "eye",
                              label: "Information at a Glance",
                              content: "Easily access information on the Homescreen with Widgets")
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .padding(30)
    }
    
    private var button: some View {
        Button {
            self.OnBoardingView = false
        } label: {
            MainButton(label: "Continue")
                .padding()
                .padding(.bottom)
        }
    }
}
