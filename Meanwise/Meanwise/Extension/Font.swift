//
//  Font.swift
//  Meanwise
//
//  Created by Vishal on 26/08/16.
//  Copyright © 2016 Squelo. All rights reserved.
//

import Foundation
import UIKit

// MARK: - UIFont

extension UIFont {

    // System Fonts methods
    class func defaultSystemFontOfSize(size: CGFloat) -> UIFont {
        return systemFontOfSize(size)
    }

    // Custom Font methods
    class func normalFontOfSize(size: CGFloat) -> UIFont {
        return UIFont(name: "OpenSans", size: size)!
    }

    class func boldFontOfSize(size: CGFloat) -> UIFont {
        return UIFont(name: "OpenSans-Bold", size: size)!
    }

    class func lightFontOfSize(size: CGFloat) -> UIFont {
        return UIFont(name: "OpenSans-Light", size: size)!
    }

    class func semiBoldFontOfSize(size: CGFloat) -> UIFont {
        return UIFont(name: "OpenSans-Semibold", size: size)!
    }

    class func extraBoldFontOfSize(size: CGFloat) -> UIFont {
        return UIFont(name: "OpenSans-Extrabold", size: size)!
    }
}

