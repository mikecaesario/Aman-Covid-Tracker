//
//  MainCaseCell.swift
//  Aman Covid Tracker Watch WatchKit Extension
//
//  Created by Michael Caesario on 08/07/22.
//

import SwiftUI

struct MainCaseCell: View {
    
    // MARK: - Property

    let data: String
    let loading: Bool
    
    // MARK: - View

    var body: some View {
        VStack(alignment: .leading) {
            
            Text(data)
                .font(Font.system(.title, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(Color.main.accentColor)
                .redacted(reason: loading ? .placeholder : [])

            Spacer()
                .frame(height: 40)
            
            Text("New Confirmed\nCase")
                .font(.caption2)
                .fontWeight(.medium)
                .foregroundColor(.white)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// MARK: - Previews

struct MainCaseCell_Previews: PreviewProvider {
    static var previews: some View {
        MainCaseCell(data: "+ 1,323", loading: false)
    }
}

