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
            .fill(.black.opacity(0.3))
            .frame(width: 50, height: 5, alignment: .center)
            .frame(maxWidth: .infinity)
    }
}

struct SheetHeader_Previews: PreviewProvider {
    static var previews: some View {
        SheetHeader()
            .previewLayout(.sizeThatFits)
    }
}
