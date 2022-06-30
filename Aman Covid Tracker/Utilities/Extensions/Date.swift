//
//  Date.swift
//  Aman Covid Tracker
//
//  Created by Michael Caesario on 30/06/22.
//

import Foundation

extension Date {
    
    init(data: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd' 'HH:mm"
        let date = formatter.date(from: data) ?? Date()
        self.init(timeInterval: 0, since: date)
    }
    
    private var shortFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }
    
    func caseShortDateString() -> String {
        return shortFormatter.string(from: self)
    }
}
