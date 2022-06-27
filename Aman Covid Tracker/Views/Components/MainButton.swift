//
//  MainButton.swift
//  Aman Covid Tracker
//
//  Created by Michael Caesario on 26/06/22.
//

import SwiftUI

struct MainButton: View {
    let title: String
    
    var body: some View {
        Text(title)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(Color.accentColor)
                    .shadow(color: Color.black.opacity(0.1), radius: 15, x: 0, y: 0)
                    .frame(height: 50)
            )
            .padding()
    }
}

struct MainButton_Previews: PreviewProvider {
    static var previews: some View {
        MainButton(title: "Continue")
    }
}
