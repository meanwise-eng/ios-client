//
//  SignupProfileViewController.swift
//  Meanwise
//
//  Created by Vishal on 26/08/16.
//  Copyright © 2016 Squelo. All rights reserved.
//

import UIKit

class SignupProfileViewController: SignupBaseViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var dropdownView: UIView!
    @IBOutlet weak var dropdownTopConstraint: NSLayoutConstraint!
    
    // MARK: - Variables
    
    var usernameTableViewCell: TextfieldTableViewCell!
    var professionTableViewCell: TextfieldTableViewCell!
    var bioTableViewCell: TextviewTableViewCell!
    var username: String?
    var profession: String?
    var bio: String?
    var skills: [String]?
    var dropdownViewController: DropdownViewController?
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        cellRegister()
        enableNextButton(false)
        tableView.scrollEnabled = true
        isScrollingEnabled = true
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        usernameTableViewCell.setFirstResponder()
    }

    // MARK: - Functions
    
    func cellRegister() {
        tableView.registerNib(UINib(nibName: Constants.TableViewCell.Textfield, bundle: nil), forCellReuseIdentifier: Constants.TableViewCell.Textfield)
        tableView.registerNib(UINib(nibName: Constants.TableViewCell.Title, bundle: nil), forCellReuseIdentifier: Constants.TableViewCell.Title)
    }
    
    func validation() {
        var isValid = false
        
        isValid = username != nil && username?.characters.count > 0
        isValid = isValid && profession != nil && profession?.characters.count > 0
        isValid = isValid && bio != nil && bio?.characters.count > 0
        
        enableNextButton(isValid)
    }
    
    // MARK: - Memory Management
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension SignupProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier(Constants.TableViewCell.Title, forIndexPath: indexPath) as! TitleTableViewCell
            cell.setValuesToCell(NSLocalizedString("Profile", comment: "title for the screen"), subTitleText:NSLocalizedString("ProfileSubtitle", comment: "sub-title for the screen"))
            return cell
        case 1:
            if usernameTableViewCell == nil {
                usernameTableViewCell = tableView.dequeueReusableCellWithIdentifier(Constants.TableViewCell.Textfield, forIndexPath: indexPath) as! TextfieldTableViewCell
                usernameTableViewCell.setCellForSignupProfileScreen(NSLocalizedString("Username", comment: "Username"), indexPath: indexPath)
                usernameTableViewCell.delegate = self
            }
            
            return usernameTableViewCell
        case 2:
            if professionTableViewCell == nil {
                professionTableViewCell = tableView.dequeueReusableCellWithIdentifier(Constants.TableViewCell.Textfield, forIndexPath: indexPath) as! TextfieldTableViewCell
                professionTableViewCell.setCellForSignupProfileScreen(NSLocalizedString("Profession", comment: "Profession"), indexPath: indexPath)
                professionTableViewCell.delegate = self
            }
            
            return professionTableViewCell
        case 3:
            if bioTableViewCell == nil {
                bioTableViewCell = tableView.dequeueReusableCellWithIdentifier(Constants.TableViewCell.Textview, forIndexPath: indexPath) as! TextviewTableViewCell
                bioTableViewCell.setCellValues((NSLocalizedString("Bio", comment: "Bio"), indexPath: indexPath))
                bioTableViewCell.delegate = self
            }
            
            return bioTableViewCell
        default:
            return UITableViewCell()
        }
    }
}

extension SignupProfileViewController: TextfieldTableViewCellProtocol {
    
    func textFieldDidBeginEditing(indexPath: NSIndexPath) {
        activeIndexPath = indexPath
    }
    
    func textFieldShouldReturn(indexPath: NSIndexPath) {
        switch indexPath.row {
        case 1:
            usernameTableViewCell.endFirstResponder()
            professionTableViewCell.setFirstResponder()
            break
        case 2:
            professionTableViewCell.endFirstResponder()
            bioTableViewCell.setFirstResponder()
        default: break
        }
    }
    
    func textFieldDidChange(text: String, indexPath: NSIndexPath) {
        switch indexPath.row {
        case 1:
            username = text
            break
        case 2:
            profession = text
            showDropdownView(["Web Developer", "Web Programmer", "Web Designer"])
            break
        default: break
        }
        validation()
    }
}

extension SignupProfileViewController: TextviewTableViewCellProtocol {
    
    func textviewDidBeginEditing(indexPath: NSIndexPath) {
        activeIndexPath = indexPath
        tableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: .Bottom, animated: true)
    }
    
    func textviewDidChange(text: String, indexPath: NSIndexPath) {
        bio = text
        validation()
    }
    
}


extension SignupProfileViewController {
    
    @IBAction func backButtonTapped(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func nextButtonTapped(sender: AnyObject) {
        view.endEditing(true)
        performSegueWithIdentifier(Constants.SegueIdentifiers.SignupAppearance, sender: nil)
    }
    
}

extension SignupProfileViewController: DropdownProtocol {

    func showDropdownView(list: [String]) {
        setYPositionOfDropdown()
        dropdownView.hidden = false
        dropdownViewController?.getListToDisplay(list)
    }

    func setYPositionOfDropdown() {
        let rectOfCellInTableView: CGRect = tableView.rectForRowAtIndexPath(NSIndexPath(forRow: 2, inSection: 0))
        let rectOfCellInSuperview: CGRect = tableView.convertRect(rectOfCellInTableView, toView: tableView.superview)
        dropdownTopConstraint.constant = rectOfCellInSuperview.origin.y + rectOfCellInSuperview.size.height
    }

    func valueSelected(indexPath: NSIndexPath, value: AnyObject) {
        validation()
        dropdownView.hidden = true
        profession = value as? String
        professionTableViewCell.setCellTextFieldValue(value as! String)
        tableView.reloadData()
    }

}

extension SignupProfileViewController {

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == Constants.SegueIdentifiers.Dropdown {
            dropdownViewController = segue.destinationViewController as? DropdownViewController
            dropdownViewController?.setCellColor(UIColor(red:67/255.0, green: 160/255.0, blue: 71/255.0, alpha: 1.0), cellColor: UIColor(red:76/255.0, green: 175/255.0, blue: 80/255.0, alpha: 1.0), separatorImageName: "PartitionLineGreen")
            dropdownViewController?.setTableViewBackgroundColor(UIColor(red:76/255.0, green: 175/255.0, blue: 80/255.0, alpha: 1.0))
            dropdownViewController?.delegate = self
        }
    }

}
