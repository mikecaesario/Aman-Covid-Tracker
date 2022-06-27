//
//  SheetInformationCell.swift
//  Aman Covid Tracker
//
//  Created by Michael Caesario on 26/06/22.
//

import SwiftUI

struct SheetTopCell: View {
    let title: String
    let glyph: String
    let data: String
        
    var body: some View {
        VStack(spacing: 10) {
            header
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(SheetBackground())
        .padding(.horizontal)
    }
}

struct SheetInformationCell_Previews: PreviewProvider {
    static var previews: some View {
        SheetTopCell(title: "Total Cases", glyph: "person.3.fill", data: "6,000,000")
            .previewLayout(.sizeThatFits)
    }
}

extension SheetTopCell {
    
    var header: some View {
        VStack(alignment: .leading, spacing: 5) {
      
            Text(Image(systemName: glyph))
                .font(.caption2)
                .foregroundColor(.white)
                .padding(10)
                .background(Circle().fill(Color.main.accentColor))
            
            Spacer()
                .frame(height: 10)
            
            Text(data)
                .font(.headline)
                .fontWeight(.bold)
//                .minimumScaleFactor(0.6)
                .foregroundColor(Color.main.accentColor)
                .padding(.top)
            
            Text(title)
                .font(.footnote)
//                .fontWeight(.medium)
                .foregroundColor(.secondary)
                .minimumScaleFactor(0.4)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var backgroundRectangle: some View {
        RoundedRectangle(cornerRadius: 15)
            .fill(.white)
            .shadow(color: Color.black.opacity(0.1), radius: 15, x: 0, y: 0)
    }
}
