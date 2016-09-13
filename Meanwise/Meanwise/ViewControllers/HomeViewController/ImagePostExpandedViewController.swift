//
//  ImagePostExpandedViewController.swift
//  Meanwise
//
//  Created by Vishal on 08/09/16.
//  Copyright © 2016 Squelo. All rights reserved.
//

import UIKit

class ImagePostExpandedViewController: BaseViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    // MARK: - Variables
    
    var backgroundImageName: String?

    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationController?.navigationBarHidden = true
        UIApplication.sharedApplication().statusBarHidden = true
        self.backgroundImageView.image = UIImage(named: backgroundImageName!)
    }

    // MARK: - Memory Management
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ImagePostExpandedViewController {
    
    @IBAction func swipedDown(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
