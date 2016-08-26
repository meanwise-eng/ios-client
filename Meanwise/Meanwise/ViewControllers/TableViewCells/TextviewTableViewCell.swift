//
//  TextviewTableViewCell.swift
//  Meanwise
//
//  Created by Vishal on 26/08/16.
//  Copyright © 2016 Squelo. All rights reserved.
//

import UIKit

protocol TextviewTableViewCellProtocol {
    func textviewDidBeginEditing(indexPath: NSIndexPath)
    func textviewDidChange(text: String, indexPath: NSIndexPath)
}

class TextviewTableViewCell: UITableViewCell {

    // MARK: IBOutlets
    
    @IBOutlet weak var cellHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var checkmarkImageView: UIImageView!
    @IBOutlet weak var wordsRemaining: UILabel!
    
    // MARK: Variables
    
    var delegate: TextviewTableViewCellProtocol?
    var previousRect: CGRect = CGRectZero
    let initialCellHeight: CGFloat = 140
    var indexPath: NSIndexPath!

    // MARK: Awake
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: Functions
    
    func setCellValues(titleText: String, indexPath: NSIndexPath) {
        titleLabel.text = titleText
        self.indexPath = indexPath
    }
    
    func setFirstResponder() {
        textView.becomeFirstResponder()
    }
    
    func endFirstResponder() {
        textView.resignFirstResponder()
    }
    
    // MARK: - Selection

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension TextviewTableViewCell: UITextViewDelegate {
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        let newText = (textView.text as NSString).stringByReplacingCharactersInRange(range, withString: text)
        let numberOfChars = newText.characters.count
        wordsRemaining.text = "\(200 - numberOfChars) words"
        return numberOfChars < 200;
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        delegate?.textviewDidBeginEditing(indexPath)
    }
    
    func textViewDidChange(textView: UITextView) {
        delegate?.textviewDidChange(textView.text, indexPath: indexPath)
    }
}