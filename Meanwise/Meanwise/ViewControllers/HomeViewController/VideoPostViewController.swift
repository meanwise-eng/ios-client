//
//  VideoPostViewController.swift
//  Meanwise
//
//  Created by Vishal on 14/09/16.
//  Copyright © 2016 Squelo. All rights reserved.
//

import UIKit
import AVFoundation

class VideoPostViewController: BaseViewController {

    // MARK: - Variables
    
    var videoUrl: String?
    private var playerLayer: AVPlayerLayer?

    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Functions
    
    func addAvPlayerLayer() {
//        let screenSize = UIScreen.mainScreen().bounds
        
    }

    // MARK: - Memory Management
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension VideoPostViewController {
    
    @IBAction func swipedDown(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}