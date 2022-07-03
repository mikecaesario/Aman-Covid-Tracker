//
//  Formatter.swift
//  Aman Covid Tracker
//
//  Created by Michael Caesario on 03/07/22.
//

import Foundation

extension Formatter {
    
    private var withSeparator: NumberFormatter {
          let formatter = NumberFormatter()
          formatter.numberStyle = .decimal
          return formatter
    }
}
