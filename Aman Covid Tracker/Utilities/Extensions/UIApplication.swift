//
//  UIApplication.swift
//  Aman Covid Tracker
//
//  Created by Michael Caesario on 01/07/22.
//

import SwiftUI

extension UIApplication {
    static var appVersion: String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }
}
