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
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var tableViewBottomConstraint: NSLayoutConstraint!
    
    // MARK: - Variable
    
    var firstNameTableViewCell: TextfieldTableViewCell!
    var lastNameTableViewCell: TextfieldTableViewCell!
    var firstName: String?
    var lastName: String?
    var activeIndexPath: NSIndexPath?
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        tableViewSetup()
        enableNextButton(false)
        registerForNotifications()
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        deRegisterForNotification()
    }
    
    // MARK: - Functions
    
    func tableViewSetup() {
        tableView.registerNib(UINib(nibName: Constants.TableViewCell.TextfieldTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.TableViewCell.TextfieldTableViewCell)
        tableView.registerNib(UINib(nibName: Constants.TableViewCell.TitleTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.TableViewCell.TitleTableViewCell)
        
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        
        tableView.scrollEnabled = false
    }
    
    func enableNextButton(enable: Bool) {
        nextButton.alpha = enable ? 1.0 : 0.5
        nextButton.enabled = enable
    }
    
    func validation() {
        var isValid = false
        
        isValid = firstName != nil && firstName?.characters.count > 0
        isValid = lastName != nil && lastName?.characters.count > 0
        
        enableNextButton(isValid)
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
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier(Constants.TableViewCell.TitleTableViewCell, forIndexPath: indexPath) as! TitleTableViewCell
            cell.setValuesToCell(NSLocalizedString("SignupNameTitle", comment: "title for the screen"))
            return cell
        case 1:
            if firstNameTableViewCell == nil {
                firstNameTableViewCell = tableView.dequeueReusableCellWithIdentifier(Constants.TableViewCell.TextfieldTableViewCell, forIndexPath: indexPath) as! TextfieldTableViewCell
                firstNameTableViewCell.setValuesToCell(NSLocalizedString("FirstName", comment: "First Name"), indexPath: indexPath)
                firstNameTableViewCell.delegate = self
            }
            
            return firstNameTableViewCell
        case 2:
            if lastNameTableViewCell == nil {
                lastNameTableViewCell = tableView.dequeueReusableCellWithIdentifier(Constants.TableViewCell.TextfieldTableViewCell, forIndexPath: indexPath) as! TextfieldTableViewCell
                lastNameTableViewCell.setValuesToCell(NSLocalizedString("LastName", comment: "Last Name"), indexPath: indexPath)
                lastNameTableViewCell.delegate = self
            }
            
            return lastNameTableViewCell
        default:
            return UITableViewCell()
        }
    }
}

extension SignupNameViewController: TextfieldTableViewCellProtocol {
    
    func textFieldDidBeginEditing(indexPath: NSIndexPath) {
        activeIndexPath = indexPath
    }
    
    func textFieldShouldReturn(indexPath: NSIndexPath) {
        switch indexPath.row {
        case 1:
            firstNameTableViewCell.endFirstResponder()
            lastNameTableViewCell.setFirstResponder()
            break
        case 2:
            if nextButton.enabled {
                nextButtonTapped(nextButton)
            } else {
                lastNameTableViewCell.endFirstResponder()
                firstNameTableViewCell.setFirstResponder()
            }
        default: break
        }
    }
    
    func textFieldDidEndEditing(text: String, indexPath: NSIndexPath) {
        switch indexPath.row {
        case 1:
            firstName = text
            break
        case 2:
            lastName = text
            break
        default: break
        }
        validation()
    }
}

extension SignupNameViewController {
    
    @IBAction func backButtonTapped(sender: AnyObject) {
        
    }
    
    @IBAction func nextButtonTapped(sender: AnyObject) {
        
    }
}

extension SignupNameViewController {
    func registerForNotifications() {
    
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(SignupNameViewController.keyboardWillShow(_:)), name:UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(SignupNameViewController.keyboardWillHide(_:)), name:UIKeyboardWillHideNotification, object: nil)
        
    }
    
    func deRegisterForNotification() {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        let info = notification.userInfo!
        let keyboardFrame: CGRect = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        
        tableViewBottomConstraint.constant = keyboardFrame.size.height - 50

        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.view.layoutIfNeeded()
        })
        
        makeLowerCellVisible()
    }
    
    func keyboardWillHide(notification: NSNotification) {
        
        tableViewBottomConstraint.constant = 0
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.view.layoutIfNeeded()
        })
    }
    
    func makeLowerCellVisible() {
        if activeIndexPath != nil {
            tableView.scrollToRowAtIndexPath(activeIndexPath!, atScrollPosition: .Bottom, animated: true)
        }
    }
}
