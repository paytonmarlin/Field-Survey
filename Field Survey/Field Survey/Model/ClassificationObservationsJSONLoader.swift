//
//  ClassificationObservationsJSONLoader.swift
//  Field Survey
//
//  Created by Payton Marlin on 7/20/20.
//  Copyright © 2020 Payton Marlin. All rights reserved.
//

import Foundation

class ClassificationsObservationsJSONLoader {
    
    class func load(fileName: String) -> [ClassificationObservations] {
        var observations = [ClassificationObservations]()
        
        if let path = Bundle.main.path(forResource: fileName, ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
            observations = ClassificationObservationJSONParser.parse(data)
            
        }
        
        return observations
    }
    
}
