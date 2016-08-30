//
//  LoginViewController.swift
//  Meanwise
//
//  Created by Vishal on 26/08/16.
//  Copyright © 2016 Squelo. All rights reserved.
//

import UIKit
import Foundation

class LoginViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var createButton:UIButton!
    @IBOutlet weak var bySignUpTextView:UITextView!

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
        createButton.layer.borderColor = UIColor(red:1.0, green: 1.0, blue: 1.0, alpha: 0.5).CGColor

        let attributedString = NSMutableAttributedString(string:"By signing up, I agree to Meanwise’s Terms of Service and Privacy Policy")
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
