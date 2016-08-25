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

    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Functions
    
    func getListToDisplay(list: [String]) {
        self.list = list
        tableView.reloadData()
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
        backGroundView?.backgroundColor = indexPath.row == 0 ? UIColor.init(colorLiteralRed: 142/255.0, green: 36/255.0, blue: 170/255.0, alpha: 1.0) : UIColor.init(colorLiteralRed: 156/255.0, green: 39/255.0, blue: 176/255.0, alpha: 1.0)
        
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