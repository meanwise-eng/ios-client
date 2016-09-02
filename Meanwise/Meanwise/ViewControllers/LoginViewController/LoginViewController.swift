//
//  LoginViewController.swift
//  Meanwise
//
//  Created by Vishal on 26/08/16.
//  Copyright © 2016 Squelo. All rights reserved.
//

import UIKit
import Foundation

class LoginViewController: BaseViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var createButton:UIButton!
    @IBOutlet weak var bySignUpTextView:UITextView!
    @IBOutlet weak var titleLabel:UILabel!

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
         defaultSetting()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = true
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }

    // MARK: - Functions

    func defaultSetting()  {
        
        createButton.layer.borderWidth = 1
        createButton.layer.borderColor = UIColor.whiteColor().CGColor
        
        titleLabel.text = NSLocalizedString("WorkLifeBalance", comment: "label title")
        
        let attributedString = NSMutableAttributedString(string:NSLocalizedString("TermsOfService", comment: "terms of service text"))
        attributedString.setAsLink("Terms of Service", linkURL: "https://www.google.co.in")
        attributedString.setAsLink("Privacy Policy", linkURL: "https://www.google.co.in")
        
        bySignUpTextView.attributedText = attributedString
        bySignUpTextView.linkTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor(),NSUnderlineColorAttributeName:UIColor.whiteColor(),NSUnderlineStyleAttributeName : NSUnderlineStyle.StyleSingle.rawValue]
        bySignUpTextView.textColor = UIColor.whiteColor()
        bySignUpTextView.delegate = self
    }

    // MARK: - Memory Management

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension NSMutableAttributedString {

    public func setAsLink(textToFind:String, linkURL:String) -> Bool {

        let foundRange = self.mutableString.rangeOfString(textToFind)
        if foundRange.location != NSNotFound {
            self.addAttribute(NSLinkAttributeName, value: linkURL, range: foundRange)
            return true
        }
        return false
    }
}

extension LoginViewController:UITextViewDelegate {

    func textView(textView: UITextView, shouldInteractWithURL URL: NSURL, inRange characterRange: NSRange) -> Bool {

//        if URL.scheme ==  "https" {
//            if characterRange.length == 14 {
//                UIApplication.sharedApplication().openURL(URL)
//            }else{
//                UIApplication.sharedApplication().openURL(URL)
//            }
//            return true
//        }
        return false
    }

}

extension LoginViewController {
    
    @IBAction func facebookButtonTapped(sender: AnyObject) {
        
    }
    
    
    @IBAction func createAccountButtonTapped(sender: AnyObject) {
        let storyboard = UIStoryboard(name: Constants.Storyboard.Signup, bundle: nil)
        let vc = storyboard.instantiateInitialViewController()
        self.view.window?.layer.addAnimation(getPresentCustomAnimation(), forKey: kCATransition)
        self.presentViewController(vc!, animated: false, completion:nil)
    }
    
    @IBAction func loginButtonTapped(sender: AnyObject) {
        self.view.window?.layer.addAnimation(getPresentCustomAnimation(), forKey: kCATransition)
        performSegueWithIdentifier(Constants.SegueIdentifiers.LoginEmail, sender: nil)
    }
    
}
