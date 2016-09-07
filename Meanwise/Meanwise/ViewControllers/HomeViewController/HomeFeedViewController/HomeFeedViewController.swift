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

        let userBarButton = UIBarButtonItem()
        userBarButton.customView = userButton
        
        self.navigationItem.leftBarButtonItem = userBarButton
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
        return 20
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.TableViewCell.ImagePost) as! ImagePostCell
        return cell
    }
    
}


