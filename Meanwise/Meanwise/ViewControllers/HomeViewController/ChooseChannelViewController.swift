//
//  ChooseChannelViewController.swift
//  Meanwise
//
//  Created by Vishal on 19/09/16.
//  Copyright © 2016 Squelo. All rights reserved.
//

import UIKit

class ChooseChannelViewController: BaseViewController {
    
    // MArk: - IBOutlets
    
    @IBOutlet weak private var tableView: UITableView!
    @IBOutlet weak private var searchPlaceholderLabel: UILabel!
    @IBOutlet weak private var searchIconImageView: UIImageView!
    @IBOutlet weak private var cancelWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak private var textField: UITextField!
    
    // MARK: - View Lifeccyle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // MARK: - Search Bar Setup
    
    func showCancelButton(show: Bool) {
        cancelWidthConstraint.constant = show ? 60 : 0
        searchIconImageView.hidden = show
        searchPlaceholderLabel.hidden = show
        view.layoutIfNeeded()
    }
    
    // MARK: - Memory Management
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// MARK: - Static Method

extension ChooseChannelViewController {
    
    static func initFromStoryboard() -> ChooseChannelViewController {
        let storyboard = UIStoryboard(name: Constants.Storyboard.Home, bundle: nil)
        return storyboard.instantiateViewControllerWithIdentifier(Constants.StoryboardId.ChooseChannel) as! ChooseChannelViewController
    }
    
}

// MARK: - TableView DataSource Delegate

extension ChooseChannelViewController:UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return getChannelPostCell(indexPath)
    }
    
    func getChannelPostCell(indexPath: NSIndexPath) -> ChannelTableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.TableViewCell.Channel) as! ChannelTableViewCell
        cell.setValueToCell("Entertainment", labelColor: UIColor(hexColorCode: "#FF5252"), channelImage: UIImage(named: "SampleEntertainment")!)
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
        dismissViewControllerAnimated(true, completion: nil)        
    }
    
}

// MARK: - IBAction

extension ChooseChannelViewController {
    
    @IBAction private func texFieldDidChange(sender: AnyObject) {

    }
    
    @IBAction private func cancelButtonTapped(sender: AnyObject) {
        textField.text = ""
        textField.resignFirstResponder()
    }
    
}

// MARK: - TextField Delegate

extension ChooseChannelViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(textField: UITextField) {
        showCancelButton(true)
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        showCancelButton(false)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

// MARK: - ScrollView Delegate

extension ChooseChannelViewController: UIScrollViewDelegate {
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        let scrollOffset = scrollView.contentOffset.y;
        
        if (scrollOffset == 0 && scrollView.panGestureRecognizer.translationInView(scrollView.superview).y > 0) {
            dismissViewControllerAnimated(true, completion: nil)
        }
        
    }
    
}
