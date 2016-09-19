//
//  RepliesViewController.swift
//  Meanwise
//
//  Created by Vishal on 05/09/16.
//  Copyright © 2016 Squelo. All rights reserved.
//

import UIKit

class RepliesViewController: BaseViewController {

    // MARK: - IBOutlets
    
    @IBOutlet var repliesTableView: UITableView!
    @IBOutlet weak var bottomViewBottomConstraint: NSLayoutConstraint!

    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        registerForNotifications()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        deRegisterForNotification()
    }
    
    // MARK: - Memory Management
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

    // MARK: - TableView DataSource & Delegate

extension RepliesViewController:UITableViewDelegate,UITableViewDataSource {

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.TableViewCell.Replies) as! RepliesTableViewCell
        return cell
    }

}

    // MARK: - IBAction

extension RepliesViewController {
    
    @IBAction func backButtonTapped(sender: AnyObject) {
        
    }
    
}

    // MARK: - KeyBoard Notification Methods

extension RepliesViewController {
    
    override func keyboardWillShow(notification: NSNotification) {
        let info = notification.userInfo!
        let keyboardFrame: CGRect = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        
        bottomViewBottomConstraint.constant = keyboardFrame.size.height
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.view.layoutIfNeeded()
        })
        repliesTableView.scrollEnabled = true
    }
    
    override func keyboardWillHide(notification: NSNotification) {
        
        bottomViewBottomConstraint.constant = 0
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.view.layoutIfNeeded()
        })
        
    }
    
}
