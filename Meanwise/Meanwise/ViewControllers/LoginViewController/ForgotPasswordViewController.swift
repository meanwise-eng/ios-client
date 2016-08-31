//
//  ForgotPasswordViewController.swift
//  Meanwise
//
//  Created by Vishal on 30/08/16.
//  Copyright © 2016 Squelo. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: SignupBaseViewController {
    
    // MARK: - Variable
    
    var emailTableViewCell: TextfieldTableViewCell!
    var email: String?
    
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
        enableNextButton(isValid)
    }
    
    // MARK: - Memory Management
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ForgotPasswordViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier(Constants.TableViewCell.Title, forIndexPath: indexPath) as! TitleTableViewCell
            cell.setValuesToCell(NSLocalizedString("ForgotPasswordTitle", comment: "title for the screen"))
            return cell
        case 1:
            if emailTableViewCell == nil {
                emailTableViewCell = tableView.dequeueReusableCellWithIdentifier(Constants.TableViewCell.Textfield, forIndexPath: indexPath) as! TextfieldTableViewCell
                emailTableViewCell.setCellForForgotScreen(NSLocalizedString("Email", comment: "Email"), indexPath: indexPath)
                emailTableViewCell.delegate = self
            }
            
            return emailTableViewCell
        default:
            return UITableViewCell()
        }
    }
}

extension ForgotPasswordViewController: TextfieldTableViewCellProtocol {
    
    func textFieldDidBeginEditing(indexPath: NSIndexPath) {
        activeIndexPath = indexPath
    }
    
    func textFieldShouldReturn(indexPath: NSIndexPath) {
        emailTableViewCell.endFirstResponder()
    }
    
    func textFieldDidChange(text: String, indexPath: NSIndexPath) {
        email = text
        validation()
    }
}

extension ForgotPasswordViewController {
    
    @IBAction func backButtonTapped(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func nextButtonTapped(sender: AnyObject) {
        //        view.endEditing(true)
        //        performSegueWithIdentifier(Constants.SegueIdentifiers.SignupMore, sender: nil)
    }
}

