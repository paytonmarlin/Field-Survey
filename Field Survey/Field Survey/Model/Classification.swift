//
//  Classification.swift
//  Field Survey
//
//  Created by Payton Marlin on 7/20/20.
//  Copyright © 2020 Payton Marlin. All rights reserved.
//

import UIKit

enum Classification: String {
    case amphibian
    case bird
    case fish
    case insect
    case mammal
    case plant
    case reptile
    
    var image: UIImage? {
        return UIImage(named: self.rawValue + "Icon")
    }
}
