//
//  SignupNameViewController.swift
//  Meanwise
//
//  Created by Vishal on 23/08/16.
//  Copyright © 2016 Squelo. All rights reserved.
//

import UIKit

class SignupNameViewController: SignupBaseViewController {
    
    // MARK: - Variable
    
    var firstNameTableViewCell: TextfieldTableViewCell!
    var lastNameTableViewCell: TextfieldTableViewCell!
    var firstName: String?
    var lastName: String?
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        cellRegister()
        enableNextButton(false)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        firstNameTableViewCell.setFirstResponder()
    }
    
    // MARK: - Functions

    func cellRegister() {
        tableView.registerNib(UINib(nibName: Constants.TableViewCell.Textfield, bundle: nil), forCellReuseIdentifier: Constants.TableViewCell.Textfield)
        tableView.registerNib(UINib(nibName: Constants.TableViewCell.Title, bundle: nil), forCellReuseIdentifier: Constants.TableViewCell.Title)
    }
    
    func validation() {
        var isValid = false
        
        isValid = firstName != nil && firstName?.characters.count > 0
        isValid = isValid && lastName != nil && lastName?.characters.count > 0
        
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
            let cell = tableView.dequeueReusableCellWithIdentifier(Constants.TableViewCell.Title, forIndexPath: indexPath) as! TitleTableViewCell
            cell.setValuesToCell(NSLocalizedString("SignupNameTitle", comment: "title for the screen"))
            return cell
        case 1:
            if firstNameTableViewCell == nil {
                firstNameTableViewCell = tableView.dequeueReusableCellWithIdentifier(Constants.TableViewCell.Textfield, forIndexPath: indexPath) as! TextfieldTableViewCell
                firstNameTableViewCell.setCellForSignupNameScreen(NSLocalizedString("FirstName", comment: "First Name"), indexPath: indexPath)
                firstNameTableViewCell.delegate = self
            }
            
            return firstNameTableViewCell
        case 2:
            if lastNameTableViewCell == nil {
                lastNameTableViewCell = tableView.dequeueReusableCellWithIdentifier(Constants.TableViewCell.Textfield, forIndexPath: indexPath) as! TextfieldTableViewCell
                lastNameTableViewCell.setCellForSignupNameScreen(NSLocalizedString("LastName", comment: "Last Name"), indexPath: indexPath)
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
                lastNameTableViewCell.endFirstResponder()
                nextButtonTapped(nextButton)
            } else {
                lastNameTableViewCell.endFirstResponder()
                firstNameTableViewCell.setFirstResponder()
            }
        default: break
        }
    }
    
    func textFieldDidChange(text: String, indexPath: NSIndexPath) {
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
        view.endEditing(true)
        performSegueWithIdentifier(Constants.SegueIdentifiers.SignupMore, sender: nil)
    }
}


