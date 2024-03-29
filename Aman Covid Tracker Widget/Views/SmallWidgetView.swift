//
//  SmallWidgetView.swift
//  Aman Covid Tracker WidgetExtension
//
//  Created by Michael Caesario on 02/07/22.
//

import WidgetKit
import SwiftUI

struct SmallWidgetView: View {
    
    // MARK: - Property

    var entry: Provider.Entry

    // MARK: - View

    var body: some View {
        VStack(alignment: .leading) {
            data
            Spacer()
            label
        }
        .background(Color.widget.backgroundColor)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

// MARK: - Previews

struct SmallWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        SmallWidgetView(entry: CovidCaseEntry(date: Date(), error: false, cases: .previewData))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}

// MARK: - View Extension

extension SmallWidgetView {
    
    var data: some View {
        Text(entry.cases.new)
            .font(Font.system(.title, design: .rounded))
            .fontWeight(.bold)
            .foregroundColor(Color.widget.accentColor)
            .minimumScaleFactor(0.6)
            .lineLimit(1)
            .padding(.top, 10)
    }
    
    var label: some View {
        Text("New Confirmed Case")
            .font(.footnote)
            .fontWeight(.regular)
            .foregroundColor(.secondary)
            .unredacted()
    }
}
