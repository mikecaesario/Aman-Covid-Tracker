//
//  Int.swift
//  Aman Covid Tracker
//
//  Created by Michael Caesario on 03/07/22.
//

import Foundation

extension Int {
    
    private var withSeparator: NumberFormatter {
          let formatter = NumberFormatter()
          formatter.numberStyle = .decimal
          return formatter
    }
    
    func formattedVaccineNumb() -> String {
        let number = NSNumber(value: self)
        return withSeparator.string(from: number) ?? "0"
    }
}
