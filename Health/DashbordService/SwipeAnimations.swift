//
//  SwipeAnimations.swift
//  Health
//
//  Created by Александр Харченко on 10/8/18.
//  Copyright © 2018 Александр Харченко. All rights reserved.
//

import UIKit

extension DashbordController {
    
    func animationCalendarView(_ sender: UIPanGestureRecognizer) {
        if sender.state == .began || sender.state == .changed {
            let translation = sender.translation(in: self.view).y
            
            if translation < 0 {
                //swipe UP
                if calendarBottom.constant < -40 {
                    UIView.animate(withDuration: 0.5, animations: {
                        self.calendarBottom.constant -= translation / 5
                        self.topBarConstraint.constant += translation / 15
                        self.view.layoutIfNeeded()
                    })
                }
                if calendarBottom.constant > -50 {
                    self.calendarView.setScope(.month, animated: true)
                }
                
            } else { //swipe Down
                if calendarBottom.constant > -162 {
                    UIView.animate(withDuration: 0.5, animations: {
                        self.calendarBottom.constant -= translation / 5
                        self.topBarConstraint.constant += translation / 15
                        self.view.layoutIfNeeded()
                    })
                }
                
            } //end (values constrant)
        } else if sender.state == .ended {
            if calendarBottom.constant > -40 {
                UIView.animate(withDuration: 0.5, animations: {
                    self.calendarBottom.constant = 0
                    self.walkingTopConstraint.constant = 10
                    self.runningTopConstraint.constant = 10
                    self.runningRightConstraint.constant = -60
                    self.topBarConstraint.constant = -60
                    self.progressTopConstraint.constant = -80
                    self.numberStepsTopConstraint.constant = 10
                    self.numberOfStepsWalking.alpha = 0
                    self.walkingTitle.alpha = 0
                    self.numberOfStepsRunning.alpha = 0
                    self.runningTitle.alpha = 0
                    self.runningProgress.alpha = 0
                    self.pressureView.alpha = 0
                    self.dayliChart.alpha = 1
                    self.view.layoutIfNeeded()
                })
                
            } else { //begin (values constrant)
                UIView.animate(withDuration: 0.5, animations: {
                    self.calendarView.setScope(.week, animated: true)
                    self.calendarBottom.constant = -162
                    self.walkingTopConstraint.constant = 355
                    self.runningTopConstraint.constant = 355
                    self.runningRightConstraint.constant = 20
                    self.progressTopConstraint.constant = 65
                    self.numberStepsTopConstraint.constant = 153
                    self.topBarConstraint.constant = 0
                    self.numberOfStepsWalking.alpha = 1
                    self.walkingTitle.alpha = 1
                    self.numberOfStepsRunning.alpha = 1
                    self.runningTitle.alpha = 1
                    self.runningProgress.alpha = 1
                     self.pressureView.alpha = 1
                    self.dayliChart.alpha = 0
                    self.view.layoutIfNeeded()
                })
            }
        }
    }
    
    func animationMoveConstraint(_ sender: UIPanGestureRecognizer, constraint: NSLayoutConstraint, startConstant: CGFloat, endConstant: CGFloat, divider: CGFloat) {
        if sender.state == .began || sender.state == .changed {
            let translation = sender.translation(in: self.view).y
            
            if translation < 0 {
                //swipe UP
                if constraint.constant > endConstant {
                    UIView.animate(withDuration: 0.5, animations: {
                        constraint.constant += translation / divider
                        self.view.layoutIfNeeded()
                    })
                }
            } else { //swipe Down
                if constraint.constant < startConstant {
                    UIView.animate(withDuration: 0.5, animations: {
                        constraint.constant += translation / divider
                        self.view.layoutIfNeeded()
                    })
                }
            }
        }
    }
    
    func animationFadeOutLabel(_ sender: UIPanGestureRecognizer, labelfFade1: UILabel, labelfFade2: UILabel, labelfFade3: UILabel, labelfFade4: UILabel, constraint: NSLayoutConstraint, startConstant: CGFloat, endConstant: CGFloat, viewFade1: UIView, viewFade2: UIView, viewFade3: UIView)  {
        if sender.state == .began || sender.state == .changed {
            let translation = sender.translation(in: self.view).y
            
            if translation < 0 {
                //swipe UP
                if constraint.constant < 200 {
                    UIView.animate(withDuration: 0.5, animations: {
                        labelfFade1.alpha -= 0.04
                        labelfFade2.alpha -= 0.04
                        labelfFade3.alpha -= 0.04
                        labelfFade4.alpha -= 0.04
                        viewFade1.alpha -= 0.02
                        viewFade3.alpha -= 0.05
                        viewFade2.alpha += 0.04
                        self.view.layoutIfNeeded()
                    })
                }
            } else { //swipe Down
                if constraint.constant > 200 {
                    UIView.animate(withDuration: 0.5, animations: {
                        viewFade1.alpha += 0.02
                        viewFade3.alpha += 0.05
                        viewFade2.alpha -= 0.04
                        self.view.layoutIfNeeded()
                    })
                }
            }
        }
    }
}
