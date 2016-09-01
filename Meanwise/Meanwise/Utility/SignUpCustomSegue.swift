//
//  SignUpCustomSegue.swift
//  Meanwise
//
//  Created by Vishal on 01/09/16.
//  Copyright © 2016 Squelo. All rights reserved.
//

import UIKit

class SignUpCustomSegue: UIStoryboardSegue {

    var percentage:CGFloat = 0.0
    let animationTime = 1.5
    let toViewMultiplication:CGFloat = 2
    let fromViewMultiplication:CGFloat = 2
    let view1Divide:CGFloat = 2.0
    let view2Divide:CGFloat = 2.0
    let view2XMultiplication:CGFloat = 1.5
    let commman:CGFloat = 0.0

    override func perform() {
        animatePush()
    }

    private func animatePush() {
        let toViewController = destinationViewController
        let fromViewController = sourceViewController

        let containerView = fromViewController.view.superview
        let screenBounds = UIScreen.mainScreen().bounds

        let finalToFrame = screenBounds
        toViewController.view.frame = CGRectOffset(finalToFrame, screenBounds.size.width, 0)
        containerView?.addSubview(toViewController.view)

        let screenWidth = UIScreen.mainScreen().bounds.size.width
        let screenHeight = UIScreen.mainScreen().bounds.size.height

        toViewController.view.frame = CGRectMake(toViewMultiplication * screenWidth, commman, screenWidth, screenHeight)

        let  view1 = UIView(frame: CGRectMake(screenWidth, commman, screenWidth/view1Divide, screenHeight))
        view1.backgroundColor = fromViewController.view.backgroundColor
        let  view2 = UIView(frame: CGRectMake(view2XMultiplication * screenWidth, commman, screenWidth/view2Divide, screenHeight))
        view2.backgroundColor = toViewController.view.backgroundColor

        let window = UIApplication.sharedApplication().keyWindow
        window?.insertSubview(toViewController.view, aboveSubview: fromViewController.view)
        window?.insertSubview(view1, aboveSubview: fromViewController.view)
        window?.insertSubview(view2, aboveSubview: fromViewController.view)

        UIView.animateWithDuration(animationTime, animations: {
            toViewController.view.frame = CGRectOffset(toViewController.view.frame, -self.toViewMultiplication * screenWidth, self.commman)
            view1.frame = CGRectOffset(view1.frame, -self.view1Divide * screenWidth, self.commman)
            view2.frame = CGRectOffset(view2.frame, -self.view2Divide * screenWidth, self.commman)
            fromViewController.view.frame = CGRectOffset(fromViewController.view.frame, -self.fromViewMultiplication * screenWidth, self.commman)
            }, completion: { finished in
                let fromVC = self.sourceViewController
                let toVC = self.destinationViewController
                fromVC.presentViewController(toVC, animated: false, completion: nil)
        })
    }
    
}
