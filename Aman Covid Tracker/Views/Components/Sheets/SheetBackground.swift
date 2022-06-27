//
//  SheetBackground.swift
//  Aman Covid Tracker
//
//  Created by Michael Caesario on 27/06/22.
//

import SwiftUI

struct SheetBackground: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .fill(Color.main.sheetBackgroundColor)
            .shadow(color: Color.black.opacity(0.1), radius: 15, x: 0, y: 0)
    }
}

struct SheetBackground_Previews: PreviewProvider {
    static var previews: some View {
        SheetBackground()
    }
}
