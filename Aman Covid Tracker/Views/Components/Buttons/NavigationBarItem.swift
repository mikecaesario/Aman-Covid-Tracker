//
//  NavigationBarItem.swift
//  Aman Covid Tracker
//
//  Created by Michael Caesario on 27/06/22.
//

import SwiftUI

struct NavigationBarItem: View {
    
    // MARK: - Property

    let image: String
    
    // MARK: - View

    var body: some View {
        Image(systemName: image)
            .resizable()
            .scaledToFit()
            .frame(width: 18, height: 18, alignment: .center)
            .foregroundColor(.accentColor)
            .padding(10)
            .background(Circle().fill(Color.main.accentColor.opacity(0.3)))
    }
}

// MARK: - Previews

struct NavigationBarItem_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarItem(image: "ellipsis")
            .previewLayout(.sizeThatFits)
        
        NavigationBarItem(image: "arrow.clockwise")
            .previewLayout(.sizeThatFits)
    }
}
