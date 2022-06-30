//
//  APIError.swift
//  Aman Covid Tracker
//
//  Created by Michael Caesario on 29/06/22.
//

import Foundation

enum APIError: Error, LocalizedError {
    case invalidURL
    case invalidResponseStatus
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return NSLocalizedString("The endpoint URL is invalid.", comment: "")
        case .invalidResponseStatus:
            return NSLocalizedString("The API failed to issue a valid response.", comment: "")
        }
    }
}
