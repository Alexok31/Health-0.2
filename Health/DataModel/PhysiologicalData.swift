//
//  DataModel.swift
//  Health
//
//  Created by Александр Харченко on 10/5/18.
//  Copyright © 2018 Александр Харченко. All rights reserved.
//

import Foundation

struct StepsData {
    var timePhysiologicalData : [TimePhysiologicalData]
}

struct TimePhysiologicalData {
    var physiologicalData: PhysiologicalData
}

struct PhysiologicalData {
    var dateString: String?
    var runningSteps: Int?
    var walkingSteps: Int?
    var lowerPressure: Int?
    var upperPressure: Int?
    var dayWalkingSteps: [Int]
    var dayRunningSteps: [Int]
    var caloriesBurnedBar: Int
    var coefficientBar: Double?
    var wakingTimeBar: String?
    var sleepTimeBar: String?
}
