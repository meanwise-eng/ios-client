//
//  SkillTableViewCell.swift
//  Meanwise
//
//  Created by Vishal on 25/08/16.
//  Copyright © 2016 Squelo. All rights reserved.
//

import UIKit

protocol SkillCellProtocol {
    func removeSkill(indexPath: NSIndexPath)
}

class SkillTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    
    @IBOutlet weak var label: UILabel!
    
    // MARK: - Variables
    
    var delegate: SkillCellProtocol?
    var indexPath: NSIndexPath?
    
    // MARK: - Awake
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - Functions

    func setTextToLabel(text: String, indexPath: NSIndexPath) {
        label.text = text
        self.indexPath = indexPath
    }
    
    // MARK: - Selection
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension SkillTableViewCell {
    
    @IBAction func cancelButtonTapped(sender: AnyObject) {
        delegate?.removeSkill(indexPath!)
    }
    
}