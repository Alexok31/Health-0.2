//
//  DataModel.swift
//  Health
//
//  Created by Александр Харченко on 10/5/18.
//  Copyright © 2018 Александр Харченко. All rights reserved.
//

import Foundation


struct TimePhysiologicalData {
    var dateString : String?
    var physiologicalData : PhysiologicalData
}

struct PhysiologicalData {
    var runningSteps : Int?
    var walkingSteps : Int?
    var lowerPressure : Int?
    var upperPressure : Int?
}
