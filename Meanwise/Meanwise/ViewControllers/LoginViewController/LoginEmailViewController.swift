//
//  LoginEmailViewController.swift
//  Meanwise
//
//  Created by Vishal on 30/08/16.
//  Copyright © 2016 Squelo. All rights reserved.
//

import UIKit

class LoginEmailViewController: SignupBaseViewController {

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
        showProgressBarAnimation = false
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

    // MARK: - Memory Management

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension LoginEmailViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier(Constants.TableViewCell.Title, forIndexPath: indexPath) as! TitleTableViewCell
            cell.setValuesToCell(NSLocalizedString("LoginEmailTitle", comment: "title for the screen"))
            return cell
        case 1:
            if emailTableViewCell == nil {
                emailTableViewCell = tableView.dequeueReusableCellWithIdentifier(Constants.TableViewCell.Textfield, forIndexPath: indexPath) as! TextfieldTableViewCell
                emailTableViewCell.setCellForLoginEmailScreen(NSLocalizedString("Email", comment: "Email"), indexPath: indexPath, isPassword: false)
                emailTableViewCell.delegate = self
            }

            return emailTableViewCell
        case 2:
            if passwordTableViewCell == nil {
                passwordTableViewCell = tableView.dequeueReusableCellWithIdentifier(Constants.TableViewCell.Textfield, forIndexPath: indexPath) as! TextfieldTableViewCell
                passwordTableViewCell.setCellForLoginEmailScreen(NSLocalizedString("Password", comment: "Password"), indexPath: indexPath, isPassword: true)
                passwordTableViewCell.delegate = self
            }

            return passwordTableViewCell
        default:
            return UITableViewCell()
        }
    }
}

extension LoginEmailViewController: TextfieldTableViewCellProtocol {

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
                passwordTableViewCell.endFirstResponder()
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

extension LoginEmailViewController {

    @IBAction func backButtonTapped(sender: AnyObject) {
        self.view.window?.layer.addAnimation(getPresentCustomAnimation(), forKey: kCATransition)
 //       self.navigationController?.popViewControllerAnimated(false)
        dismissViewControllerAnimated(false, completion: nil)
    }

    @IBAction func nextButtonTapped(sender: AnyObject) {
        view.endEditing(true)
        let storyboard = UIStoryboard(name: Constants.Storyboard.Home, bundle: nil)
        let vc = storyboard.instantiateInitialViewController()
        self.presentViewController(vc!, animated: false, completion:nil)
    }
    
    @IBAction func unwindFromViewController(sender: UIStoryboardSegue) {
        
    }
    
    @IBAction func forgotPasswordButtonTapped(sender: AnyObject) {
        view.endEditing(true)
        performSegueWithIdentifier(Constants.SegueIdentifiers.ForgotPassword, sender: nil)
    }
}
