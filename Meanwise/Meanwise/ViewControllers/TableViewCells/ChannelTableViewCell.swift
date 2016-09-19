//
//  ChannelTableViewCell.swift
//  Meanwise
//
//  Created by Vishal on 19/09/16.
//  Copyright © 2016 Meanwise. All rights reserved.
//

import UIKit

class ChannelTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak private var channelPicButton: UIButton!
    @IBOutlet weak private var channelNameLabel: UILabel!

    // MARK: - Awake Method
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - Public Method
    
    func setValueToCell(channelName: String, labelColor: UIColor, channelImage: UIImage) {
        channelPicButton.setImage(channelImage, forState: .Normal)
        channelNameLabel.text = channelName
        channelNameLabel.textColor = labelColor
    }
    
}

