//
//  SheetHeader.swift
//  Aman Covid Tracker
//
//  Created by Michael Caesario on 26/06/22.
//

import SwiftUI

struct SheetHeader: View {
    var body: some View {
        Capsule()
            .foregroundColor(.secondary)
            .frame(width: 50, height: 5, alignment: .center)
            .frame(maxWidth: .infinity)
            .accessibilityHidden(true)
    }
}

struct SheetHeader_Previews: PreviewProvider {
    static var previews: some View {
        SheetHeader()
            .previewLayout(.sizeThatFits)
    }
}
