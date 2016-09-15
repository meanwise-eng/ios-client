//
//  Image.swift
//  Meanwise
//
//  Created by Vishal on 15/09/16.
//  Copyright © 2016 Squelo. All rights reserved.
//

import Foundation
import UIKit

// MARK: View

extension UIImage {
    
    func resizeImage(size: CGSize) -> UIImage {
        
        UIGraphicsBeginImageContext(CGSizeMake(size.width, size.height))
        self.drawInRect(CGRectMake(0, 0, size.width, size.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    func resizeImageForWidth(width: CGFloat) -> UIImage {
        let scale = width / self.size.width
        let newHeight = self.size.height * scale
        
        return resizeImage(CGSize(width: width, height: newHeight))
    }
    
    func resizeImageForHeight(height: CGFloat) -> UIImage {
        let scale = height / self.size.height
        let newWidth = self.size.width * scale
        
        return resizeImage(CGSize(width: newWidth, height: height))
    }
    
    func cropImage(frame: CGRect) -> UIImage {
        // Create bitmap image from context using the rect
        let imageRef: CGImageRef = CGImageCreateWithImageInRect(self.CGImage, frame)!
        
        // Create a new image based on the imageRef and rotate back to the original orientation
        return UIImage(CGImage: imageRef, scale: scale, orientation: imageOrientation)
    }
    
}