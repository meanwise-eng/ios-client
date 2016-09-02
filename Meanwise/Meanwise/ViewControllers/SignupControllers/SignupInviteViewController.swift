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
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.TableViewCell.Invite, forIndexPath: indexPath) as! InviteTableViewCell
        
        var imageName = ""
        var attributedString: NSAttributedString!
        
        switch indexPath.row {
        case 2:
            imageName = "ContactsIcon"
            let string = "Invite friends from your Contacts"
            attributedString = getAttributedString(string, from: 25, length: 8, color: UIColor.init(red: 96/255.0, green: 125/255.0, blue: 136/255.0, alpha: 1.0))
            break
        case 3:
            imageName = "FacebookIcon"
            let string = "Invite Facebook friends"
            attributedString = getAttributedString(string, from: 8, length: 8, color: UIColor.init(red: 92/255.0, green: 107/255.0, blue: 192/255.0, alpha: 1.0))
            break
        case 4:
            imageName = "TwitterIcon"
            let string = "Invite your Twitter friends"
            attributedString = getAttributedString(string, from: 13, length: 7, color: UIColor.init(red: 80/255.0, green: 171/255.0, blue: 241/255.0, alpha: 1.0))
            break
        default:
            imageName = "GoogleIcon"
            let string = "Invite your Gmail contacts"
            attributedString = getAttributedString(string, from: 13, length: 5, color: UIColor.init(red: 62/255.0, green: 130/255.0, blue: 247/255.0, alpha: 1.0))
            break
        }
        
        cell.setInviteCell(attributedString, iconName: imageName)
        
        return cell
    }
    
    func getAttributedString(string: String, from: Int, length: Int, color: UIColor) -> NSAttributedString {
        
        let myColorAttribute = [NSForegroundColorAttributeName: color, NSFontAttributeName: UIFont(name: "OpenSans", size: 15.0)!]
        
        let attributedString = NSMutableAttributedString(string: string, attributes: myColorAttribute)
        
        let myRange = NSRange(location: from, length: length)
        
        attributedString.addAttribute(NSFontAttributeName, value: UIFont(name: "OpenSans-Semibold", size: 15.0)!, range: myRange)
        
        return attributedString
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
}

extension SignupInviteViewController {
    
    @IBAction func backButtonTapped(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func nextButtonTapped(sender: AnyObject) {
        let storyboard = UIStoryboard(name: Constants.Storyboard.Login, bundle: nil)
        let vc = storyboard.instantiateInitialViewController()
        self.view.window?.layer.addAnimation(getPresentCustomAnimation(), forKey: kCATransition)
        self.presentViewController(vc!, animated: false, completion:nil)
    }
    
}
