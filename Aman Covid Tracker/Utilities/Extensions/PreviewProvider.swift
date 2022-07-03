//
//  PreviewProvider.swift
//  Aman Covid Tracker
//
//  Created by Michael Caesario on 03/07/22.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    
    static var preview: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    
    private init() { }
    
    let covidDataViewModel = CovidDataViewModel()
}
