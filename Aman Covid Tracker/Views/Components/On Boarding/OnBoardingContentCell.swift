//
//  OnBoardingContentCell.swift
//  Aman Covid Tracker
//
//  Created by Michael Caesario on 26/06/22.
//

import SwiftUI

struct OnBoardingContentCell: View {
    let image: String
    let title: String
    let content: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            Image(systemName: image)
                .font(.system(size: 37, weight: .bold))
                .foregroundColor(.accentColor)
                .frame(width: 50, height: 50)

            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.bold)
                
                Text(content)
                    .font(.subheadline)
                    .fontWeight(.regular)
                    .foregroundColor(.secondary)
            }
            .padding(.leading, 10)
            .padding(5)
        }
    }
}

struct OnBoardingContentCell_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingContentCell(image: "exclamationmark.triangle", title: "Get Information at a Glance", content: "Get the latest Covid data officially from the government.")
            .previewLayout(.sizeThatFits)
    }
}
