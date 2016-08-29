//
//  InviteTableViewCell.swift
//  Meanwise
//
//  Created by Vishal on 29/08/16.
//  Copyright © 2016 Squelo. All rights reserved.
//

import UIKit

class InviteTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var buttonTextLabel: UILabel!
    
    // MARK: - Awake
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - Functions
    
    func setInviteCell(text: NSAttributedString, iconName: String) {
        iconImageView.image = UIImage(named: iconName)
        buttonTextLabel.attributedText = text
    }
    
    // MARK: - Selection

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension InviteTableViewCell {
    
    @IBAction func buttonTapped(sender: AnyObject) {
        
    }
    
}
