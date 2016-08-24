//
//  SignupSkillsViewController.swift
//  Meanwise
//
//  Created by Sumit on 24/08/16.
//  Copyright © 2016 Squelo. All rights reserved.
//

import UIKit

class SignupSkillsViewController: SignupBaseViewController {

    // MARK: - Variable
    
    var addSkillTableViewCell: TextfieldTableViewCell!
    var email: String?
    var password: String?
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        cellRegister()
    }
    
    // MARK: - Functions
    
    func cellRegister() {
        tableView.registerNib(UINib(nibName: Constants.TableViewCell.TextfieldTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.TableViewCell.TextfieldTableViewCell)
        tableView.registerNib(UINib(nibName: Constants.TableViewCell.TitleTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.TableViewCell.TitleTableViewCell)
    }
    
    func validation() {
        var isValid = false
        
        isValid = email != nil && email?.characters.count > 0
        isValid = password != nil && password?.characters.count > 0
        
        enableNextButton(isValid)
    }
    
    // MARK: - Memory Management

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension SignupSkillsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier(Constants.TableViewCell.TitleTableViewCell, forIndexPath: indexPath) as! TitleTableViewCell
            cell.setValuesToCell(NSLocalizedString("SignupAddSkillTitle", comment: "title for the screen"))
            return cell
        case 1:
            if addSkillTableViewCell == nil {
                addSkillTableViewCell = tableView.dequeueReusableCellWithIdentifier(Constants.TableViewCell.TextfieldTableViewCell, forIndexPath: indexPath) as! TextfieldTableViewCell
                addSkillTableViewCell.setCellForSignupSkillsScreen(NSLocalizedString("AddSkill", comment: "Add Skills"), indexPath: indexPath)
                addSkillTableViewCell.delegate = self
            }
            
            return addSkillTableViewCell
        default:
            return UITableViewCell()
        }
    }
}

extension SignupSkillsViewController: TextfieldTableViewCellProtocol {
    
    func textFieldDidBeginEditing(indexPath: NSIndexPath) {
        activeIndexPath = indexPath
    }
    
    func textFieldShouldReturn(indexPath: NSIndexPath) {
        switch indexPath.row {
        case 1:
            addSkillTableViewCell.endFirstResponder()
            break
        default: break
        }
    }
    
    func textFieldDidChange(text: String, indexPath: NSIndexPath) {
        switch indexPath.row {
        case 1:
            email = text
            break
        default: break
        }
        validation()
    }
}

extension SignupSkillsViewController {
    
    @IBAction func backButtonTapped(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func nextButtonTapped(sender: AnyObject) {
        view.endEditing(true)
        performSegueWithIdentifier(Constants.SegueIdentifiers.SignupSkills, sender: nil)
    }
}
