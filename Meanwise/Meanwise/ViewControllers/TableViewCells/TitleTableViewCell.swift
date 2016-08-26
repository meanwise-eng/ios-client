//
//  TitleTableViewCell.swift
//  Meanwise
//
//  Created by Vishal on 24/08/16.
//  Copyright © 2016 Squelo. All rights reserved.
//

import UIKit

class TitleTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!

    // MARK: - Awake Method

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // Mark: - Public Methods
    
    func setValuesToCell(titleText: String) {
        titleLabel.text = titleText
    }
    
    func setValuesToCell(titleText: String, subTitleText: String) {
        titleLabel.text = titleText
        subTitleLabel.text = subTitleText
    }

    // MARK: - Selection Method

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
