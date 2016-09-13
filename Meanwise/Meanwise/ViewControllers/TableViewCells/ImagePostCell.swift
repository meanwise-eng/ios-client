//
//  ImagePostCell.swift
//  Meanwise
//
//  Created by Vishal on 07/09/16.
//  Copyright © 2016 Squelo. All rights reserved.
//

import UIKit

class ImagePostCell: PostCell {

 
}

extension ImagePostCell {
    // MARK: - Methods
    
    func setValuesToCell(imageName: String) {
        backgroundImageView.image = UIImage(named: imageName)
    }
    
}
