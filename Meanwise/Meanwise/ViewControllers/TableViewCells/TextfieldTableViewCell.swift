//
//  TextfieldTableViewCell.swift
//  Meanwise
//
//  Created by Vishal on 23/08/16.
//  Copyright © 2016 Squelo. All rights reserved.
//

import UIKit

protocol TextfieldTableViewCellProtocol {
    func textFieldDidEndEditing(text: String, indexPath: NSIndexPath)
    func textFieldShouldReturn(indexPath: NSIndexPath)
    func textFieldDidBeginEditing(indexPath: NSIndexPath)
}

class TextfieldTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var checkmarkImageView: UIImageView!
    @IBOutlet weak var textfield: UITextField!
    
    // MARK: - Variables
    
    var delegate: TextfieldTableViewCellProtocol?
    var indexPath: NSIndexPath!
    
    // MARK: - Awake Method

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // Mark: - Public Methods
    
    func setValuesToCell(titleText: String, indexPath: NSIndexPath) {
        titleLabel.text = titleText
        self.indexPath = indexPath
    }
    
    func setFirstResponder() {
        textfield.becomeFirstResponder()
    }
    
    func endFirstResponder() {
        textfield.resignFirstResponder()
    }
    
    // MARK: - Selection Method

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension TextfieldTableViewCell: UITextFieldDelegate {
    
    @IBAction func textFieldDidChange(sender: AnyObject) {
        checkmarkImageView.hidden = textfield.text?.characters.count < 1
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        delegate?.textFieldDidBeginEditing(indexPath)
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        
        delegate?.textFieldDidEndEditing(textField.text!, indexPath: indexPath)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        delegate?.textFieldShouldReturn(indexPath)
        return true
    }
}
