//
//  Color.swift
//  Aman Covid Tracker WidgetExtension
//
//  Created by Michael Caesario on 02/07/22.
//

import SwiftUI

extension Color {
    static let widget = widgetColor()
}

struct widgetColor {
    let accentColor = Color("AccentColor")
    let backgroundColor = Color("WidgetColor")
}
