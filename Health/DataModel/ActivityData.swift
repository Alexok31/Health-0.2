//
//  CalendarDate.swift
//  Health
//
//  Created by Александр Харченко on 10/11/18.
//  Copyright © 2018 Александр Харченко. All rights reserved.
//

import Foundation

class ActivityData {
    
    func data(completion: @escaping (StepsData) -> ()) {
        
        let meteringDate1 = "2018-10-09"
        let runningSteps1 = 1800
        let walkingSteps1 = 7200
        let lowerPressure1 = 60
        let upperPressure1 = 120
        let dayWalkingSteps1 = [100, 0, 0, 0, 0, 0, 0, 300, 500, 700, 0, 300, 0, 600, 500, 200, 200, 500, 600, 500, 500, 1000, 200, 500]
        let dayRunningSteps1 = [0, 0, 0, 0, 0, 0, 0, 200, 300, 100, 50, 50, 200, 200, 200, 0, 100, 0, 0, 200, 300, 100, 0, 0]
        let physiologicalData1 = PhysiologicalData(dateString: meteringDate1, runningSteps: runningSteps1, walkingSteps: walkingSteps1, lowerPressure: lowerPressure1, upperPressure: upperPressure1, dayWalkingSteps: dayWalkingSteps1, dayRunningSteps: dayRunningSteps1)
        
        let meteringDate2 = "2018-10-10"
        let runningSteps2 = 2200
        let walkingSteps2 = 6500
        let lowerPressure2 = 88
        let upperPressure2 = 132
        let dayWalkingSteps2 = [100, 50, 50, 0, 0, 0, 0, 300, 500, 700, 200, 300, 200, 600, 500, 200, 200, 500, 600, 100, 500, 200, 200, 500]
        let dayRunningSteps2 = [0, 0, 0, 0, 0, 0, 0, 0, 500, 100, 50, 50, 100, 200, 200, 0, 100, 0, 0, 200, 500, 100, 0, 0]
        let physiologicalData2 = PhysiologicalData(dateString: meteringDate2, runningSteps: runningSteps2, walkingSteps: walkingSteps2, lowerPressure: lowerPressure2, upperPressure: upperPressure2, dayWalkingSteps: dayWalkingSteps2, dayRunningSteps: dayRunningSteps2)
        
        let meteringDate3 = "2018-10-11"
        let runningSteps3 = 4150
        let walkingSteps3 = 4800
        let lowerPressure3 = 77
        let upperPressure3 = 144
        let dayWalkingSteps3 = [100, 50, 0, 0, 0, 0, 0, 300, 50, 50, 200, 300, 200, 100, 500, 200, 200, 500, 600, 1000, 300, 100, 50, 0]
        let dayRunningSteps3 = [0, 0, 0, 0, 0, 0, 0, 500, 500, 100, 50, 50, 100, 700, 1200, 700, 100, 0, 0, 0, 0, 100, 50, 0]
        let physiologicalData3 = PhysiologicalData(dateString: meteringDate3, runningSteps: runningSteps3, walkingSteps: walkingSteps3, lowerPressure: lowerPressure3, upperPressure: upperPressure3, dayWalkingSteps: dayWalkingSteps3, dayRunningSteps: dayRunningSteps3)
        
        let timeData1 = TimePhysiologicalData(physiologicalData: physiologicalData1)
        let timeData2 = TimePhysiologicalData(physiologicalData: physiologicalData2)
        let timeData3 = TimePhysiologicalData(physiologicalData: physiologicalData3)
        let stepsData = StepsData(timePhysiologicalData: [timeData1, timeData2, timeData3])
        
        completion(stepsData)
      
    }
   
}
