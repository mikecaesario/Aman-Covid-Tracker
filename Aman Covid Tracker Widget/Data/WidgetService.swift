//
//  WidgetService.swift
//  Aman Covid Tracker WidgetExtension
//
//  Created by Michael Caesario on 02/07/22.
//

import Foundation

class WidgetService {
    func getCaseData(completion: @escaping (CovidCaseEntry.CaseData?) -> Void) {
        guard let url = URL(string: "https://covid-19.dataflowkit.com/v1/indonesia") else { return completion(nil) }
        
        URLSession.shared.dataTask(with: url) { datas, respons, error in
            var result: CovidCaseEntry.CaseData
            
            if let data = datas, let response = respons as? HTTPURLResponse, response.statusCode == 200 && response.statusCode < 300 {
                
                let decoder = JSONDecoder()
                
                do {
                    result = try decoder.decode(CovidCaseEntry.CaseData.self, from: data)
                    return completion(result)
                } catch {
                    completion(nil)
                }
            }
        }
        .resume()
    }
}
