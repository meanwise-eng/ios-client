//
//  DropdownViewController.swift
//  Meanwise
//
//  Created by Vishal on 25/08/16.
//  Copyright © 2016 Squelo. All rights reserved.
//

import UIKit

protocol DropdownProtocol {
    func valueSelected(indexPath: NSIndexPath, value: AnyObject)
}

class DropdownViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variables
    
    var list: [String] = []
    var delegate: DropdownProtocol?
    var selectedCellColor: UIColor!
    var cellColor: UIColor!
    var separatorImageName: String!
    var tableViewbackgroundColor: UIColor!


    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableView.backgroundColor = tableViewbackgroundColor
    }
    
    // MARK: - Functions
    
    func getListToDisplay(list: [String]) {
        self.list = list
        tableView.reloadData()
    }

    func setCellColor(selectedCellColor: UIColor, cellColor: UIColor, separatorImageName: String) {
        self.selectedCellColor = selectedCellColor
        self.cellColor = cellColor
        self.separatorImageName = separatorImageName
    }
    
    func setTableViewBackgroundColor(color: UIColor) {
        tableViewbackgroundColor = color
    }
    
    // MARK: - Memory Management
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension DropdownViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.TableViewCell.Dropdown, forIndexPath: indexPath)
        
        let backGroundView = cell.viewWithTag(10)
        backGroundView?.backgroundColor = indexPath.row == 0 ? selectedCellColor: cellColor

        let separator = cell.viewWithTag(20) as? UIImageView
        separator?.image = UIImage(named: separatorImageName!)
        
        let textLabel = cell.viewWithTag(5) as? UILabel
        textLabel!.text = list[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if delegate != nil {
            delegate?.valueSelected(indexPath, value: list[indexPath.row])
        }
    }
    
}