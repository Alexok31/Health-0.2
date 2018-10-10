//
//  StepsChartHelper.swift
//  Health
//
//  Created by Александр Харченко on 10/11/18.
//  Copyright © 2018 Александр Харченко. All rights reserved.
//

import Foundation
import UIKit

class StepsChartHelper {
    
    var dayWalkingSteps = [100, 50, 0, 0, 0, 0, 0, 300, 500, 700, 200, 300, 200, 600, 500, 200, 200, 500, 600, 1000, 2000, 3000, 1000, 500]
    var dayRunningSteps = [0, 0, 0, 0, 0, 0, 0, 2000, 500, 100, 50, 50, 100, 200, 200, 0, 100, 0, 0, 200, 500, 100, 0, 0]
    
    func sumArray() -> [Int] {
        let sumDayWalkingAndRunning = zip(dayWalkingSteps, dayRunningSteps).map(+)
        return sumDayWalkingAndRunning
    }
    
    func dayWalkingStepsArray() -> [Int] {
        return dayWalkingSteps
    }
}
