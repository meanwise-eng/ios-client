//
//  TextfieldTableViewCell.swift
//  Meanwise
//
//  Created by Vishal on 23/08/16.
//  Copyright © 2016 Squelo. All rights reserved.
//

import UIKit

protocol TextfieldTableViewCellProtocol {
    func textFieldShouldReturn(indexPath: NSIndexPath)
    func textFieldDidBeginEditing(indexPath: NSIndexPath)
    func textFieldDidChange(text: String, indexPath: NSIndexPath)
}

class TextfieldTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var partitionLineImageView: UIImageView!
    @IBOutlet weak var checkmarkImageView: UIImageView!
    @IBOutlet weak var addImageView: UIImageView!
    @IBOutlet weak var textfield: UITextField!
    
    // MARK: - Variables
    
    var delegate: TextfieldTableViewCellProtocol?
    var indexPath: NSIndexPath!
    var showAddImage = false
    
    // MARK: - Awake Method

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // Mark: - Public Methods
    
    func setCellForSignupNameScreen(titleText: String, indexPath: NSIndexPath) {
        partitionLineImageView.image = UIImage(named: "PartitionLineOrange")
        setCell(titleText, indexPath: indexPath)
    }
    
    func setCellForEmail(titleText: String, indexPath: NSIndexPath) {
        partitionLineImageView.image = UIImage(named: "PartitionLineBlue")
        setCell(titleText, indexPath: indexPath)
    }
    
    func setCellForPassword(titleText: String, indexPath: NSIndexPath) {
        partitionLineImageView.image = UIImage(named: "PartitionLineBlue")
        textfield.secureTextEntry = true
        setCell(titleText, indexPath: indexPath)
    }
    
    func setCellForSignupSkillsScreen(titleText: String, indexPath: NSIndexPath) {
        partitionLineImageView.image = UIImage(named: "PartitionLinePurple")
        addImageView.hidden = false
        showAddImage = true
        checkmarkImageView.hidden = true
        setCell(titleText, indexPath: indexPath)
    }
    
    func setCellForSignupProfileScreen(titleText: String, indexPath: NSIndexPath) {
        partitionLineImageView.image = UIImage(named: "PartitionLineGreen")
        setCell(titleText, indexPath: indexPath)
    }
    
    func setCell(titleText: String, indexPath: NSIndexPath) {
        titleLabel.text = titleText
        self.indexPath = indexPath
    }
    
    func setCellTextFieldValue(text: String) {
        textfield.text = text
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
        if !showAddImage {
            checkmarkImageView.hidden = textfield.text?.characters.count < 1
        }
        delegate?.textFieldDidChange(textfield.text!, indexPath: indexPath)
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        delegate?.textFieldDidBeginEditing(indexPath)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        delegate?.textFieldShouldReturn(indexPath)
        return true
    }
}
