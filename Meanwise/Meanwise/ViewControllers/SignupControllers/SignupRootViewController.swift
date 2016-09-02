//
//  SignupRootViewController.swift
//  Meanwise
//
//  Created by Vishal on 02/09/16.
//  Copyright © 2016 Squelo. All rights reserved.
//

import UIKit

class SignupRootViewController: BaseViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var progressView: UIImageView!
    
    // MARK: - Variables
    
    var currentScreenIndex: CGFloat = 0.0
    var showProgressBarAnimation: Bool = true
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if progressView != nil {
            progressView.hidden = true
        }
    }
    
    // MARK: - Functions
    
    func showProgressBar() {
        if progressView != nil {
            progressView.hidden = false
        }
    }
    
    func hideProgressBar() {
        if progressView != nil {
            progressView.hidden = true
        }
    }
    
    // MARK: - Memory Management
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension SignupRootViewController {
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue is SignUpCustomSegue {
            if showProgressBarAnimation {
                (segue as! SignUpCustomSegue).nextPercentage = (currentScreenIndex + 1)/7.0
                (segue as! SignUpCustomSegue).currentPercentage = currentScreenIndex/7.0
            }
        }
    }
    
    override func segueForUnwindingToViewController(toViewController: UIViewController, fromViewController: UIViewController, identifier: String?) -> UIStoryboardSegue {
        let segue = SignUpCustomUnwindSegue(identifier: identifier, source: fromViewController, destination: toViewController)
        if showProgressBarAnimation {
            segue.nextPercentage = currentScreenIndex/7.0
            segue.currentPercentage = (currentScreenIndex + 1)/7.0
        }
        return segue
    }
    
}
