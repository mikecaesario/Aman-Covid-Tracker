//
//  MediumWidgetView.swift
//  Aman Covid Tracker WidgetExtension
//
//  Created by Michael Caesario on 02/07/22.
//

import WidgetKit
import SwiftUI

struct MediumWidgetView: View {
    var entry: Provider.Entry

    var body: some View {
        HStack {
            leftSide
            rightSide
        }
    }
}

struct MediumWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        MediumWidgetView(entry: CovidCaseEntry(date: Date(), error: false, cases: .previewData))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}

extension MediumWidgetView {
    
    var leftSide: some View {
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
            
            Spacer()

        }
        .padding()
        .background(Circle().fill(Color.widget.accentColor).blur(radius: 13).frame(width: UIScreen.main.bounds.width / 2.75))
        .frame(maxWidth: .infinity)
    }
    
    var rightSide: some View {
        VStack {
            
            Text(entry.cases.active)
                .font(Font.system(.body, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(Color.widget.accentColor)
                .padding(.bottom, 5)
            
            Text("Active Case")
                .font(.caption2)
                .foregroundColor(.secondary)
            
            Divider()
            
            Text(entry.cases.newDeath)
                .font(Font.system(.body, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(Color.widget.accentColor)
                .padding(.bottom, 5)
            
            Text("Newly Deceased")
                .font(.caption2)
                .foregroundColor(.secondary)
        }
        .padding(10)
        .background(RoundedRectangle(cornerRadius: 17, style: .continuous).fill(Color.widget.accentColor.opacity(0.1)))
        .frame(maxWidth: .infinity)
        .padding()
    }
}
