//
//  SignupMoreViewController.swift
//  Meanwise
//
//  Created by Vishal on 24/08/16.
//  Copyright © 2016 Squelo. All rights reserved.
//

import UIKit

class SignupMoreViewController: SignupBaseViewController {
    
    // MARK: - Variable
    
    var emailTableViewCell: TextfieldTableViewCell!
    var passwordTableViewCell: TextfieldTableViewCell!
    var email: String?
    var password: String?
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        cellRegister()
        enableNextButton(false)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        emailTableViewCell.setFirstResponder()
    }
    
    // MARK: - Functions
       
    func cellRegister() {
        tableView.registerNib(UINib(nibName: Constants.TableViewCell.Textfield, bundle: nil), forCellReuseIdentifier: Constants.TableViewCell.Textfield)
        tableView.registerNib(UINib(nibName: Constants.TableViewCell.Title, bundle: nil), forCellReuseIdentifier: Constants.TableViewCell.Title)
    }
    
    func validation() {
        var isValid = false
        
        isValid = email != nil && email?.characters.count > 0
        isValid = isValid && password != nil && password?.characters.count > 0
        
        enableNextButton(isValid)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension SignupMoreViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier(Constants.TableViewCell.Title, forIndexPath: indexPath) as! TitleTableViewCell
            cell.setValuesToCell(NSLocalizedString("SignupMoreTitle", comment: "title for the screen"))
            return cell
        case 1:
            if emailTableViewCell == nil {
                emailTableViewCell = tableView.dequeueReusableCellWithIdentifier(Constants.TableViewCell.Textfield, forIndexPath: indexPath) as! TextfieldTableViewCell
                emailTableViewCell.setCellForEmail(NSLocalizedString("Email", comment: "Email"), indexPath: indexPath)
                emailTableViewCell.delegate = self
            }
            
            return emailTableViewCell
        case 2:
            if passwordTableViewCell == nil {
                passwordTableViewCell = tableView.dequeueReusableCellWithIdentifier(Constants.TableViewCell.Textfield, forIndexPath: indexPath) as! TextfieldTableViewCell
                passwordTableViewCell.setCellForPassword(NSLocalizedString("Password", comment: "Password"), indexPath: indexPath)
                passwordTableViewCell.delegate = self
            }
            
            return passwordTableViewCell
        default:
            return UITableViewCell()
        }
    }
}

extension SignupMoreViewController: TextfieldTableViewCellProtocol {
    
    func textFieldDidBeginEditing(indexPath: NSIndexPath) {
        activeIndexPath = indexPath
    }
    
    func textFieldShouldReturn(indexPath: NSIndexPath) {
        switch indexPath.row {
        case 1:
            emailTableViewCell.endFirstResponder()
            passwordTableViewCell.setFirstResponder()
            break
        case 2:
            if nextButton.enabled {
                nextButtonTapped(nextButton)
            } else {
                passwordTableViewCell.endFirstResponder()
                emailTableViewCell.setFirstResponder()
            }
        default: break
        }
    }
    
    func textFieldDidChange(text: String, indexPath: NSIndexPath) {
        switch indexPath.row {
        case 1:
            email = text
            break
        case 2:
            password = text
            break
        default: break
        }
        validation()
    }
}

extension SignupMoreViewController {

    @IBAction func nextButtonTapped(sender: AnyObject) {
        view.endEditing(true)
        performSegueWithIdentifier(Constants.SegueIdentifiers.SignupSkills, sender: nil)
    }

    @IBAction func unwindFromViewController(sender: UIStoryboardSegue) {

    }

    override func segueForUnwindingToViewController(toViewController: UIViewController, fromViewController: UIViewController, identifier: String?) -> UIStoryboardSegue {
        let segue = SignUpCustomUnwindSegue(identifier: identifier, source: fromViewController, destination: toViewController)
        return segue
    }
}
