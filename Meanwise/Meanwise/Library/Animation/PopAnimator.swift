//
//  PopAnimator.swift
//  Meanwise
//
//  Created by Vishal on 08/09/16.
//  Copyright © 2016 Squelo. All rights reserved.
//
import UIKit

class PopAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    let duration    = 0.5
    var presenting  = true
    var originFrame = CGRect.zero
    var image: UIImage!
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?)-> NSTimeInterval {
        return duration
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        let containerView = transitionContext.containerView()
        let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        
        
        let toVCFrame = toVC?.view.frame
        let fromVCFrame = fromVC?.view.frame
        
        let imageView = UIImageView(image: image)
        
        let scaleFactor = presenting ? (toVCFrame?.size.height)! / originFrame.size.height : originFrame.size.height / (fromVCFrame?.size.height)!
        
        
        let initialFrame = presenting ? originFrame : CGRectMake(((fromVCFrame?.size.width)! - image.size.width)/2.0, 0, image.size.width, image.size.height)
        let finalFrame = presenting ? CGRectMake(((toVCFrame?.size.width)! - image.size.width * scaleFactor)/2.0, 0, image.size.width * scaleFactor, (toVCFrame?.size.height)!) : originFrame
        
        
        if !presenting {
            containerView?.addSubview((toVC?.view)!)
        }
        
        imageView.frame = initialFrame
        
        containerView?.addSubview(imageView)
        containerView?.bringSubviewToFront(imageView)
        
        UIView.animateWithDuration(duration, animations: {
            imageView.frame = finalFrame
        }) { (_) in
            containerView?.addSubview((toVC?.view)!)
            containerView?.bringSubviewToFront((toVC?.view)!)
            imageView.removeFromSuperview()
            transitionContext.completeTransition(true)
        }
    }
    
}
