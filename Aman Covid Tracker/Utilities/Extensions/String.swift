//
//  String.swift
//  Aman Covid Tracker
//
//  Created by Michael Caesario on 10/07/22.
//

import Foundation

extension String {
    
    // Replace " " with "%20%" for API call
    func replaceSpace() -> String {
            return self.replacingOccurrences(of: " ", with: "%20", options: NSString.CompareOptions.literal, range: nil)
    }
}
