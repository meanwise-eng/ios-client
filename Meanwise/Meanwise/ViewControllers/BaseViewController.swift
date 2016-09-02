//
//  BaseViewController.swift
//  Meanwise
//
//  Created by Vishal on 23/08/16.
//  Copyright © 2016 Squelo. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    // MARK: - Vatiables
    var tapGesture: UITapGestureRecognizer!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addTapGesture()
    }
    
    // MARK: - Functions

    func addTapGesture() {
        tapGesture = UITapGestureRecognizer()
        tapGesture.delegate = self
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }

    func handleTap() {
        view.endEditing(true)
    }
    
    // MARK: - Memory Management
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getPresentCustomAnimation() -> CATransition {
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = kCATransitionFade
        transition.subtype = kCATransitionFromBottom
        return transition
    }
}

extension BaseViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldReceiveTouch touch: UITouch) -> Bool {
        if (!(touch.view is UIControl) && !(touch.view is UITextView) && !(touch.view is UITextField))  {
            handleTap()
        }
        return true
    }
}

