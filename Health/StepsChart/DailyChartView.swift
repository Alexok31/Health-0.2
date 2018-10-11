//
//  dailyChartView.swift
//  Health
//
//  Created by Александр Харченко on 10/10/18.
//  Copyright © 2018 Александр Харченко. All rights reserved.
//

import Foundation
import ScrollableGraphView

extension DashbordController: ScrollableGraphViewDataSource {
    
    func initDayliChartView(_ identifier: String, color: UIColor){
        dayliChart.dataSource = self
        dayliChart.shouldAdaptRange = true
        let barPlot = BarPlot(identifier: identifier)
        barPlot.barWidth = 10
        barPlot.barLineWidth = 1
        barPlot.barLineColor = UIColor.clear
        barPlot.barColor = color
        barPlot.adaptAnimationType = ScrollableGraphViewAnimationType.easeOut
        barPlot.animationDuration = 0.5
        barPlot.shouldRoundBarCorners = true
        // Setup the reference lines
        let referenceLines = ReferenceLines()
        referenceLines.referenceLineLabelFont = UIFont.boldSystemFont(ofSize: 8)
        referenceLines.referenceLineColor = UIColor(displayP3Red: 197/255, green: 198/255, blue: 202/255, alpha: 1)
        referenceLines.referenceLineLabelColor = UIColor(displayP3Red: 55/255, green: 55/255, blue: 55/255, alpha: 1)
        referenceLines.dataPointLabelColor = UIColor(displayP3Red: 55/255, green: 55/255, blue: 55/255, alpha: 1)
        referenceLines.shouldAddLabelsToIntermediateReferenceLines = true
        // Add everything
        dayliChart.addPlot(plot: barPlot)
        dayliChart.addReferenceLines(referenceLines: referenceLines)
    }
    
    func value(forPlot plot: Plot, atIndex pointIndex: Int) -> Double {
        switch(plot.identifier) {
        case "running":
            var array = stepsChartData.sumArray()
            return Double(array[pointIndex])
        case "walking":
            var array = stepsChartData.dayWalkingSteps
            return Double(array[pointIndex])
        default:
            return 0
        }
    }
    
    func label(atIndex pointIndex: Int) -> String {
        return "\(stepsChartData.hoursInDay[pointIndex])"
    }
    
    func numberOfPoints() -> Int {
        return 24
    }
}
