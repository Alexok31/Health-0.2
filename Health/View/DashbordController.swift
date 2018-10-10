//
//  ViewController.swift
//  Health
//
//  Created by Александр Харченко on 10/4/18.
//  Copyright © 2018 Александр Харченко. All rights reserved.
//

import UIKit
import UICircularProgressRing
import FSCalendar
import ScrollableGraphView
import AAInfographics

class DashbordController: UIViewController {
    
    @IBOutlet weak var walkingProgress: UICircularProgressRingView!
    @IBOutlet weak var runningProgress: UICircularProgressRingView!
    
    @IBOutlet weak var walkingDay: UICircularProgressRingView!
    @IBOutlet weak var runningDay: UICircularProgressRingView!

    @IBOutlet weak var calendarView: FSCalendar!
    @IBOutlet weak var pressureView: UIView!
    
    @IBOutlet weak var dayliChart: ScrollableGraphView!
   
    @IBOutlet weak var numderOfStepsPerDay: UILabel!
    @IBOutlet weak var numberOfStepsWalking: UILabel!
    @IBOutlet weak var walkingTitle: UILabel!
    @IBOutlet weak var numberOfStepsRunning: UILabel!
    @IBOutlet weak var runningTitle: UILabel!
    @IBOutlet weak var lowerPressureLabel: UILabel!
    @IBOutlet weak var upperPressureLabel: UILabel!
    

    @IBOutlet weak var calendarBottom: NSLayoutConstraint!
    @IBOutlet weak var topBarConstraint: NSLayoutConstraint!
    @IBOutlet weak var runningTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var runningRightConstraint: NSLayoutConstraint!
    @IBOutlet weak var walkingTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var progressTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var numberStepsTopConstraint: NSLayoutConstraint!
    
    
    @IBAction func movingConstraint(_ sender: UIPanGestureRecognizer) {
        animationMoveConstraint(sender, constraint: walkingTopConstraint, startConstant: 355, endConstant: 10, divider: 2)
        animationMoveConstraint(sender, constraint: runningTopConstraint, startConstant: 355, endConstant: 10, divider: 2)
        animationMoveConstraint(sender, constraint: runningRightConstraint, startConstant: 20, endConstant: -60, divider: 10)
        animationMoveConstraint(sender, constraint: numberStepsTopConstraint, startConstant: 153, endConstant: 15, divider: 10)
        animationMoveConstraint(sender, constraint: progressTopConstraint, startConstant: 65, endConstant: -80, divider: 10)
        animationFadeOutLabel(sender, labelfFade1: numberOfStepsWalking, labelfFade2: walkingTitle, labelfFade3: numberOfStepsRunning, labelfFade4: runningTitle, constraint: walkingTopConstraint, startConstant: 355, endConstant: 10, viewFade1: runningProgress, viewFade2: dayliChart)
        animationCalendarView(sender)
    }
    
    
    let dashbordHelper = DashbordHelper()
    
    let meteringDate = "2018-10-07"
    var runningSteps = 700
    var walkingSteps = 5000
    var lowerPressure = 60
    var upperPressure = 120
    
    let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabel()
        calendarView.scope = .week
        setupNavigationBar()
        setupDaylyChart()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        dailyWalkingSteps(steps: walkingSteps)
        dailyRunningSteps(steps: runningSteps)
    }
    
    func setupNavigationBar(){
        navigationController?.navigationBar.barTintColor = UIColor(displayP3Red: 105/255, green: 192/255, blue: 232/255, alpha: 1)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    func setupLabel() {
        numderOfStepsPerDay.text = "\(walkingSteps + runningSteps)"
        numberOfStepsWalking.text = "\(walkingSteps)"
        numberOfStepsRunning.text = "\(runningSteps)"
        lowerPressureLabel.text = "\(lowerPressure)"
        upperPressureLabel.text = "\(upperPressure)"
    }
    
    func setupDaylyChart() {
        let walkingColor = UIColor(displayP3Red: 106/255, green: 192/255, blue: 231/255, alpha: 1)
        let runningColor = UIColor(displayP3Red: 160/255, green: 227/255, blue: 252/255, alpha: 1)
        initDayliChartView("running", color: runningColor)
        initDayliChartView("walking", color: walkingColor)
    }
    

    func dailyWalkingSteps(steps: Int) {
        dashbordHelper.dailyRateInPercent(steps: steps) { (walkingPercentage) in
            let percent = CGFloat(walkingPercentage)
            self.runningProgress.startAngle = CGFloat((Double(walkingPercentage) * 3.6) - 90)
            self.runningDay.startAngle = CGFloat((Double(walkingPercentage) * 3.6) - 90)
            
            self.walkingProgress.setProgress(to: percent, duration: 1)
            self.walkingDay.setProgress(to: percent, duration: 1)
        }
    }
    
    func dailyRunningSteps(steps: Int) {
        dashbordHelper.dailyRateInPercent(steps: steps) { (runningSteps) in
            let percent = CGFloat(runningSteps)
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.runningProgress.setProgress(to: percent, duration: 1)
                self.runningDay.setProgress(to: percent, duration: 1)
            }
        }
    }

}

