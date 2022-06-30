//
//  SheetInformationCell.swift
//  Aman Covid Tracker
//
//  Created by Michael Caesario on 26/06/22.
//

import SwiftUI

struct SheetTopCell: View {
    let title: String
    let data: String
    let padding: Bool
    let loading: Bool
        
    var body: some View {
        VStack(spacing: 10) {
            header
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(SheetBackground())
        .padding(padding ? .leading : .trailing)
    }
}

struct SheetInformationCell_Previews: PreviewProvider {
    static var previews: some View {
        SheetTopCell(title: "Total Cases", data: "6,000,000", padding: true, loading: true)
            .previewLayout(.sizeThatFits)
    }
}

extension SheetTopCell {
    
    var header: some View {
        VStack(alignment: .leading, spacing: 5) {
            
            Text(data)
                .font(.title)
                .font(.headline)
                .fontWeight(.bold)
                .minimumScaleFactor(0.6)
                .foregroundColor(Color.main.accentColor)
                .redacted(reason: loading ? .placeholder : [])
                .padding(.top)
            
                Spacer()
                    .frame(height: 40)
                
                Text(title)
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundColor(.secondary)
                    .minimumScaleFactor(0.5)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
