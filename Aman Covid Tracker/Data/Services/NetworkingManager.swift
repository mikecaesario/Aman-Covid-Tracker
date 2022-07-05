//
//  NetworkingManager.swift
//  Aman Covid Tracker
//
//  Created by Michael Caesario on 26/06/22.
//

import Foundation
import Combine

struct NetworkingManager {
    
    static func downloadData(url: URL) ->  AnyPublisher<Data, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap({ try self.handleURLResponse(output: $0) })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        // handle URL response from the server
        guard let response = output.response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else {
            // if fails, throws an error and show an alert
            throw APIError.invalidResponseStatus
        }
        
        // if succeded, return the data
        return output.data
    }
    
    static func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure:
            break
        }
    }
}
