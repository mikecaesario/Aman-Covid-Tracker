//
//  NavigationBarItem.swift
//  Aman Covid Tracker
//
//  Created by Michael Caesario on 27/06/22.
//

import SwiftUI

struct NavigationBarItem: View {
    let image: String
    
    var body: some View {
        Text(Image(systemName: image))
            .foregroundColor(.accentColor)
            .padding(8)
            .background(Circle().fill(Color.accentColor.opacity(0.3)))
            .accessibilityLabel("More Info")
            .accessibilityAddTraits(.isButton)
    }
}

struct NavigationBarItem_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarItem(image: "ellipsis")
    }
}
