//
//  MediumWidgetView.swift
//  Aman Covid Tracker WidgetExtension
//
//  Created by Michael Caesario on 02/07/22.
//

import WidgetKit
import SwiftUI

struct MediumWidgetView: View {
    
    // MARK: - Property

    var entry: Provider.Entry

    // MARK: - View

    var body: some View {
        HStack {
            leftSide
            rightSide
        }
    }
}

// MARK: - Previews

struct MediumWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        MediumWidgetView(entry: CovidCaseEntry(date: Date(), error: false, cases: .previewData))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}

// MARK: - View Extension

extension MediumWidgetView {
    
    // Left side of the widget, contains new case information, positioned in Z axis with a circle behind it
    private var leftSide: some View {
        VStack {
            Spacer()
            
            Text(entry.cases.new)
                .font(Font.system(.title3, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(.white)

            Spacer()
                .frame(height: 13)
            
            Text("New Case")
                .font(.caption2)
                .fontWeight(.medium)
                .foregroundColor(.white)
                .unredacted()
            
            Spacer()

        }
        .padding()
        .background(Circle().fill(Color.widget.accentColor)
                        .blur(radius: 10)
                        .frame(width: UIScreen.main.bounds.width / 3))
        .frame(maxWidth: .infinity)
    }
    
    // Right side of the widget, contains two piece of information, positioned on vertical axis on top of each other
    private var rightSide: some View {
        VStack {
            
            Text(entry.cases.active)
                .font(Font.system(.body, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(Color.widget.accentColor)
                .padding(.bottom, 5)
            
            Text("Active Case")
                .font(.caption2)
                .foregroundColor(.secondary)
                .unredacted()
            
            Divider()
            
            Text(entry.cases.newDeath)
                .font(Font.system(.body, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(Color.widget.accentColor)
                .padding(.bottom, 5)
            
            Text("Newly Deceased")
                .font(.caption2)
                .foregroundColor(.secondary)
                .unredacted()
        }
        .padding(10)
        .background(RoundedRectangle(cornerRadius: 17, style: .continuous)
                        .fill(Color.widget.accentColor.opacity(0.1)))
        .frame(maxWidth: .infinity)
        .padding()
    }
}
