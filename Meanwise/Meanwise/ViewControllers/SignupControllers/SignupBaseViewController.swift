//
//  SignupBaseViewController.swift
//  Meanwise
//
//  Created by Vishal on 24/08/16.
//  Copyright © 2016 Squelo. All rights reserved.
//

import UIKit

class SignupBaseViewController: BaseViewController {
    
    // MAKE: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var bottomViewBottomConstraint: NSLayoutConstraint!
    
    // MAKE: - Variables
    
    var activeIndexPath: NSIndexPath?
    var isScrollingEnabled = false
    
    //MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableViewSetup()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        registerForNotifications()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        scrollTableView()
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        deRegisterForNotification()
    }
    
    // MARK: - Functions
    
    func tableViewSetup() {
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        
        tableView.scrollEnabled = false
    }
    
    func enableNextButton(enable: Bool) {
        nextButton.alpha = enable ? 1.0 : 0.5
        nextButton.enabled = enable
    }
    
    func scrollTableView() {
        tableView.scrollEnabled = tableView.contentSize.height > tableView.frame.size.height
        isScrollingEnabled = tableView.scrollEnabled
    }
    
    // MARK: - Memory Management

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension SignupBaseViewController {
    
    func registerForNotifications() {
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(SignupBaseViewController.keyboardWillShow(_:)), name:UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(SignupBaseViewController.keyboardWillHide(_:)), name:UIKeyboardWillHideNotification, object: nil)
        
    }
    
    func deRegisterForNotification() {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        let info = notification.userInfo!
        let keyboardFrame: CGRect = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        
        bottomViewBottomConstraint.constant = keyboardFrame.size.height
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.view.layoutIfNeeded()
        })
        
        tableView.scrollEnabled = true
        makeLowerCellVisible()
    }
    
    func keyboardWillHide(notification: NSNotification) {
        
        bottomViewBottomConstraint.constant = 0
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.view.layoutIfNeeded()
        })
        
        tableView.scrollEnabled = isScrollingEnabled
    }
    
    func makeLowerCellVisible() {
        if activeIndexPath != nil {
            tableView.scrollToRowAtIndexPath(activeIndexPath!, atScrollPosition: .Bottom, animated: true)
        }
    }
}
