//
//  SwipeAnimations.swift
//  Health
//
//  Created by Александр Харченко on 10/8/18.
//  Copyright © 2018 Александр Харченко. All rights reserved.
//

import Foundation
import UIKit
import FSCalendar

extension DashbordController {
    
    func animationCalendarView(_ sender: UIPanGestureRecognizer) {
        if sender.state == .began || sender.state == .changed {
            let translation = sender.translation(in: self.view).y
            
            if translation < 0 {
                //swipe UP
                if calendarBottom.constant < 0 {
                    UIView.animate(withDuration: 0.5, animations: {
                        self.calendarBottom.constant -= translation / 10
                        self.topBarConstraint.constant += translation / 30
                        self.view.layoutIfNeeded()
                    })
                }
                if calendarBottom.constant > -20 {
                    self.calendarView.setScope(.month, animated: true)
                }
                
            } else { //swipe Down
                if calendarBottom.constant > -162 {
                    UIView.animate(withDuration: 0.5, animations: {
                        self.calendarView.setScope(.week, animated: true)
                        self.calendarBottom.constant -= translation / 10
                        self.topBarConstraint.constant += translation / 30
                        self.view.layoutIfNeeded()
                    })
                }
            }
        } else if sender.state == .ended {
            if calendarBottom.constant > -10 {
                UIView.animate(withDuration: 0.5, animations: {
                    self.calendarBottom.constant = 0
                    self.topBarConstraint.constant = -60
                    self.view.layoutIfNeeded()
                })
                
            } else {
                UIView.animate(withDuration: 0.5, animations: {
                    self.calendarBottom.constant = -162
                    self.topBarConstraint.constant = 0
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
                        constraint.constant += translation / 2
                        self.view.layoutIfNeeded()
                    })
                }
            }
        } else if sender.state == .ended {
            if constraint.constant > endConstant {
                UIView.animate(withDuration: 0.5, animations: {
                    constraint.constant = startConstant
                    self.view.layoutIfNeeded()
                })
                
            } else {
                UIView.animate(withDuration: 0.5, animations: {
                    constraint.constant = endConstant
                    self.view.layoutIfNeeded()
                })
            }
        }
    }
}
