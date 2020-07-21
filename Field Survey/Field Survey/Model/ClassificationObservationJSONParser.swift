//
//  ClassificationObservationJSONParser.swift
//  Field Survey
//
//  Created by Payton Marlin on 7/20/20.
//  Copyright © 2020 Payton Marlin. All rights reserved.
//

import Foundation

class ClassificationObservationJSONParser {
    
    static let dateFormatter = DateFormatter()
    
    class func parse(_ data: Data) -> [ClassificationObservations] {
        var classificationObservations = [ClassificationObservations]()
        dateFormatter.dateFormat = "YYYY-MM-dd HH:mm"
        
        if let json = try? JSONSerialization.jsonObject(with: data, options: []),
            let root = json as? [String: Any],
            let status = root["status"] as? String,
            status == "ok" {
            
            if let observations = root["observations"] as? [Any] {
                for observation in observations {
                    if let observation = observation as? [String: String] {
                        if let classificationObservation = observation["classification"],
                            let title = observation["classification"],
                            let description = observation["description"],
                            let dateString = observation["date"],
                            let date = dateFormatter.date(from: dateString) {
                            
                            if let classificationObservation = ClassificationObservations(classification: classificationName, title: title, description: description, date: date) {
                                classificationObservations.append(contentsOf: classificationObservations)
                            }
                             
                        }
                    }
                }
            }
        }
        
        
        return classificationObservations
    }
}
