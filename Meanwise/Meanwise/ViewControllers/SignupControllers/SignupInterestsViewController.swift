//
//  SignupInterestsViewController.swift
//  Meanwise
//
//  Created by Vishal on 25/08/16.
//  Copyright © 2016 Squelo. All rights reserved.
//

import UIKit

class SignupInterestsViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var carousel: iCarousel!
    
    // MARK: - Variables
    
    var items: [Int] = []
    
    // MARK: - Awake
    
    override func awakeFromNib() {
        super.awakeFromNib()
        for i in 0...99 {
            items.append(i)
        }
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        carousel.type = .Custom
        carousel.decelerationRate = 0.0
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        carousel.reloadData()
    }
    
    // MARK: - Memory Management
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension SignupInterestsViewController {
    
    @IBAction func backButtonTapped(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func nextButtonTapped(sender: AnyObject) {
        view.endEditing(true)
        performSegueWithIdentifier(Constants.SegueIdentifiers.SignupProfile, sender: nil)
    }
}

extension SignupInterestsViewController: iCarouselDelegate, iCarouselDataSource {
    
    //iCarousel Delegate Methods
    func numberOfItemsInCarousel(carousel: iCarousel) -> Int {
        return items.count
    }
    
    func carousel(carousel: iCarousel, viewForItemAtIndex index: Int, reusingView view: UIView?) -> UIView {
        var itemView: UIImageView
        var img : UIImageView
        var selectButton: UIButton
        var title: UILabel
        
        //create new view if no view is available for recycling
        if (view == nil) {
            itemView = UIImageView(frame:CGRect(x:0, y:0, width:275, height:395))
            itemView.backgroundColor = UIColor.clearColor()
            itemView.contentMode = .ScaleAspectFit
            
            img = UIImageView(frame:CGRect(x:0, y:5, width:itemView.frame.size.width, height:itemView.frame.size.height))
            img.image = UIImage(named: "Fashion")
            img.backgroundColor = UIColor.clearColor()
            img.contentMode = .ScaleAspectFit
            itemView.addSubview(img)
            
            selectButton = UIButton(frame: CGRect(x:itemView.frame.size.width/2 - 50, y:itemView.frame.size.height/2 - 50, width:100, height:100))
            
            selectButton.setImage(UIImage(named: "InterestUnselected"), forState: .Normal)
            selectButton.setImage(UIImage(named: "InterestSelected"), forState: .Selected)
            
            selectButton.tag = 1
            itemView.addSubview(selectButton)
            
            title = UILabel(frame: CGRect(x: 20.0, y: 30.0, width: 100.0, height: 20.0))
            title.backgroundColor = UIColor.clearColor()
            title.textAlignment = .Center
            title.textColor = UIColor.whiteColor()
            title.font = title.font.fontWithSize(20)
            title.tag = 2
            title.text = "FASHION"
            itemView.addSubview(title)
        } else {
            //get a reference to the label in the recycled view
            itemView = view as! UIImageView;
            selectButton = itemView.viewWithTag(1) as! UIButton!
        }
        selectButton.titleLabel!.text = "\(items[index])"
        
        return itemView
    }
    
    func carousel(carousel: iCarousel, valueForOption option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        if (option == .Spacing) {
            return value * 2.5
        }
        return value
    }
    
    func carousel(carousel: iCarousel, itemTransformForOffset offset: CGFloat, baseTransform transform: CATransform3D) -> CATransform3D {
        
        let distance: CGFloat = 50.0
        let spacing: CGFloat = 0.11
        
        let clampedOffset = min(1.0, max(-1.0, offset))
        
        let z: CGFloat = -fabs(clampedOffset) * distance
        
        var offset1 = offset
        
        offset1 += clampedOffset * spacing
        
        return CATransform3DTranslate(transform, offset1 * carousel.itemWidth, 0.0, z)
    }
    
    func carousel(carousel: iCarousel, didSelectItemAtIndex index: Int) {
        let itemView = carousel.itemViewAtIndex(index)
        
        let button = itemView?.viewWithTag(1) as! UIButton
        button.selected = !button.selected
    }
    
}

