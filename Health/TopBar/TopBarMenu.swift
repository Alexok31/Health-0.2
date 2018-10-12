//
//  TopBarMenu.swift
//  Health
//
//  Created by Александр Харченко on 10/12/18.
//  Copyright © 2018 Александр Харченко. All rights reserved.
//

import Foundation
import UIKit

extension StepsController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "barId", for: indexPath) as! TopBarCell
        let icon = ["steps", "iconFire", "iconCompass", "iconClock", "iconSleap"]
        cell.iconImage.image = UIImage(named: icon[indexPath.row])?.withRenderingMode(.alwaysTemplate)
        cell.iconImage.tintColor = UIColor(displayP3Red: 158/255, green: 224/255, blue: 249/255, alpha: 1)
      
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! TopBarCell
        cell.iconImage.tintColor = UIColor.white
    }
    
    // change background color back when user releases touch
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! TopBarCell
        cell.iconImage.tintColor = UIColor(displayP3Red: 158/255, green: 224/255, blue: 249/255, alpha: 1)
    }

   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let viewWidth = collectionView.frame.width
        
        let IndentEdge = CGFloat(20)
        let cellWidth = CGFloat(30)
        
        flowLayout.minimumLineSpacing = (((2 * IndentEdge) - (5 * cellWidth) + viewWidth) / 6) + 3
        return UIEdgeInsets(top: 0, left: IndentEdge, bottom: 0, right: IndentEdge)
    }
    
}
