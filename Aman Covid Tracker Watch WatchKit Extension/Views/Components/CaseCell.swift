//
//  CaseCell.swift
//  Aman Covid Tracker Watch WatchKit Extension
//
//  Created by Michael Caesario on 04/07/22.
//

import SwiftUI

struct CaseCell: View {
    let label: String
    let data: String
    let divide: Bool
    var redact: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            
            if divide {
                Divider()
            }
            
            Text(data)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(Color.main.accentColor)
                .redacted(reason: redact ? .placeholder : [])
            
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

struct caseCell_Previews: PreviewProvider {
    static var previews: some View {
        CaseCell(label: "Total Case", data: "5,987,098", divide: true, redact: false)
            .previewLayout(.sizeThatFits)
    }
}
