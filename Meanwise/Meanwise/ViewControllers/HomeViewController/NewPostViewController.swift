//
//  NewPostViewController.swift
//  Meanwise
//
//  Created by TechRacers on 16/09/16.
//  Copyright © 2016 Squelo. All rights reserved.
//

import UIKit

class NewPostViewController: BaseViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var placeholderLabel: UILabel!
    @IBOutlet weak var textView: UITextView!

    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        topBarSetup()
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
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
