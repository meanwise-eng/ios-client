//
//  RepliesTableViewCell.swift
//  Meanwise
//
//  Created by Vishal on 05/09/16.
//  Copyright © 2016 Squelo. All rights reserved.
//

import UIKit

class RepliesTableViewCell: UITableViewCell {

    @IBOutlet weak var postImageButton: UIButton!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var subtitleLable: UILabel!
    @IBOutlet weak var timeLable: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
         defaultSetting()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func defaultSetting() {

    }

}
