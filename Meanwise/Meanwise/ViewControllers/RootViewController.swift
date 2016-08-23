//
//  RootViewController.swift
//  Meanwise
//
//  Created by Vishal on 23/08/16.
//  Copyright © 2016 Squelo. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    // MARK: - ViewLifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let vc = getViewController()
        self.presentViewController(vc, animated: false, completion: nil)
    }
    
    private func getViewController() -> UIViewController {
        var vc: UIViewController?
        
        let isFirstTime = NSUserDefaults.standardUserDefaults().objectForKey(Constants.UserDefaults.IsFirstTime) as? String
        
        let isLoggedIn = NSUserDefaults.standardUserDefaults().objectForKey(Constants.UserDefaults.IsUserLoggedIn) as? String
        
        if (isFirstTime == nil) {
            NSUserDefaults.standardUserDefaults().setObject(Constants.StringConstant.True, forKey: Constants.UserDefaults.IsFirstTime)
            let storyboard = UIStoryboard(name: Constants.Storyboard.Introduction, bundle: nil)
            vc = storyboard.instantiateInitialViewController()
        } else if ((isLoggedIn) != nil) {
            let storyboard = UIStoryboard(name: Constants.Storyboard.Home, bundle: nil)
            vc = storyboard.instantiateInitialViewController()
        } else {
            let storyboard = UIStoryboard(name: Constants.Storyboard.Login, bundle: nil)
            vc = storyboard.instantiateInitialViewController()
        }
        
        return vc!
    }
    
    // MARK: - Memory Management -
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
