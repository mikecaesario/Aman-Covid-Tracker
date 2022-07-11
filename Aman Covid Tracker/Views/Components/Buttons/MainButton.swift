//
//  MainButton.swift
//  Aman Covid Tracker
//
//  Created by Michael Caesario on 26/06/22.
//

import SwiftUI

struct MainButton: View {
    
    // MARK: - Property

    let label: String
    
    // MARK: - View
    
    var body: some View {
        Text(label)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(Color.main.accentColor)
                    .frame(height: 50)
            )
            .accessibilityLabel(label)
            .accessibilityAddTraits(.isButton)
            .padding()
    }
}

// MARK: - Previews

struct MainButton_Previews: PreviewProvider {
    static var previews: some View {
        MainButton(label: "Continue")
            .previewLayout(.sizeThatFits)
    }
}
