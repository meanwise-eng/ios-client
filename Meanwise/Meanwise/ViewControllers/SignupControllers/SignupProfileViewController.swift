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
    
    // MARK: - Variables
    
    var usernameTableViewCell: TextfieldTableViewCell!
    var professionTableViewCell: TextfieldTableViewCell!
    var bioTableViewCell: TextviewTableViewCell!
    var username: String?
    var profession: String?
    var bio: String?
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        cellRegister()
        enableNextButton(false)
        tableView.scrollEnabled = true
        isScrollingEnabled = true
    }

    // MARK: - Functions
    
    func cellRegister() {
        tableView.registerNib(UINib(nibName: Constants.TableViewCell.Textfield, bundle: nil), forCellReuseIdentifier: Constants.TableViewCell.Textfield)
        tableView.registerNib(UINib(nibName: Constants.TableViewCell.Title, bundle: nil), forCellReuseIdentifier: Constants.TableViewCell.Title)
    }
    
    func validation() {
        var isValid = false
        
        isValid = username != nil && username?.characters.count > 0
        isValid = profession != nil && profession?.characters.count > 0
        isValid = bio != nil && bio?.characters.count > 0
        
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
        
    }
    
}
