//
//  SignupInviteViewController.swift
//  Meanwise
//
//  Created by Vishal on 29/08/16.
//  Copyright © 2016 Squelo. All rights reserved.
//

import UIKit

class SignupInviteViewController: SignupBaseViewController {

    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        cellRegister()
        enableNextButton(true)
    }
    
    // MARK: - Functions
    
    func cellRegister() {
        tableView.registerNib(UINib(nibName: Constants.TableViewCell.Title, bundle: nil), forCellReuseIdentifier: Constants.TableViewCell.Title)
    }
    
    // MARK: - Memory Management
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension SignupInviteViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier(Constants.TableViewCell.Title, forIndexPath: indexPath) as! TitleTableViewCell
            cell.setValuesToCell(NSLocalizedString("Invite", comment: "title for the screen"), subTitleText:NSLocalizedString("InviteSubtitle", comment: "sub-title for the screen"))
            return cell
        case 1:
            let cell = tableView.dequeueReusableCellWithIdentifier(Constants.TableViewCell.Spacer, forIndexPath: indexPath)
            return cell
        default:
            return getInviteCell(indexPath)
        }
    }
    
    func getInviteCell(indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.TableViewCell.Invite, forIndexPath: indexPath) as UITableViewCell
        
        let imageView = cell.viewWithTag(5) as! UIImageView
        var imageName = ""
        
        switch indexPath.row {
        case 2:
            imageName = "InviteContacts"
            break
        case 3:
            imageName = "InviteFacebook"
            break
        case 4:
            imageName = "InviteTwitter"
            break
        default:
            imageName = "InviteGmail"
            break
        }
        
        imageView.image = UIImage(named: imageName)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
}

extension SignupInviteViewController {
    
    @IBAction func backButtonTapped(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func nextButtonTapped(sender: AnyObject) {
        view.endEditing(true)
    }
    
}
