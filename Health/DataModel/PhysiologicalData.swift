//
//  DataModel.swift
//  Health
//
//  Created by Александр Харченко on 10/5/18.
//  Copyright © 2018 Александр Харченко. All rights reserved.
//

import Foundation

class PhysiologicalDataa {
    
    let runningSteps = 5000
    let walkingSteps = 1100
    let lowerPressure = 260
    let upperPressure = 120
    
}

struct DateOfPhysiologicalData {
    var date : Data?
    var physiologicalData : PhysiologicalData
}

struct PhysiologicalData {
    var runningSteps : Int?
    var walkingSteps : Int?
    var lowerPressure : Int?
    var upperPressure : Int?
    
}
