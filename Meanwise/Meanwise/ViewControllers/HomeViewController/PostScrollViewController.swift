//
//  PostScrollViewController.swift
//  Meanwise
//
//  Created by Vishal on 16/09/16.
//  Copyright © 2016 Squelo. All rights reserved.
//

import UIKit

class PostScrollViewController: UIViewController, UIGestureRecognizerDelegate {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var topView: UIView!
    
    // MARK: - Variables
    
    var leftView: UIView!
    var centerView: UIView!
    var rightView: UIView!
    
    var initialPosition: CGFloat?
    var time: Double?
    
    var leftPostViewController: ImagePostExpandedViewController!
    var centerPostViewController: ImagePostExpandedViewController!
    var rightPostViewController: ImagePostExpandedViewController!

    let screenSize = UIScreen.mainScreen().bounds.size
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        scrollViewSetup()
        setContentView()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        topBarSetup()
    }
    
    // MARK: - Functions
    
    func topBarSetup() {
        navigationController?.navigationBarHidden = true
        UIApplication.sharedApplication().statusBarHidden = true
    }
    
    // MARK: - Memory Management
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

private extension PostScrollViewController {
    
    func scrollViewSetup() {
        
        scrollView.contentSize = CGSize(width: 3 * screenSize.width, height: screenSize.height)
        
        leftView = UIView(frame: CGRectMake(0, 0, screenSize.width, screenSize.height))
        centerView = UIView(frame: CGRectMake(screenSize.width, 0, screenSize.width, screenSize.height))
        rightView = UIView(frame: CGRectMake(2*screenSize.width, 0, screenSize.width, screenSize.height))
        
        scrollView.addSubview(leftView)
        scrollView.addSubview(centerView)
        scrollView.addSubview(rightView)
        
        scrollView.setContentOffset(CGPointMake(screenSize.width, 0), animated: false)
    }
    
    func getImagePostFeedView() -> UIViewController {
        let imagePostExpandedViewController = self.storyboard!.instantiateViewControllerWithIdentifier(Constants.StoryboardId.ImagePostExpanded) as! ImagePostExpandedViewController
        
        let image = UIImage(named: "SamplePostImage")
        
        imagePostExpandedViewController.backgroundImage = image?.resizeImageForHeight(view.getHeight()).cropImageFromCentre(view.frame.size)
        
        return imagePostExpandedViewController
    }
    
    func getVideoPostFeedView() -> UIView {
        let videoPostViewController = self.storyboard!.instantiateViewControllerWithIdentifier(Constants.StoryboardId.VideoPost) as! VideoPostViewController
        return videoPostViewController.view
    }
    
    func setContentView() {
        initialiseControllers()
        leftView.addSubview(leftPostViewController.view)
        centerView.addSubview(centerPostViewController.view)
        rightView.addSubview(rightPostViewController.view)
    }
    
    func initialiseControllers() {
        leftPostViewController = getImagePostFeedView() as! ImagePostExpandedViewController
        centerPostViewController = getImagePostFeedView() as! ImagePostExpandedViewController
        rightPostViewController = getImagePostFeedView() as! ImagePostExpandedViewController
    }
    
}

// MARK: - IBAction

extension PostScrollViewController {
    
    @IBAction func swipeDown(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func createNewPostButtonTapped(sender: AnyObject) {
        let newPostViewController = self.storyboard!.instantiateViewControllerWithIdentifier(Constants.StoryboardId.NewPost) as! NewPostViewController
        
//        newPostViewController.transitioningDelegate = self

        self.presentViewController(newPostViewController, animated: true, completion: nil)
    }
    
    @IBAction func exploreButtonTapped(sender: AnyObject) {
        
    }
    
    @IBAction func searchButtonTapped(sender: AnyObject) {
        
    }
    
}

// MARK: - ScrollView Delegate

extension PostScrollViewController: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        scrollView.setContentOffset(CGPointMake(screenSize.width, 0), animated: false)
    }
    
}
