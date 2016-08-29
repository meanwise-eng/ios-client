//
//  SignupSkillsViewController.swift
//  Meanwise
//
//  Created by Vishal on 24/08/16.
//  Copyright © 2016 Squelo. All rights reserved.
//

import UIKit

class SignupSkillsViewController: SignupBaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var dropdownView: UIView!
    @IBOutlet weak var dropdownTopConstraint: NSLayoutConstraint!
    
    // MARK: - Variable
    
    var addSkillTableViewCell: TextfieldTableViewCell!
    var tagsTableViewCell: TagsTableViewCell!
    var skills: [String]?
    var dropdownViewController: DropdownViewController?
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        skills = []
        cellRegister()
        enableNextButton(false)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        addSkillTableViewCell.setFirstResponder()
    }
    
    // MARK: - Functions
    
    func cellRegister() {
        tableView.registerNib(UINib(nibName: Constants.TableViewCell.Textfield, bundle: nil), forCellReuseIdentifier: Constants.TableViewCell.Textfield)
        tableView.registerNib(UINib(nibName: Constants.TableViewCell.Title, bundle: nil), forCellReuseIdentifier: Constants.TableViewCell.Title)
    }
    
    func validation() {
        var isValid = false
        
        isValid = skills != nil && skills!.count > 0
        
        enableNextButton(isValid)
    }
    
    // MARK: - Memory Management
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension SignupSkillsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            return getCellForFirstSection(indexPath)
        case 1:
            return getCellForSecondSection(indexPath)
        default:
            return UITableViewCell()
        }
    }
    
    func getCellForFirstSection(indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            return getTitleCell(indexPath)
        case 1:
            return getAddSkillCell(indexPath)
        default:
            return UITableViewCell()
        }
    }
    
    func getCellForSecondSection(indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            return getSpacerCell(indexPath)
        default:
            return getTagCell(indexPath)
        }
    }
    
    func getTagCell(indexPath: NSIndexPath) -> UITableViewCell {
        if tagsTableViewCell == nil {
            tagsTableViewCell = tableView.dequeueReusableCellWithIdentifier(Constants.TableViewCell.Tags, forIndexPath: indexPath) as! TagsTableViewCell
            tagsTableViewCell.delegate = self
        }

        return tagsTableViewCell
    }
    
    func getSpacerCell(indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.TableViewCell.Spacer, forIndexPath: indexPath)
        return cell
    }
    
    func getTitleCell(indexPath: NSIndexPath) -> TitleTableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.TableViewCell.Title, forIndexPath: indexPath) as! TitleTableViewCell
        
        cell.setValuesToCell(NSLocalizedString("SignupAddSkillTitle", comment: "title for the screen"))
        
        return cell
    }
    
    func getAddSkillCell(indexPath: NSIndexPath) -> TextfieldTableViewCell {
        if addSkillTableViewCell == nil {
            
            addSkillTableViewCell = tableView.dequeueReusableCellWithIdentifier(Constants.TableViewCell.Textfield, forIndexPath: indexPath) as! TextfieldTableViewCell
        addSkillTableViewCell.setCellForSignupSkillsScreen(NSLocalizedString("AddSkill", comment: "Add Skills"), indexPath: indexPath)
            
            addSkillTableViewCell.delegate = self
        }
        
        return addSkillTableViewCell
    }
}

extension SignupSkillsViewController: TextfieldTableViewCellProtocol {
    
    func textFieldDidBeginEditing(indexPath: NSIndexPath) {
        activeIndexPath = indexPath
    }
    
    func textFieldShouldReturn(indexPath: NSIndexPath) {
        
    }
    
    func textFieldDidChange(text: String, indexPath: NSIndexPath) {
        showDropdownView(["Java", "JavaScript", "Java 6", "Swift", "Obj-C"])
    }
}

extension SignupSkillsViewController {
    
    @IBAction func backButtonTapped(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func nextButtonTapped(sender: AnyObject) {
        view.endEditing(true)
        performSegueWithIdentifier(Constants.SegueIdentifiers.SignupInterests, sender: nil)
    }
}

extension SignupSkillsViewController: DropdownProtocol {
    
    func showDropdownView(list: [String]) {
        setYPositionOfDropdown()
        dropdownView.hidden = false
        dropdownViewController?.getListToDisplay(list)
    }
    
    func setYPositionOfDropdown() {
        let rectOfCellInTableView: CGRect = tableView.rectForRowAtIndexPath(NSIndexPath(forRow: 1, inSection: 0))
        let rectOfCellInSuperview: CGRect = tableView.convertRect(rectOfCellInTableView, toView: tableView.superview)
        dropdownTopConstraint.constant = rectOfCellInSuperview.origin.y + rectOfCellInSuperview.size.height
    }
    
    func valueSelected(indexPath: NSIndexPath, value: AnyObject) {
        skills?.append(value as! String)
        validation()
        dropdownView.hidden = true
        tagsTableViewCell.addTag(value as! String)
        addSkillTableViewCell.setCellTextFieldValue("")
        tableView.reloadData()
    }
    
}

extension SignupSkillsViewController: TagsCellProtocol {
    
    func removeTag(tagName: String) {
        skills = skills?.filter() {$0 != tagName}
        validation()
        tableView.reloadData()
    }
    
}

extension SignupSkillsViewController {
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == Constants.SegueIdentifiers.Dropdown {
            dropdownViewController = segue.destinationViewController as? DropdownViewController
            dropdownViewController?.delegate = self
        }
    }
    
}

