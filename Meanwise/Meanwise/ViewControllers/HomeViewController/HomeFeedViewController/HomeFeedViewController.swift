//
//  HomeFeedViewController.swift
//  Meanwise
//
//  Created by Vishal on 06/09/16.
//  Copyright © 2016 Squelo. All rights reserved.
//

import UIKit

class HomeFeedViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var topViewTopConstraint: NSLayoutConstraint!
    
    // MARK: - Variables
    
    var lastContentOffset: CGFloat = 0.0
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableViewSetup()
        cellRegister()
        UIApplication.sharedApplication().statusBarStyle = .Default
        navigationController!.hidesBarsOnSwipe = true
        addUserButton()
        addMessageButton()
        setTitleLogo()
    }
    
    // MARK: Function
    
    func addUserButton() {
        let userButton = UIButton()
        userButton.setImage(UIImage(named: "User"), forState: .Normal)
        userButton.frame = CGRectMake(0, 0, 30, 30)
        userButton.addTarget(self, action: #selector(userButtonTapped), forControlEvents: .TouchUpInside)
        
        let userBarButton = UIBarButtonItem()
        userBarButton.customView = userButton
        
        self.navigationItem.leftBarButtonItem = userBarButton
    }
    
    func userButtonTapped() {
        //        navigationController?.popViewControllerAnimated(true)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func addMessageButton() {
        let messageButton = UIButton()
        messageButton.setImage(UIImage(named: "NewMessage"), forState: .Normal)
        messageButton.frame = CGRectMake(0, 0, 30, 30)
        
        let messageBarButton = UIBarButtonItem()
        messageBarButton.customView = messageButton
        
        self.navigationItem.rightBarButtonItem = messageBarButton
    }
    
    func setTitleLogo() {
        let logo = UIImage(named: "Toplogo")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
    }
    
    func tableViewSetup() {
        tableView.estimatedRowHeight = 222
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    func cellRegister() {
        tableView.registerNib(UINib(nibName: Constants.TableViewCell.ImagePost, bundle: nil), forCellReuseIdentifier: Constants.TableViewCell.ImagePost)
        tableView.registerNib(UINib(nibName: Constants.TableViewCell.VideoPost, bundle: nil), forCellReuseIdentifier: Constants.TableViewCell.VideoPost)
    }
    
    // MARK: - Memory Management
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

// MARK: - TableView DataSource Delegate

extension HomeFeedViewController:UITableViewDelegate,UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return indexPath.row % 2 == 0 ? getImagePostCell(indexPath) : getVideoPostCell(indexPath)
    }
    
    func getImagePostCell(indexPath: NSIndexPath) -> ImagePostCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.TableViewCell.ImagePost) as! ImagePostCell
        return cell
    }
    
    func getVideoPostCell(indexPath: NSIndexPath) -> VideoPostCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.TableViewCell.VideoPost) as! VideoPostCell
        cell.loadVideo()
//        cell.playVideo()
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
        performSegueWithIdentifier(Constants.SegueIdentifiers.ImagePostExpanded, sender: nil)
    }
    
    func tableView(tableView: UITableView, willEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row % 2 == 1 {
//            let cell = tableView.cellForRowAtIndexPath(indexPath) as! VideoPostCell
//            cell.stopVideo()
        }
    }
    
}

extension HomeFeedViewController: UIScrollViewDelegate {

//    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
//        let visibleCellsIndexPath = tableView.indexPathsForVisibleRows
//        
//        for indexPath in visibleCellsIndexPath! {
//            if indexPath.row % 2 == 1 {
//                let cell = tableView.cellForRowAtIndexPath(indexPath) as! VideoPostCell
//                cell.playVideo()
//            }
//        }
//        
//    }
    
}


