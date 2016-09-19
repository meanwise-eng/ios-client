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
    
    @IBOutlet weak private var placeholderLabel: UILabel!
    @IBOutlet weak private var textView: UITextView!
    @IBOutlet weak private var textField: UITextField!
    @IBOutlet weak private var scrollView: UIScrollView!
    @IBOutlet weak private var scrollViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak private var collectionView: UICollectionView!
    @IBOutlet weak private var remainingCharactersLabel: UILabel!
    
    // MARK: - Variables
    
    var imagesFromDevice: NSArray = []
    
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
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        getImagesFromDevice()
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
    
    func getImagesFromDevice() {
        let mediaManager = MediaManager()
        
        dispatch_async(dispatch_get_main_queue()) { 
            self.imagesFromDevice = NSArray(array: mediaManager.getImages())
            self.collectionView.reloadData()
        }

    }
    
    // MARK: - Memory Management

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// MARK: - IBAction

extension NewPostViewController {
    
    @IBAction func postButtonTapped(sender: AnyObject) {
  
    }
    
    @IBAction func channelButtonTapped(sender: AnyObject) {
        let chooseChannelViewController = ChooseChannelViewController.initFromStoryboard()
        presentViewController(chooseChannelViewController, animated: true, completion: nil)
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

// MARK: - TextField, TextView Delegate

extension NewPostViewController: UITextFieldDelegate, UITextViewDelegate {
    
    func textViewDidChange(textView: UITextView) {
        placeholderLabel.hidden = textView.text.characters.count > 0
        
        remainingCharactersLabel.text = "\(200 - textView.text.characters.count)"
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        
        let newText = (textView.text! as NSString).stringByReplacingCharactersInRange(range, withString: text)
        
        return newText.characters.count < 201
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        if textField.text?.characters.count == 0 && string != "@" {
            textField.text = "@\(string)"
            return false
        }
        
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        textView.becomeFirstResponder()
        return true
    }
    
}

// MARK: - CollectionView DataSource Delegate

extension NewPostViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesFromDevice.count > 3 ? 3 : imagesFromDevice.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(Constants.CollectionViewCell.Image, forIndexPath: indexPath)
        let imageView = cell.viewWithTag(5) as! UIImageView
        imageView.image = imagesFromDevice.objectAtIndex(indexPath.row) as? UIImage
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let screenWidth = UIScreen.mainScreen().bounds.width - 2.0
        return CGSizeMake(screenWidth/3.0, screenWidth/3.0)
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
