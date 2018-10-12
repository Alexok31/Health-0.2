//
//  CalendarView.swift
//  Health
//
//  Created by Александр Харченко on 10/5/18.
//  Copyright © 2018 Александр Харченко. All rights reserved.
//

import Foundation
import FSCalendar

extension StepsController : FSCalendarDataSource, FSCalendarDelegate, FSCalendarDelegateAppearance {
    

    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        zeroingProgressBar()
        ActivityData().data { (stepsData) in
            for i in stepsData.timePhysiologicalData{
                if i.physiologicalData.dateString == self.formatter.string(from: date) {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        let walkingSteps = i.physiologicalData.walkingSteps
                        let runningSteps = i.physiologicalData.runningSteps
                        let lowerPressure = i.physiologicalData.lowerPressure
                        let upperPressure = i.physiologicalData.upperPressure
                        let caloriesBurnedBar = i.physiologicalData.caloriesBurnedBar
                        let coefficientBar = i.physiologicalData.coefficientBar
                        let wakingTimeBar = i.physiologicalData.wakingTimeBar
                        let sleepTimeBar = i.physiologicalData.sleepTimeBar
                        self.stepsChartData.dayWalkingSteps = (i.physiologicalData.dayWalkingSteps)
                        self.stepsChartData.dayRunningSteps = (i.physiologicalData.dayRunningSteps)
                        self.dayliChart.reload()
                        self.dailyWalkingSteps(steps: walkingSteps!)
                        self.dailyRunningSteps(steps: runningSteps!)
                        self.setupLabel(walkingSteps: walkingSteps!, runningSteps: runningSteps!, lowerPressure: lowerPressure!, upperPressure: upperPressure!, caloriesBurned: caloriesBurnedBar, coefficient: coefficientBar!, wakingTime: wakingTimeBar!, sleepTime: sleepTimeBar!)
                    }
                }
            }
        }
    }
    
    func zeroingProgressBar() {
        self.runningProgress.setProgress(to: 0, duration: 0)
        self.walkingProgress.setProgress(to: 0, duration: 0)
        self.runningDay.setProgress(to: 0, duration: 0)
        self.walkingDay.setProgress(to: 0, duration: 0)
    }
}
