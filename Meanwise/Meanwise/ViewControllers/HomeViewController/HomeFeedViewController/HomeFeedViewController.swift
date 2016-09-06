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
    
    @IBOutlet var repliesTableView: UITableView!


    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // MARK: - Memory Management
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension HomeFeedViewController:UITableViewDelegate,UITableViewDataSource {

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 224
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.TableViewCell.HomeFeed) as! HomeFeedTableViewCell
        return cell
    }
    
}

