//
//  NewPostViewController.swift
//  Meanwise
//
//  Created by Vishal on 16/09/16.
//  Copyright © 2016 Squelo. All rights reserved.
//

import UIKit

class NewPostViewController: BaseViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var placeholderLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollViewBottomConstraint: NSLayoutConstraint!

    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        topBarSetup()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        registerForNotifications()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        deRegisterForNotification()
    }
    
    // MARK: - Functions
    
    func topBarSetup() {
        navigationController?.navigationBarHidden = true
        UIApplication.sharedApplication().statusBarHidden = false
    }
    
    // MARK: - Memory Management

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension NewPostViewController: UITextViewDelegate {
    
    func textViewDidChange(textView: UITextView) {
        placeholderLabel.hidden = textView.text.characters.count > 0
    }
    
    @IBAction func postButtonTapped(sender: AnyObject) {
    }
    
    @IBAction func swipeDown(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}

// MARK: - ScrollView Delegate

extension NewPostViewController: UIScrollViewDelegate {
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        let scrollOffset = scrollView.contentOffset.y;
        
        if (scrollOffset == 0 && scrollView.panGestureRecognizer.translationInView(scrollView.superview).y > 0) {
            dismissViewControllerAnimated(true, completion: nil)
        }
        
    }
    
}

// MARK: - KeyBoard Notification Methods

extension NewPostViewController {
    
    override func keyboardWillShow(notification: NSNotification) {
        let info = notification.userInfo!
        let keyboardFrame: CGRect = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        
        scrollViewBottomConstraint.constant = keyboardFrame.size.height
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.view.layoutIfNeeded()
        })

        scrollView.scrollRectToVisible(textField.frame, animated: true)
    }
    
    override func keyboardWillHide(notification: NSNotification) {
        
        scrollViewBottomConstraint.constant = 0
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.view.layoutIfNeeded()
        })
    }
    
}
