//
//  TextfieldTableViewCell.swift
//  Meanwise
//
//  Created by Vishal on 23/08/16.
//  Copyright © 2016 Squelo. All rights reserved.
//

import UIKit

class TextfieldTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var checkmarkImageView: UIImageView!
    @IBOutlet weak var textfield: UITextField!
    
    // MARK: - Awake Method

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // Mark: - 
    
    func setValuesToCell(titleLabel: UILabel) {
        
    }
    
    // MARK: - Selection Method

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
