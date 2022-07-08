//
//  SheetInformationCell.swift
//  Aman Covid Tracker
//
//  Created by Michael Caesario on 26/06/22.
//

import SwiftUI

struct SheetTopCell: View {
    
    // MARK: - Property

    let label: String
    let data: String
    let padding: Bool
    let loading: Bool
        
    // MARK: - View

    var body: some View {
        VStack(spacing: 10) {
            header
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(SheetBackground())
        .padding(padding ? .leading : .trailing)
        .accessibilityLabel(label + data)
    }
}

// MARK: - Previews

struct SheetInformationCell_Previews: PreviewProvider {
    static var previews: some View {
        SheetTopCell(label: "Total Cases", data: "6,000,000", padding: true, loading: true)
            .previewLayout(.sizeThatFits)
    }
}

// MARK: - View Extension

extension SheetTopCell {
    
    private var header: some View {
        VStack(alignment: .leading, spacing: 5) {
            
            Text(data)
                .font(Font.system(.title, design: .rounded))
                .font(.headline)
                .fontWeight(.bold)
                .minimumScaleFactor(0.6)
                .lineLimit(1)
                .foregroundColor(Color.main.accentColor)
                .redacted(reason: loading ? .placeholder : [])
                .padding(.top)
            
                Spacer()
                    .frame(height: 40)
                
                Text(label)
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundColor(.secondary)
                    .minimumScaleFactor(0.5)
                    .lineLimit(1)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
