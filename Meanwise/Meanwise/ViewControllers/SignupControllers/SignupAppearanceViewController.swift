//
//  SignupAppearanceViewController.swift
//  Meanwise
//
//  Created by Vishal on 29/08/16.
//  Copyright © 2016 Squelo. All rights reserved.
//

import UIKit

class SignupAppearanceViewController: SignupBaseViewController {

    // MARK: - Variables
    
    var profilePicTableViewCell: UploadImageTableViewCell!
    var coverPicTableViewCell: UploadImageTableViewCell!
    var profilePic: UIImage?
    var coverPic: UIImage?
    var imagePicker = UIImagePickerController()

    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        cellRegister()
        enableNextButton(false)
    }
    
    // MARK: - Functions
    
    func cellRegister() {
        tableView.registerNib(UINib(nibName: Constants.TableViewCell.Title, bundle: nil), forCellReuseIdentifier: Constants.TableViewCell.Title)
    }
    
    func validation() {
        var isValid = false
        
        isValid = profilePic != nil
        isValid = isValid && coverPic != nil
        
        enableNextButton(isValid)
    }

    // MARK: - Memory Management
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension SignupAppearanceViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier(Constants.TableViewCell.Title, forIndexPath: indexPath) as! TitleTableViewCell
            cell.setValuesToCell(NSLocalizedString("Appearance", comment: "title for the screen"), subTitleText:NSLocalizedString("AppearanceSubtitle", comment: "sub-title for the screen"))
            return cell
        case 1:
            let cell = tableView.dequeueReusableCellWithIdentifier(Constants.TableViewCell.Spacer, forIndexPath: indexPath)
            return cell
        case 2:
            if profilePicTableViewCell == nil {
                profilePicTableViewCell = tableView.dequeueReusableCellWithIdentifier(Constants.TableViewCell.UploadImage, forIndexPath: indexPath) as! UploadImageTableViewCell
                profilePicTableViewCell.setTitleLabelOfCell(NSLocalizedString("ProfilePhoto", comment: "profile photo text"), indexPath: indexPath)
                profilePicTableViewCell.delegate = self
            }
            
            return profilePicTableViewCell
        case 3:
            if coverPicTableViewCell == nil {
                coverPicTableViewCell = tableView.dequeueReusableCellWithIdentifier(Constants.TableViewCell.UploadImage, forIndexPath: indexPath) as! UploadImageTableViewCell
                coverPicTableViewCell.setTitleLabelOfCell(NSLocalizedString("CoverPhoto", comment: "cover photo text"), indexPath: indexPath)
                coverPicTableViewCell.delegate = self
            }
            
            return coverPicTableViewCell
        default:
            return UITableViewCell()
        }
    }
}

extension SignupAppearanceViewController: UploadImageCellProtocol {
    
    func uploadImage(at indexPath: NSIndexPath) {
        activeIndexPath = indexPath
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.SavedPhotosAlbum){
            
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum;
            imagePicker.allowsEditing = true
            
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
    }
    
    func chooseImage(at indexPath: NSIndexPath) {
        activeIndexPath = indexPath
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera){
            
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera;
            imagePicker.allowsEditing = true
            
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }  else {
            let alertController = UIAlertController(title: "Error!", message: "Your device doesn't support camera.", preferredStyle: UIAlertControllerStyle.Alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) { (result : UIAlertAction) -> Void in
                print("OK")
            }
            alertController.addAction(okAction)
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }
}

extension SignupAppearanceViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
        
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
            
        })
        switch activeIndexPath!.row {
        case 2:
            profilePic = image
            profilePicTableViewCell.setImageInCell(profilePic!)
            break
        case 3:
            coverPic = image
            coverPicTableViewCell.setImageInCell(coverPic!)
           break
        default:
            break
        }
        
        validation()
    }

}

extension SignupAppearanceViewController {
    
    @IBAction func backButtonTapped(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func nextButtonTapped(sender: AnyObject) {
        view.endEditing(true)
        performSegueWithIdentifier(Constants.SegueIdentifiers.SignupInvite, sender: nil)
    }
    
}
