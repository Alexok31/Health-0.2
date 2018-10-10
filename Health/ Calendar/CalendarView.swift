//
//  CalendarView.swift
//  Health
//
//  Created by Александр Харченко on 10/5/18.
//  Copyright © 2018 Александр Харченко. All rights reserved.
//

import Foundation
import FSCalendar

extension DashbordController : FSCalendarDataSource, FSCalendarDelegate, FSCalendarDelegateAppearance {
    
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        self.runningProgress.setProgress(to: 0, duration: 0)
        self.walkingProgress.setProgress(to: 0, duration: 0)
        self.runningDay.setProgress(to: 0, duration: 0)
        self.walkingDay.setProgress(to: 0, duration: 0)
      
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            if self.meteringDate == self.formatter.string(from: date) {
                self.runningSteps = 400
                self.walkingSteps = 2000
                self.lowerPressure = 80
                self.upperPressure = 149
                self.dailyWalkingSteps(steps: self.walkingSteps)
                self.dailyRunningSteps(steps: self.runningSteps)
                self.setupLabel()
            } else {
                self.runningSteps = 2000
                self.walkingSteps = 4000
                self.lowerPressure = 60
                self.upperPressure = 120
                self.dailyWalkingSteps(steps: self.walkingSteps)
                self.dailyRunningSteps(steps: self.runningSteps)
                self.setupLabel()
            }
        }
     
    }
}
