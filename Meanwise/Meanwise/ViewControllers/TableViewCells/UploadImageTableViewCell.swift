//
//  UploadImageTableViewCell.swift
//  Meanwise
//
//  Created by Vishal on 29/08/16.
//  Copyright © 2016 Squelo. All rights reserved.
//

import UIKit

protocol UploadImageCellProtocol {
    func uploadImage(at indexPath: NSIndexPath)
    func chooseImage(at indexPath: NSIndexPath)
}

class UploadImageTableViewCell: UITableViewCell {

    // MARK: IBOutlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var picImageView: UIImageView!
    
    // MARK: Variables
    
    var delegate: UploadImageCellProtocol!
    var indexPath: NSIndexPath!
    
    // MARK: - Awake
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // MARK: - Function
    
    func setTitleLabelOfCell(title: String, indexPath: NSIndexPath) {
        titleLabel.text = title
        self.indexPath = indexPath
    }
    
    func setImageInCell(image: UIImage) {
        picImageView.image = image
    }
    
    // MARK: - Selection
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension UploadImageTableViewCell {
    
    @IBAction func uploadButtonTapped(sender: AnyObject) {
        delegate.uploadImage(at: indexPath)
    }
    
    @IBAction func selectImageButtonTapped(sender: AnyObject) {
        delegate.chooseImage(at: indexPath)
    }
    
}
