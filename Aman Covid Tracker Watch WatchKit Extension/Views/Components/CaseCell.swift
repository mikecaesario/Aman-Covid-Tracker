//
//  CaseCell.swift
//  Aman Covid Tracker Watch WatchKit Extension
//
//  Created by Michael Caesario on 04/07/22.
//

import SwiftUI

struct CaseCell: View {
    
    // MARK: - Property

    let label: String
    let data: String
    let divide: Bool
    let loading: Bool
    
    // MARK: - View

    var body: some View {
        VStack(alignment: .leading) {
            
            if divide {
                Divider()
            }
            
            Text(data)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(Color.main.accentColor)
                .redacted(reason: loading ? .placeholder : [])
            
            Spacer()
                .frame(height: 20)
            
            Text(label)
                .font(.footnote)
                .foregroundColor(.white)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// MARK: - Previews

struct caseCell_Previews: PreviewProvider {
    static var previews: some View {
        CaseCell(label: "Total Case", data: "5,987,098", divide: true, loading: false)
            .previewLayout(.sizeThatFits)
    }
}
