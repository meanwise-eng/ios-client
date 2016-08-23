//
//  SignupNameViewController.swift
//  Meanwise
//
//  Created by Vishal on 23/08/16.
//  Copyright © 2016 Squelo. All rights reserved.
//

import UIKit

class SignupNameViewController: BaseViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.registerNib(UINib(nibName: Constants.TableViewCellIdentifier.TextfieldTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.TableViewCellIdentifier.TextfieldTableViewCell)

    }
    
    // MARK: - Memory Management

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension SignupNameViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.TableViewCellIdentifier.TextfieldTableViewCell, forIndexPath: indexPath) as! TextfieldTableViewCell
        
        return cell
    }
}
