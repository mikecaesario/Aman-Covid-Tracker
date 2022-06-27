//
//  SheetGridItem.swift
//  Aman Covid Tracker
//
//  Created by Michael Caesario on 26/06/22.
//

import SwiftUI

struct SheetListItem: View {
    let title: String
    let data: String
    
    var body: some View {
        VStack(spacing: 5) {
            Text(data)
                .font(.headline)
                .fontWeight(.bold)
                .minimumScaleFactor(0.5)
                .foregroundColor(Color.main.accentColor)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(title)
                .font(.footnote)
                .fontWeight(.regular)
                .foregroundColor(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct SheetGridItem_Previews: PreviewProvider {
    static var previews: some View {
        SheetListItem(title: "Deceased", data: "+ 104")
            .previewLayout(.sizeThatFits)
    }
}
