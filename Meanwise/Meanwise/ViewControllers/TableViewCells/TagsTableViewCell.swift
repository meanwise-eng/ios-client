//
//  TagsTableViewCell.swift
//  Meanwise
//
//  Created by Vishal on 26/08/16.
//  Copyright © 2016 Squelo. All rights reserved.
//

import UIKit

protocol TagsCellProtocol {
    func removeTag(tagName: String)
}

class TagsTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    
    @IBOutlet weak var tagsListView: TagListView!
    
    // MARK: - Variables
    
    var delegate: TagsCellProtocol?
    
    // MARK: - Awake
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        tagsListView.delegate = self
        tagsListView.textFont = UIFont(name: "OpenSans", size: 17)!
    }
    
    // MARK: - Functions
    
    func addTag(tag: String) {
        tagsListView.addTag(tag)
    }

    // MARK: - Memory Management
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension TagsTableViewCell: TagListViewDelegate {
    
    func tagRemoveButtonPressed(title: String, tagView: TagView, sender: TagListView) {
        tagsListView.removeTag(title)
        delegate?.removeTag(title)
    }
    
}
