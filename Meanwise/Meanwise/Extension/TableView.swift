//
//  TableView.swift
//  Meanwise
//
//  Created by Vishal on 13/09/16.
//  Copyright © 2016 Squelo. All rights reserved.
//

import Foundation
import UIKit

// MARK: TableView

extension UITableView {
    
    // Get the rect of Cell in Superview(top most)
    func rectOfCellInSuperviewAtIndexPath(indexPath: NSIndexPath) -> CGRect {
        let rectOfCellInTableView = rectForRowAtIndexPath(indexPath)
        return convertRect(rectOfCellInTableView, toView: nil)
    }
    
}