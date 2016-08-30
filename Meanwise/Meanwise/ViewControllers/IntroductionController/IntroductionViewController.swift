//
//  IntroductionViewController.swift
//  Meanwise
//
//  Created by Vishal on 25/08/16.
//  Copyright © 2016 Squelo. All rights reserved.
//

import UIKit

class IntroductionViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var skip: UIButton!
    @IBOutlet weak var imageView: UIImageView!

    // MARK: - Variables

    var pageTitles : Array<String> = [
        NSLocalizedString("IntroductionTitle1", comment: "title"),
        NSLocalizedString("IntroductionTitle2", comment: "title"),
        NSLocalizedString("IntroductionTitle3", comment: "title")
    ]
    
    var pageContent : Array<String> = [
        NSLocalizedString("IntroductionDescription1", comment: "Description"),
        NSLocalizedString("IntroductionDescription2", comment: "Description"),
        NSLocalizedString("IntroductionDescription3", comment: "Description")
    ]

    var titleFrame: CGRect = CGRectMake(0, 0, 0, 0)
    var contentFrame: CGRect = CGRectMake(0, 0, 0, 0)

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //configureScrollView()
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        configureScrollView()
    }

    // MARK: - scrollview configure

    func configureScrollView() {
         imageView.image = UIImage(named: "Group1")
        self.scrollView.pagingEnabled = true
        self.scrollView.showsHorizontalScrollIndicator = false
        for index in 0..<pageTitles.count {

            titleFrame.origin.x = self.scrollView.frame.size.width * CGFloat(index)
            titleFrame.origin.y = self.scrollView.frame.size.height-140
            titleFrame.size.width = self.scrollView.frame.size.width
            titleFrame.size.height = 15

            let lblTitle = UILabel(frame: titleFrame)
            lblTitle.text = pageTitles[index]
            lblTitle.textAlignment = .Center
            lblTitle.font = UIFont.boldFontOfSize(15)
            lblTitle.textColor = UIColor.whiteColor()
            scrollView.addSubview(lblTitle)

            let lblContent = UILabel()
            lblContent.text = pageContent[index]
            lblContent.numberOfLines = 0
            lblContent.font = UIFont.normalFontOfSize(14)
            lblContent.textColor = UIColor.whiteColor()
            lblContent.textAlignment = .Center
            scrollView.addSubview(lblContent)
            let txtSize = rectForText(lblContent.text!, font: lblContent.font, maxSize:CGSizeMake(lblContent.frame.width,100))
            contentFrame.origin.x = self.scrollView.frame.size.width * CGFloat(index)
            contentFrame.origin.y = titleFrame.origin.y+25
            contentFrame.size.width = self.scrollView.frame.size.width
            contentFrame.size.height = txtSize.height
            lblContent.frame = contentFrame

        }
        self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * CGFloat(pageTitles.count), self.scrollView.frame.size.height)
    }

    func rectForText(text: String, font: UIFont, maxSize: CGSize) -> CGSize {
        let attrString = NSAttributedString.init(string: text, attributes: [NSFontAttributeName:font])
        let rect = attrString.boundingRectWithSize(maxSize, options: NSStringDrawingOptions.UsesLineFragmentOrigin, context: nil)
        let size = CGSizeMake(rect.size.width, rect.size.height)
        return size
    }

    @IBAction func btnSkip(sender:UIButton) {
        let storyboard = UIStoryboard(name: Constants.Storyboard.Login, bundle: nil)
        let vc = storyboard.instantiateInitialViewController()
        self.presentViewController(vc!, animated: false, completion:nil)
    }

    // MARK: - Memory Management
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension IntroductionViewController: UIScrollViewDelegate {

    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        switch pageNumber {
        case 0:
            imageView.image = UIImage(named: "Group1")
            break
        case 1:
            imageView.image = UIImage(named: "Group2")
            break
        case 2:
            imageView.image = UIImage(named: "Group3")
            break
        case 3:
            imageView.image = UIImage(named: "Group3")
            let storyboard = UIStoryboard(name: Constants.Storyboard.Login, bundle: nil)
            let vc = storyboard.instantiateInitialViewController()
            self.presentViewController(vc!, animated: false, completion:nil)
            break
        default:
            break
        }
    }

}
