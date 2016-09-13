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
        uiSetup()
        panGestureSetup()
    }
    
    // MARK: - Functions
    
    func topBarSetup() {
        navigationController?.navigationBarHidden = true
        UIApplication.sharedApplication().statusBarHidden = true
    }
    
    func uiSetup() {
        topBarSetup()
        self.backgroundImageView.image = UIImage(named: backgroundImageName!)
    }
    
    // MARK: - Memory Management
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Deinit
    
    deinit {
        print("ImagePostExpandedViewController DeInitialising")
    }
    
}

extension ImagePostExpandedViewController {
    
    func panGestureSetup() {
        let edgeGestureRecognizer = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(ImagePostExpandedViewController.userSwipedFromEdge(_:)))
        edgeGestureRecognizer.edges = UIRectEdge.Top
        self.view.addGestureRecognizer(edgeGestureRecognizer)
    }
    
    func userSwipedFromEdge(sender: UIScreenEdgePanGestureRecognizer) {
        if sender.edges == UIRectEdge.Top {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
}
