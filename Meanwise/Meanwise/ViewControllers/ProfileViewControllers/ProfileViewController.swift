//
//  ProfileViewController.swift
//  Meanwise
//
//  Created by Hardik on 30/08/16.
//  Copyright © 2016 Squelo. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
import QuartzCore


class ProfileViewController: UIViewController, UIScrollViewDelegate {

    var scrollView: UIScrollView!
    var coverView: CoverView!
    var bioView: BioView!
    var videoView: VideoView!
    var portfolioView: PortfolioView!
    var countSec = 0
    var isInIntroMode = false
    var introBlockView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor=UIColor.redColor();
        
        
        self.view.backgroundColor = UIColor.blackColor()
        //self!.setNeedsStatusBarAppearanceUpdate()
        scrollView = UIScrollView(frame: CGXRectMake(0, 0, CGX_ScreenMaxWidth(), CGX_ScreenMaxHeight()))
        self.view!.addSubview(scrollView!)
        scrollView.contentSize = CGXSizeMake(CGX_ScreenMaxWidth(), CGX_ScreenMaxHeight() * 4)
        scrollView.backgroundColor = UIColor.blackColor()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false

        coverView = CoverView(frame: CGXRectMake(0, CGX_ScreenMaxHeight() * 0, CGX_ScreenMaxWidth(), CGX_ScreenMaxHeight()))
        scrollView!.addSubview(coverView!)
        coverView!.setUpUIComponents()
        bioView = BioView(frame: CGXRectMake(0, CGX_ScreenMaxHeight(), CGX_ScreenMaxWidth(), CGX_ScreenMaxHeight()))
        scrollView!.addSubview(bioView!)
        bioView!.setUpUIComponents()
        videoView = VideoView(frame: CGXRectMake(0, CGX_ScreenMaxHeight() * 2, CGX_ScreenMaxWidth(), CGX_ScreenMaxHeight()))
        scrollView!.addSubview(videoView!)
        videoView!.setUpUIComponents()
        portfolioView = PortfolioView(frame: CGXRectMake(0, CGX_ScreenMaxHeight() * 3, CGX_ScreenMaxWidth(), CGX_ScreenMaxHeight()))
        scrollView!.addSubview(portfolioView!)
        portfolioView!.setUpUIComponents()

        self.view.userInteractionEnabled = true
        scrollView.pagingEnabled = true
        scrollView.minimumZoomScale = 1
        scrollView.maximumZoomScale = 1
        scrollView.delegate = self
        scrollView.alwaysBounceHorizontal = false
        scrollView.alwaysBounceVertical = false
        coverView!.IntroAnimationStateStart()
        bioView!.IntroAnimationStateStart()
        videoView!.IntroAnimationStateStart()
        portfolioView!.IntroAnimationStateStart()
        introBlockView = UIView(frame: CGXRectMake(0, 0, CGX_ScreenMaxWidth(), CGX_ScreenMaxHeight()))
        self.view!.addSubview(introBlockView!)
       // introBlockView.backgroundColor=UIColor(red: 1, green: 1, blue: 0, alpha: 0.3);
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action:Selector("IntroStop"))
        introBlockView!.addGestureRecognizer(tapGestureRecognizer)

    }
    
    func scrollToBioView() {
        scrollView!.scrollRectToVisible(CGXRectMake(0, CGX_ScreenMaxHeight(), CGX_ScreenMaxWidth(), CGX_ScreenMaxHeight()), animated: true)
    }
    
    func scrollToVideoView() {
        scrollView!.scrollRectToVisible(CGXRectMake(0, CGX_ScreenMaxHeight() * 2, CGX_ScreenMaxWidth(), CGX_ScreenMaxHeight()), animated: true)
    }
    
    func scrollToPortfolioView() {
        scrollView!.scrollRectToVisible(CGXRectMake(0, CGX_ScreenMaxHeight() * 3, CGX_ScreenMaxWidth(), CGX_ScreenMaxHeight()), animated: true)
    }
    
    func dismissThisController() {
        self.dismissViewControllerAnimated(true, completion: {() -> Void in
        })
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        //    CGFloat pageWidth = scrollView.frame.size.height;
        //    int page = floor((scrollView.contentOffset.y - CGX_ScreenMaxHeight()/ 2) / pageWidth) + 1;
        //
        //    if(page==1)
        //    {
        //        [view2 IntroAnimation];
        //
        //    }
        //    else if(page==2)
        //    {
        //        [view4 IntroAnimation];
        //
        //    }
        //    else if (page==3)
        //    {
        //        [view5 IntroAnimation];
        //
        //    }
        //    NSLog(@"%d",page);
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        isInIntroMode = true
        countSec = 0
        NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("autoPlayLoop:"), userInfo: nil, repeats: true)
        coverView!.IntroAnimation()
    }
    
    func IntroStop() {
        if isInIntroMode == true {
            // [self IntroStop];
            introBlockView!.hidden = true
            isInIntroMode = false
            coverView!.IntroAnimationStateEnd()
            bioView!.IntroAnimationStateEnd()
            videoView!.IntroAnimationStateEnd()
            portfolioView!.IntroAnimationStateEnd()
        }
    }
    
    func autoPlayLoop(sender: AnyObject) {
        
        
        if isInIntroMode == true {
            
            countSec += 1
            
            if countSec == 2 {
                UIView.animateWithDuration(0.5, delay: 4, options: .CurveLinear, animations: {() -> Void in
                    
                    self.scrollView!.scrollRectToVisible(CGXRectMake(0, CGX_ScreenMaxHeight(), CGX_ScreenMaxWidth(), CGX_ScreenMaxHeight()), animated: false)
                    
                    }, completion: {(finished: Bool) -> Void in
                })
            }
            if countSec == 6 {
                
                self.bioView!.IntroAnimation()

            }

            
            if countSec == 8 {
                UIView.animateWithDuration(0.5, delay: 4, options: .CurveLinear, animations: {() -> Void in
                    self.scrollView!.scrollRectToVisible(CGXRectMake(0, CGX_ScreenMaxHeight() * 2, CGX_ScreenMaxWidth(), CGX_ScreenMaxHeight()), animated: false)
                    }, completion: {(finished: Bool) -> Void in
                })
            }
            if countSec == 12 {
                
                self.videoView!.IntroAnimation()
                
            }

            if countSec == 13 {
                UIView.animateWithDuration(0.5, delay: 4, options: .CurveLinear, animations: {() -> Void in
                    self.scrollView!.scrollRectToVisible(CGXRectMake(0, CGX_ScreenMaxHeight() * 3, CGX_ScreenMaxWidth(), CGX_ScreenMaxHeight()), animated: false)
                    }, completion: {(finished: Bool) -> Void in
                        self.videoView!.IntroAnimationStateEnd()
                        self.portfolioView!.IntroAnimation()
                        self.IntroStop()
                })
            }

        }
        
    }
}

class ModelView: UIView {

    
    
     func firstViewController(fromResponder responder: UIResponder) -> UIViewController? {
        func traverseResponderChainForUIViewController(responder: UIResponder) -> UIViewController? {
            if let nextResponder = responder.nextResponder() {
                if let nextResp = nextResponder as? UIViewController {
                    return nextResp
                } else {
                    return traverseResponderChainForUIViewController(nextResponder)
                }
            }
            return nil
        }
        
        return traverseResponderChainForUIViewController(responder)
    }
    
}
class BioItemView: ModelView {
    var fullScreenPreview: UIView!
    var dataDict = [NSObject : AnyObject]()
    
    
    
   
    func setUpUIComponents() {
        
        let screenTitle = UILabel(frame: CGXRectMake(20, 70, 200, 30))
        self.addSubview(screenTitle)
        screenTitle.textColor = UIColor.whiteColor()
        screenTitle.textAlignment = .Left
        screenTitle.text = "MY STORY"
        screenTitle.font = UIFont(name: k_fontExtraBold, size: 15)
        let storyTitle = UILabel(frame: CGXRectMake(20, 105, CGX_ScreenMaxWidth() - 40, CGX_ScreenMaxHeight() - 285))
        self.addSubview(storyTitle)
        storyTitle.textColor = UIColor.whiteColor()
        storyTitle.textAlignment = .Left
        //  storyTitle.text=@"I Am an Architect. We are not fully defined by just our occupations.";
        storyTitle.numberOfLines = 0
        //  storyTitle.font=[UIFont fontWithName:k_fontExtraBold size:30];

        // The output below is limited by 1 KB.
        // Please Sign Up (Free!) to remove this limitation.
        
        let mutableStr = NSMutableAttributedString()
        let font1 = UIFont(name: k_fontExtraBold, size: 25.0)
        let attrsDictionary1 = [
            NSFontAttributeName : font1!
        ]
        
        let font2 = UIFont(name: k_fontRegular, size: 15.0)
        let attrsDictionary2 = [
            NSFontAttributeName : font2!
        ]
        
        let attrString1 = NSAttributedString(string: " \(dataDict["title"]!)", attributes: attrsDictionary1)
        
        let attrString2 = NSAttributedString(string: "\n\n\(dataDict["desc"]!)", attributes: attrsDictionary2)
        mutableStr.appendAttributedString(attrString1)
        mutableStr.appendAttributedString(attrString2)
        storyTitle.attributedText = mutableStr
        
        
        let readMoreBtn = UIButton(frame: CGXRectMake(CGX_ScreenMaxWidth() - 140, CGX_ScreenMaxHeight() - 180, 100, 20))
        self.addSubview(readMoreBtn)
        readMoreBtn.setTitle("Read More", forState: .Normal)
        readMoreBtn.titleLabel!.font = UIFont(name: k_fontRegular, size: 15.0)
        readMoreBtn.contentHorizontalAlignment = .Right
        readMoreBtn.addTarget(self, action: Selector("callFull:"), forControlEvents: .TouchUpInside)
        let tagContent = UILabel(frame: CGXRectMake(20, CGX_ScreenMaxHeight() - 140, CGX_ScreenMaxWidth() - 40, 60))
        self.addSubview(tagContent)
        tagContent.textColor = UIColor.whiteColor()
        tagContent.textAlignment = .Justified
        tagContent.text = dataDict["tags"]!.lowercaseString
        tagContent.numberOfLines = 2
        tagContent.font = UIFont(name: k_fontSemiBold, size: 14)

    }
    
    func setUpData(dictionary: [NSObject : AnyObject]) {
        
        dataDict=dictionary;
        
    }
    func callFull(sender: AnyObject) {
    }
    
    func fullScreenStop() {
        fullScreenPreview!.removeFromSuperview()
    }
}

class PortfolioItemView: ModelView {
    func setUpPortfolioItemViewWithPageNo(number: Int, andMax max: Int) {
        
        let imageView = UIImageView(frame: self.bounds)
        self.addSubview(imageView)
        imageView.image = UIImage(named: "Portfolio\(number + 1).jpeg")!
        imageView.contentMode = .ScaleAspectFill
        imageView.clipsToBounds = true
        
        let shadow1 = UIImageView(frame: CGXRectMake(0, CGX_ScreenMaxHeight() / 2, CGX_ScreenMaxWidth(), CGX_ScreenMaxHeight() / 2))
        self.addSubview(shadow1)
        shadow1.image = UIImage(named: "BlackShadow")!
        shadow1.contentMode = .ScaleToFill
        shadow1.alpha = 0.8
    }
}
class CoverView: ModelView {
    var bioTitle: UILabel!
    var connectionCount: UILabel!
    var connectionLabel: UILabel!
    var profileViewCount: UILabel!
    var profileLabel: UILabel!
    var closeBtn: UIButton!
    var downBtn: UIButton!
    var addBtn: UIButton!
    
    func setUpUIComponents() {
        
        let imageView = UIImageView(frame: self.bounds)
        self.addSubview(imageView)
        
        imageView.image = UIImage(named: "CoverPhoto")!
        imageView.contentMode = .ScaleAspectFill
        let shadow1 = UIImageView(frame: CGXRectMake(0, CGX_ScreenMaxHeight() / 2, CGX_ScreenMaxWidth(), CGX_ScreenMaxHeight() / 2))
        self.addSubview(shadow1)
        
        shadow1.image = UIImage(named: "BlackShadow")!
        shadow1.contentMode = .ScaleToFill
        shadow1.alpha = 0.8

        bioTitle = UILabel(frame: CGXRectMake(40, CGX_ScreenMaxHeight() / 2 - 50, CGX_ScreenMaxWidth() - 80, 180))
        self.addSubview(bioTitle!)
        bioTitle.textColor = UIColor.whiteColor()
        bioTitle.textAlignment = .Left
        bioTitle.text = "Hey,\nI'm Sally"
        bioTitle.numberOfLines = 2
        bioTitle.adjustsFontSizeToFitWidth = true
        bioTitle.font = UIFont(name: k_fontBold, size: 90)
        connectionCount = UILabel(frame: CGXRectMake(0, 0, 100, 20))
        connectionCount.textColor = UIColor.whiteColor()
        connectionCount.textAlignment = .Center
        connectionCount.text = "50K"
        self.addSubview(connectionCount!)
        
        
        connectionCount.font = UIFont(name: k_fontBold, size: 14)
        connectionLabel = UILabel(frame: CGXRectMake(0, 0, 100, 20))
        connectionLabel.textColor = UIColor.whiteColor()
        connectionLabel.textAlignment = .Center
        connectionLabel.text = "connections"
        self.addSubview(connectionLabel!)
        connectionLabel.font = UIFont(name: k_fontSemiBold, size: 12)
        profileViewCount = UILabel(frame: CGXRectMake(0, 0, 100, 20))
        profileViewCount.textColor = UIColor.whiteColor()
        profileViewCount.textAlignment = .Center
        profileViewCount.text = "750K"
        self.addSubview(profileViewCount!)

        profileViewCount.font = UIFont(name: k_fontBold, size: 14)
        profileLabel = UILabel(frame: CGXRectMake(0, 0, 100, 20))
        profileLabel.textColor = UIColor.whiteColor()
        profileLabel.textAlignment = .Center
        profileLabel.text = "profile views"
        self.addSubview(profileLabel!)
        profileLabel.font = UIFont(name: k_fontSemiBold, size: 12)
        closeBtn = UIButton(frame: CGXRectMake(0, 0, 45, 45))
        self.addSubview(closeBtn!)
        closeBtn.center = CGXPointMake(CGX_ScreenMaxWidth() / 2, CGX_ScreenMaxHeight() - 50)
        closeBtn!.setBackgroundImage(UIImage(named: "closeBtn")!, forState: .Normal)
        closeBtn.backgroundColor = UIColor(white: 1.0, alpha: 0.1)
        closeBtn.layer.cornerRadius = 45 / 2 * CGX_scaleFactor()
        closeBtn.clipsToBounds = true
        closeBtn!.addTarget(self, action: Selector("closeBtnClicked:"), forControlEvents: .TouchUpInside)


        downBtn = UIButton(frame: CGXRectMake(0, 0, 45, 45))
        self.addSubview(downBtn!)
        downBtn.center = CGXPointMake(CGX_ScreenMaxWidth() - 25, CGX_ScreenMaxHeight() - 35)
        downBtn!.setBackgroundImage(UIImage(named: "Arrow_down")!, forState: .Normal)
        downBtn!.addTarget(self, action: Selector("downBtnClicked:"), forControlEvents: .TouchUpInside)
        addBtn = UIButton(frame: CGXRectMake(CGX_ScreenMaxWidth() - 25, 25, 45, 45))
        self.addSubview(addBtn!)
        addBtn.center = CGXPointMake(CGX_ScreenMaxWidth() - 40, 58)
        addBtn!.setBackgroundImage(UIImage(named: "addBtn")!, forState: .Normal)

    }
    
    func IntroAnimationStateStart() {
        bioTitle.alpha = 0
        connectionCount.alpha = 0
        connectionLabel.alpha = 0
        profileViewCount.alpha = 0
        profileLabel.alpha = 0
        downBtn.alpha = 0
        closeBtn.alpha = 0
        addBtn.alpha = 0
        bioTitle.frame = CGXRectMake(22, CGX_ScreenMaxHeight() / 2 + 200, (CGX_ScreenMaxWidth() - 44) * 0.65, 115)
        downBtn.center = CGXPointMake(CGX_ScreenMaxWidth() - 25, CGX_ScreenMaxHeight() - 35 + 200)
        closeBtn.center = CGXPointMake(CGX_ScreenMaxWidth() / 2, CGX_ScreenMaxHeight() - 35 + 200)
        connectionCount.center = CGXPointMake(CGX_ScreenMaxWidth() / 2 - 85, CGX_ScreenMaxHeight() - 95)
        connectionLabel.center = CGXPointMake(CGX_ScreenMaxWidth() / 2 - 85, CGX_ScreenMaxHeight() - 80)
        profileViewCount.center = CGXPointMake(CGX_ScreenMaxWidth() / 2 + 85, CGX_ScreenMaxHeight() - 95)
        profileLabel.center = CGXPointMake(CGX_ScreenMaxWidth() / 2 + 85, CGX_ScreenMaxHeight() - 80)
        addBtn.center = CGXPointMake(CGX_ScreenMaxWidth() - 40, 58 - 200)

    }
    
    func IntroAnimationStateEnd() {
        
        bioTitle.frame = CGXRectMake(22, CGX_ScreenMaxHeight() / 2 - 0, (CGX_ScreenMaxWidth() - 44) * 0.65, 115)
        connectionCount.center = CGXPointMake(CGX_ScreenMaxWidth() / 2 - 85, CGX_ScreenMaxHeight() - 95)
        connectionLabel.center = CGXPointMake(CGX_ScreenMaxWidth() / 2 - 85, CGX_ScreenMaxHeight() - 80)
        profileViewCount.center = CGXPointMake(CGX_ScreenMaxWidth() / 2 + 85, CGX_ScreenMaxHeight() - 95)
        profileLabel.center = CGXPointMake(CGX_ScreenMaxWidth() / 2 + 85, CGX_ScreenMaxHeight() - 80)
        addBtn.center = CGXPointMake(CGX_ScreenMaxWidth() - 40, 58)
        downBtn.center = CGXPointMake(CGX_ScreenMaxWidth() - 25, CGX_ScreenMaxHeight() - 35)
        closeBtn.center = CGXPointMake(CGX_ScreenMaxWidth() / 2, CGX_ScreenMaxHeight() - 35)
        downBtn.alpha = 1
        closeBtn.alpha = 1
        bioTitle.alpha = 1
        addBtn.alpha = 1
        connectionCount.alpha = 1
        connectionLabel.alpha = 1
        profileViewCount.alpha = 1
        profileLabel.alpha = 1

        
    }
    
    func IntroAnimation() {
        
        UIView.animateWithDuration(1.0, animations: {() -> Void in
            self.bioTitle.frame = CGXRectMake(22, CGX_ScreenMaxHeight() / 2 - 0, (CGX_ScreenMaxWidth() - 44) * 0.65, 115)
            self.bioTitle.alpha = 1
        })
        UIView.animateWithDuration(1.0, delay: 1.0, options: .CurveLinear, animations: {() -> Void in
            self.connectionCount.center = CGXPointMake(CGX_ScreenMaxWidth() / 2 - 85, CGX_ScreenMaxHeight() - 95)
            self.connectionLabel.center = CGXPointMake(CGX_ScreenMaxWidth() / 2 - 85, CGX_ScreenMaxHeight() - 80)
            self.profileViewCount.center = CGXPointMake(CGX_ScreenMaxWidth() / 2 + 85, CGX_ScreenMaxHeight() - 95)
            self.profileLabel.center = CGXPointMake(CGX_ScreenMaxWidth() / 2 + 85, CGX_ScreenMaxHeight() - 80)
            self.connectionCount.alpha = 1
            self.connectionLabel.alpha = 1
            self.profileViewCount.alpha = 1
            self.profileLabel.alpha = 1
            }, completion: {(finished: Bool) -> Void in
        })

        UIView.animateWithDuration(1.0, delay: 1.5, options: .CurveLinear, animations: {() -> Void in
            self.downBtn.center = CGXPointMake(CGX_ScreenMaxWidth() - 25, CGX_ScreenMaxHeight() - 35)
            self.closeBtn.center = CGXPointMake(CGX_ScreenMaxWidth() / 2, CGX_ScreenMaxHeight() - 35)
            self.downBtn.alpha = 1
            self.closeBtn.alpha = 1
            self.addBtn.center = CGXPointMake(CGX_ScreenMaxWidth() - 40, 58)
            self.addBtn.alpha = 1
            }, completion: {(finished: Bool) -> Void in
        })

     
    }
    
    func downBtnClicked(sender: AnyObject) {
        let vc=self.firstViewController(fromResponder: self) as! ProfileViewController
        vc.scrollToBioView()
    }
    
    func closeBtnClicked(sender: AnyObject) {
        let vc=self.firstViewController(fromResponder: self) as! ProfileViewController
        vc.dismissViewControllerAnimated(true, completion: { _ in })
    }
        
    
}
class BioView: ModelView {
    var scrollView: UIScrollView!
    var closeBtn: UIButton!
    var downBtn: UIButton!
    var dataArray = [AnyObject]()
    
    func setUpUIComponents() {
        
        
        // The output below is limited by 1 KB.
        // Please Sign Up (Free!) to remove this limitation.
        
        dataArray = [AnyObject]()
        let dict1 = ["title": "Explaining All Of U.S. Energy Use With A Genius Chart And Cheeseburgers", "desc": "Saul Griffith really, really likes to quantify things about energy and carbon. You can watch the MacArthur genius award winner and entrepreneur soberly dissect his formerly unsustainable lifestyle in more detail than you ever thought possible here and here.", "tags": "#tesla #Electric Car #Energy #charts"]
        
        let dict2 = ["title": "Saul Griffith really, really likes to quantify things about energy and carbon.", "desc": "Before 9:00 a.m. on a Tuesday morning in August, APEX Gymnastics in Leesburg, Virginia, is already filled with dozens of budding gymnasts. The three-year-olds, dressed in leotards still too big for them and with ponytails that won’t stay up, bounce on the trampoline, while the intermediate-level girls laugh amongst themselves as they put chalk on their hands and prepare to tackle the daunting uneven bars or four-inch balance beams.", "tags": "#sports #women #tesla #general"]
        
        let dict3 = ["title": "When one girl has to drop, I feel a lot of anguish,” she said. “I also feel a lot for the parents.", "desc": "Welch, who coached the “immensely talented” Sara at APEX, said seeing girls leave is particularly heartbreaking because gymnastics is more than just a sport — it’s a social outlet and a second family for many of them. Plus, it was tough to see one of the few non-white families at the gym forced to walk away because of time and money.", "tags": "#sports #olympics #race #features #video"]
        
        dataArray.append(dict1)
        dataArray.append(dict2)
        dataArray.append(dict3)
        self.backgroundColor = UIColor(red: 229 / 255.0, green: 58 / 255.0, blue: 63 / 255.0, alpha: 1.0)
        scrollView = UIScrollView(frame: CGXRectMake(0, 0, CGX_ScreenMaxWidth(), CGX_ScreenMaxHeight()))
        self.addSubview(scrollView!)
        
        scrollView.contentSize = CGXSizeMake(CGX_ScreenMaxWidth() * 3, CGX_ScreenMaxHeight())
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.pagingEnabled = true

        
        for i in 0..<dataArray.count {
            let view = BioItemView(frame: CGXRectMake(CGX_ScreenMaxWidth() * CGFloat(i), 0, CGX_ScreenMaxWidth(), CGX_ScreenMaxHeight()))
            scrollView!.addSubview(view)
            view.setUpData(dataArray[i] as! [NSObject : AnyObject])
            view.setUpUIComponents()
        }
        closeBtn = UIButton(frame: CGXRectMake(0, 0, 45, 45))
        self.addSubview(closeBtn!)
        closeBtn.center = CGXPointMake(CGX_ScreenMaxWidth() / 2, CGX_ScreenMaxHeight() - 35)
        closeBtn!.setBackgroundImage(UIImage(named: "closeBtn")!, forState: .Normal)
        closeBtn.backgroundColor = UIColor(white: 1.0, alpha: 0.1)
        closeBtn.layer.cornerRadius = 45 / 2 * CGX_scaleFactor()
        closeBtn.clipsToBounds = true
        closeBtn!.addTarget(self, action: Selector("closeBtnClicked:"), forControlEvents: .TouchUpInside)
        downBtn = UIButton(frame: CGXRectMake(0, 0, 50, 50))
        self.addSubview(downBtn!)
        downBtn.center = CGXPointMake(CGX_ScreenMaxWidth() - 25, CGX_ScreenMaxHeight() - 35)
        downBtn!.setBackgroundImage(UIImage(named: "Arrow_down")!, forState: .Normal)
        downBtn!.addTarget(self, action: Selector("downBtnClicked:"), forControlEvents: .TouchUpInside)

    }
    
    
    func IntroAnimation() {
        UIView.animateWithDuration(0.0, animations: {() -> Void in
            }, completion: {(finished: Bool) -> Void in
                UIView.animateWithDuration(1.0, animations: {() -> Void in
                    self.IntroAnimationStateEnd()
                })
        })
        UIView.animateWithDuration(1.0, delay: 0, options: .CurveLinear, animations: {() -> Void in
            self.downBtn.center = CGXPointMake(CGX_ScreenMaxWidth() - 25, CGX_ScreenMaxHeight() - 35)
            self.closeBtn.center = CGXPointMake(CGX_ScreenMaxWidth() / 2, CGX_ScreenMaxHeight() - 35)
            self.downBtn.alpha = 1
            self.closeBtn.alpha = 1
            }, completion: {(finished: Bool) -> Void in
        })

    }
    
    func closeBtnClicked(sender: AnyObject) {
        
        let vc=self.firstViewController(fromResponder: self) as! ProfileViewController
        
        vc.dismissViewControllerAnimated(true, completion: { _ in })
    }
    
    func downBtnClicked(sender: AnyObject) {
        let vc=self.firstViewController(fromResponder: self) as! ProfileViewController
        vc.scrollToVideoView()
    }
    
    func IntroAnimationStateStart() {
        scrollView.alpha = 0
        downBtn.center = CGXPointMake(CGX_ScreenMaxWidth() - 25, CGX_ScreenMaxHeight() - 35 + 200)
        closeBtn.center = CGXPointMake(CGX_ScreenMaxWidth() / 2, CGX_ScreenMaxHeight() - 35 + 200)
        downBtn.alpha = 0
        closeBtn.alpha = 0
    }
    
    func IntroAnimationStateEnd() {
        scrollView.alpha = 1
        downBtn.center = CGXPointMake(CGX_ScreenMaxWidth() - 25, CGX_ScreenMaxHeight() - 35)
        closeBtn.center = CGXPointMake(CGX_ScreenMaxWidth() / 2, CGX_ScreenMaxHeight() - 35)
        downBtn.alpha = 1
        closeBtn.alpha = 1
    }
}

class VideoView: ModelView {
    var player: AVPlayer!
    var playBtn: UIButton!
    var closeBtn: UIButton!
    var downBtn: UIButton!
    
    func setUpUIComponents() {
        
        
        
        let videoURL=NSBundle.mainBundle().URLForResource("mag_app_reducedvid", withExtension: "mp4")
        
        // create an AVPlayer
      //  player = AVPlayer.playerWithURL(videoURL!)
        player = AVPlayer(playerItem: AVPlayerItem(URL: videoURL!))
        // create a player view controller
        let controller = AVPlayerViewController()
        controller.player = player!
        player!.prepareForInterfaceBuilder()
        player!.addObserver(self, forKeyPath: "rate", options: [], context: nil)
        // show the view controller
        //[self addChildViewController:controller];
        self.addSubview(controller.view!)
        controller.view.frame = self.bounds
        controller.showsPlaybackControls = false
       controller.videoGravity = AVLayerVideoGravityResizeAspectFill
        let shadow1 = UIImageView(frame: CGXRectMake(0, CGX_ScreenMaxHeight() / 2, CGX_ScreenMaxWidth(), CGX_ScreenMaxHeight() / 2))
        self.addSubview(shadow1)

        shadow1.image = UIImage(named: "BlackShadow")!
        shadow1.contentMode = .ScaleToFill
        shadow1.alpha = 0.8
        playBtn = UIButton(frame: CGXRectMake(0, 0, 80, 80))
        self.addSubview(playBtn!)
        playBtn.center = CGXPointMake(CGX_ScreenMaxWidth() / 2, CGX_ScreenMaxHeight() / 2)
        playBtn!.setBackgroundImage(UIImage(named: "playBtn")!, forState: .Normal)
        playBtn!.addTarget(self, action: Selector("playBtnClicked:"), forControlEvents: .TouchUpInside)
        closeBtn = UIButton(frame: CGXRectMake(0, 0, 45, 45))
        self.addSubview(closeBtn!)
        closeBtn.center = CGXPointMake(CGX_ScreenMaxWidth() / 2, CGX_ScreenMaxHeight() - 35)
        closeBtn!.setBackgroundImage(UIImage(named: "closeBtn")!, forState: .Normal)
        closeBtn.backgroundColor = UIColor(white: 1.0, alpha: 0.1)
        closeBtn.layer.cornerRadius = 45 / 2 * CGX_scaleFactor()
        closeBtn.clipsToBounds = true
        closeBtn!.addTarget(self, action: Selector("closeBtnClicked:"), forControlEvents: .TouchUpInside)
        
        downBtn = UIButton(frame: CGXRectMake(0, 0, 50, 50))
        self.addSubview(downBtn!)
        downBtn.center = CGXPointMake(CGX_ScreenMaxWidth() - 25, CGX_ScreenMaxHeight() - 35)
        downBtn!.setBackgroundImage(UIImage(named: "Arrow_down")!, forState: .Normal)
        downBtn!.addTarget(self, action: Selector("downBtnClicked:"), forControlEvents: .TouchUpInside)

        
    }
    
    
    func IntroAnimation() {
        player!.play()
        UIView.animateWithDuration(1.0, animations: {() -> Void in
            }, completion: {(finished: Bool) -> Void in
        })
        UIView.animateWithDuration(1.0, delay: 0, options: .CurveLinear, animations: {() -> Void in
            self.downBtn.center = CGXPointMake(CGX_ScreenMaxWidth() - 25, CGX_ScreenMaxHeight() - 35)
            self.closeBtn.center = CGXPointMake(CGX_ScreenMaxWidth() / 2, CGX_ScreenMaxHeight() - 35)
            self.downBtn.alpha = 1
            self.closeBtn.alpha = 1
            }, completion: {(finished: Bool) -> Void in
        })
    }
    
    
    func IntroAnimationStateStart() {
        downBtn.center = CGXPointMake(CGX_ScreenMaxWidth() - 25, CGX_ScreenMaxHeight() - 35 + 200)
        closeBtn.center = CGXPointMake(CGX_ScreenMaxWidth() / 2, CGX_ScreenMaxHeight() - 35 + 200)
        downBtn.alpha = 0
        closeBtn.alpha = 0
    }
    
    func IntroAnimationStateEnd() {
        downBtn.center = CGXPointMake(CGX_ScreenMaxWidth() - 25, CGX_ScreenMaxHeight() - 35)
        closeBtn.center = CGXPointMake(CGX_ScreenMaxWidth() / 2, CGX_ScreenMaxHeight() - 35)
        downBtn.alpha = 1
        closeBtn.alpha = 1
        player!.pause()
    }
    
    override func removeFromSuperview() {
        player!.removeObserver(self, forKeyPath: "rate")
        super.removeFromSuperview()
    }
    
    func downBtnClicked(sender: AnyObject) {
        let vc=self.firstViewController(fromResponder: self) as! ProfileViewController
        vc.scrollToPortfolioView()
    }
    
    func closeBtnClicked(sender: AnyObject) {
        let vc=self.firstViewController(fromResponder: self) as! ProfileViewController
        vc.dismissViewControllerAnimated(true, completion: { _ in })
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>)
    {
        if (keyPath == "rate") {
            if self.player!.rate==0.0 {
                playBtn.hidden = false
            }
            else {
                playBtn.hidden = true
            }
        }
    }
    
    
    
    func playBtnClicked(sender: AnyObject) {
        playBtn.hidden = true
        player!.seekToTime(kCMTimeZero)
        player!.play()
    }
}
class PortfolioView: ModelView, UIScrollViewDelegate {
    var prevBtn: UIButton!
    var closeBtn: UIButton!
    var nextBtn: UIButton!
    var likeBtn: UIButton!
    var commentBtn: UIButton!
    var shareBtn: UIButton!
    var likeCount: UILabel!
    var commentCount: UILabel!
    var tagLabel: UILabel!
    var timeLabel: UILabel!
    var photoLabel: UILabel!
    var lineView: UIView!
    var pagesArray = [AnyObject]()
    var scrollView: UIScrollView!
    
    func setUpUIComponents() {
        
        
        pagesArray = [AnyObject]()
        scrollView = UIScrollView(frame: CGXRectMake(0, 0, CGX_ScreenMaxWidth(), CGX_ScreenMaxHeight()))
        self.addSubview(scrollView!)
        scrollView.contentSize = CGXSizeMake(CGX_ScreenMaxWidth() * 3, CGX_ScreenMaxHeight())
        scrollView.backgroundColor = UIColor.blackColor()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.pagingEnabled = true
        for i in 0..<3 {
            let view = PortfolioItemView(frame: CGXRectMake(CGX_ScreenMaxWidth() * CGFloat(i), 0, CGX_ScreenMaxWidth(), CGX_ScreenMaxHeight()))
            scrollView!.addSubview(view)
            view.setUpPortfolioItemViewWithPageNo(i, andMax: 3)
            pagesArray.append(view)
        }

        prevBtn = UIButton(frame: CGXRectMake(0, 0, 45, 45))
        self.addSubview(prevBtn!)
        prevBtn!.setBackgroundImage(UIImage(named: "Arrow_left")!, forState: .Normal)
        closeBtn = UIButton(frame: CGXRectMake(0, 0, 45, 45))
        self.addSubview(closeBtn!)
        closeBtn!.setBackgroundImage(UIImage(named: "closeBtn")!, forState: .Normal)
        closeBtn.backgroundColor = UIColor(white: 1.0, alpha: 0.1)
        closeBtn.layer.cornerRadius = 45 / 2 * CGX_scaleFactor()
        closeBtn.clipsToBounds = true
        closeBtn!.addTarget(self, action: Selector("closeBtnClicked:"), forControlEvents: .TouchUpInside)
        nextBtn = UIButton(frame: CGXRectMake(0, 0, 45, 45))
        self.addSubview(nextBtn!)

        nextBtn!.setBackgroundImage(UIImage(named: "Arrow_right")!, forState: .Normal)
        lineView = UIView(frame: CGXRectMake(12, CGX_ScreenMaxHeight() - 69, CGX_ScreenMaxWidth() - 24, 1))
        self.addSubview(lineView!)
        lineView.backgroundColor = UIColor(white: 1.0, alpha: 0.2)
        likeBtn = UIButton(frame: CGXRectMake(12, CGX_ScreenMaxHeight() - 112, 40, 40))
        self.addSubview(likeBtn!)
        likeBtn!.setBackgroundImage(UIImage(named: "like")!, forState: .Normal)
        commentBtn = UIButton(frame: CGXRectMake(CGX_ScreenMaxWidth() / 2 - 40 / 2, CGX_ScreenMaxHeight() - 112, 40, 40))
        self.addSubview(commentBtn!)

        commentBtn!.setBackgroundImage(UIImage(named: "comments")!, forState: .Normal)
        shareBtn = UIButton(frame: CGXRectMake(CGX_ScreenMaxWidth() - 12 - 40, CGX_ScreenMaxHeight() - 112, 40, 40))
        self.addSubview(shareBtn!)
        shareBtn!.setBackgroundImage(UIImage(named: "share")!, forState: .Normal)
        likeCount = UILabel(frame: CGXRectMake(12, CGX_ScreenMaxHeight() - 132, 40, 30))
        likeCount.text = "12"
        likeCount.textColor = UIColor.whiteColor()
        self.addSubview(likeCount!)

        likeCount.textAlignment = .Center
        likeCount.font = UIFont(name: k_fontSemiBold, size: 14)
        commentCount = UILabel(frame: CGXRectMake(CGX_ScreenMaxWidth() / 2 - 20, CGX_ScreenMaxHeight() - 132, 40, 30))
        commentCount.text = "5"
        commentCount.textColor = UIColor.whiteColor()
        self.addSubview(commentCount!)
        commentCount.textAlignment = .Center
        commentCount.font = UIFont(name: k_fontSemiBold, size: 14)

        lineView.frame = CGXRectMake(12, CGX_ScreenMaxHeight() - 69, CGX_ScreenMaxWidth() - 24, 1)
        likeBtn.frame = CGXRectMake(12, CGX_ScreenMaxHeight() - 112, 40, 40)
        commentBtn.frame = CGXRectMake(CGX_ScreenMaxWidth() / 2 - 40 / 2, CGX_ScreenMaxHeight() - 112, 40, 40)
        shareBtn.frame = CGXRectMake(CGX_ScreenMaxWidth() - 12 - 40, CGX_ScreenMaxHeight() - 112, 40, 40)
        commentCount.frame = CGXRectMake(CGX_ScreenMaxWidth() / 2 - 20, CGX_ScreenMaxHeight() - 132, 40, 30)
        likeCount.frame = CGXRectMake(12, CGX_ScreenMaxHeight() - 132, 40, 30)
        tagLabel = UILabel(frame: CGXRectMake(22, CGX_ScreenMaxHeight() - 160, CGX_ScreenMaxWidth() - 60, 20))
        tagLabel.text = "Wild Life"
        tagLabel.textColor = UIColor.whiteColor()
        self.addSubview(tagLabel!)

        tagLabel.font = UIFont(name: k_fontSemiBold, size: 14)
        timeLabel = UILabel(frame: CGXRectMake(CGX_ScreenMaxWidth() - 100, CGX_ScreenMaxHeight() - 160, 100 - 22, 20))
        timeLabel.text = "3 hrs"
        timeLabel.textColor = UIColor.whiteColor()
        self.addSubview(timeLabel!)
        timeLabel.textAlignment = .Right
        timeLabel.font = UIFont(name: k_fontLight, size: 14)
        photoLabel = UILabel(frame: CGXRectMake(22, CGX_ScreenMaxHeight() - 220, CGX_ScreenMaxWidth() - 44, 50))
        photoLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        photoLabel.textColor = UIColor.whiteColor()
        photoLabel.numberOfLines = 2
        self.addSubview(photoLabel!)
        photoLabel.font = UIFont(name: k_fontLight, size: 15)
        scrollView.delegate = self

        prevBtn.hidden = true
        self.scrollViewDidEndDecelerating(scrollView!)
        nextBtn!.addTarget(self, action: Selector("nextBtnClicked:"), forControlEvents: .TouchUpInside)
        prevBtn!.addTarget(self, action: Selector("prevBtnClicked:"), forControlEvents: .TouchUpInside)

        
    }
    
    func IntroAnimation() {
        
        UIView.animateKeyframesWithDuration(0.5, delay: 0.4, options: .CalculationModeLinear, animations: {() -> Void in
            self.photoLabel.alpha = 1
            self.timeLabel.alpha = 1
            self.tagLabel.alpha = 1
            }, completion: {(finished: Bool) -> Void in
        })
        
        UIView.animateKeyframesWithDuration(0.5, delay: 0.8, options: .CalculationModeLinear, animations: {() -> Void in
            
            
            
            self.lineView.frame = CGXRectMake(12, CGX_ScreenMaxHeight() - 69, CGX_ScreenMaxWidth() - 24, 1)
            self.likeBtn.frame = CGXRectMake(12, CGX_ScreenMaxHeight() - 112, 40, 40)
            self.commentBtn.frame = CGXRectMake(CGX_ScreenMaxWidth() / 2 - 40 / 2, CGX_ScreenMaxHeight() - 112, 40, 40)
            self.shareBtn.frame = CGXRectMake(CGX_ScreenMaxWidth() - 12 - 40, CGX_ScreenMaxHeight() - 112, 40, 40)
            self.commentCount.frame = CGXRectMake(CGX_ScreenMaxWidth() / 2 - 20, CGX_ScreenMaxHeight() - 132, 40, 30)
            self.likeCount.frame = CGXRectMake(12, CGX_ScreenMaxHeight() - 132, 40, 30)
            self.likeBtn.alpha = 1
            self.commentBtn.alpha = 1
            self.shareBtn.alpha = 1
            self.likeCount.alpha = 1
            self.commentCount.alpha = 1
            self.lineView.alpha = 1
            self.prevBtn.center = CGXPointMake(25, CGX_ScreenMaxHeight() - 35)
            self.nextBtn.center = CGXPointMake(CGX_ScreenMaxWidth() - 25, CGX_ScreenMaxHeight() - 35)
            self.closeBtn.center = CGXPointMake(CGX_ScreenMaxWidth() / 2, CGX_ScreenMaxHeight() - 35)
            self.prevBtn.alpha = 1
            self.closeBtn.alpha = 1
            self.nextBtn.alpha = 1

            
            }, completion: {(finished: Bool) -> Void in
        })
        
        
    }
    
    func IntroAnimationStateStart() {
        
        prevBtn.alpha = 0
        closeBtn.alpha = 0
        nextBtn.alpha = 0
        likeBtn.alpha = 0
        commentBtn.alpha = 0
        shareBtn.alpha = 0
        likeCount.alpha = 0
        commentCount.alpha = 0
        tagLabel.alpha = 0
        timeLabel.alpha = 0
        photoLabel.alpha = 0
        lineView.alpha = 0
        
        prevBtn.center = CGXPointMake(50, CGX_ScreenMaxHeight() - 50 + 200)
        nextBtn.center = CGXPointMake(CGX_ScreenMaxWidth() / 2 * 2 - 50, CGX_ScreenMaxHeight() - 50 + 200)
        closeBtn.center = CGXPointMake(CGX_ScreenMaxWidth() / 2, CGX_ScreenMaxHeight() - 35 + 200)
        lineView.frame = CGXRectMake(12, CGX_ScreenMaxHeight() - 69 + 200, CGX_ScreenMaxWidth() - 24, 1)
        likeBtn.frame = CGXRectMake(12, CGX_ScreenMaxHeight() - 112 + 200, 40, 40)
        commentBtn.frame = CGXRectMake(CGX_ScreenMaxWidth() / 2 - 40 / 2, CGX_ScreenMaxHeight() - 112 + 200, 40, 40)
        shareBtn.frame = CGXRectMake(CGX_ScreenMaxWidth() - 12 - 40, CGX_ScreenMaxHeight() - 112 + 200, 40, 40)
        commentCount.frame = CGXRectMake(CGX_ScreenMaxWidth() / 2 - 20, CGX_ScreenMaxHeight() - 132 + 200, 40, 30)
        likeCount.frame = CGXRectMake(12, CGX_ScreenMaxHeight() - 132 + 200, 40, 30)


    }
    
    func IntroAnimationStateEnd() {
        
        prevBtn.center = CGXPointMake(25, CGX_ScreenMaxHeight() - 35)
        nextBtn.center = CGXPointMake(CGX_ScreenMaxWidth() - 25, CGX_ScreenMaxHeight() - 35)
        closeBtn.center = CGXPointMake(CGX_ScreenMaxWidth() / 2, CGX_ScreenMaxHeight() - 35)
        lineView.frame = CGXRectMake(12, CGX_ScreenMaxHeight() - 69, CGX_ScreenMaxWidth() - 24, 1)
        likeBtn.frame = CGXRectMake(12, CGX_ScreenMaxHeight() - 112, 40, 40)
        commentBtn.frame = CGXRectMake(CGX_ScreenMaxWidth() / 2 - 40 / 2, CGX_ScreenMaxHeight() - 112, 40, 40)
        shareBtn.frame = CGXRectMake(CGX_ScreenMaxWidth() - 12 - 40, CGX_ScreenMaxHeight() - 112, 40, 40)
        commentCount.frame = CGXRectMake(CGX_ScreenMaxWidth() / 2 - 20, CGX_ScreenMaxHeight() - 132, 40, 30)
        likeCount.frame = CGXRectMake(12, CGX_ScreenMaxHeight() - 132, 40, 30)

        prevBtn.alpha = 1
        closeBtn.alpha = 1
        nextBtn.alpha = 1
        likeBtn.alpha = 1
        commentBtn.alpha = 1
        shareBtn.alpha = 1
        likeCount.alpha = 1
        commentCount.alpha = 1
        tagLabel.alpha = 1
        timeLabel.alpha = 1
        photoLabel.alpha = 1
        lineView.alpha = 1

    }
    
    func closeBtnClicked(sender: AnyObject) {
        let vc=self.firstViewController(fromResponder: self) as! ProfileViewController
        vc.dismissViewControllerAnimated(true, completion: { _ in })
    }
    
    func nextBtnClicked(sender: AnyObject) {
        let pageWidth: CGFloat = scrollView.frame.size.width
        var page = floor((scrollView.contentOffset.x - CGX_ScreenMaxWidth() / 2) / pageWidth) + 1
        page = page + 1
        
        UIView.animateWithDuration(0.5, animations: {() -> Void in
            self.scrollView.contentOffset = CGPointMake(pageWidth * page, 0)
            }, completion: {(finished: Bool) -> Void in
                self.scrollViewDidEndDecelerating(self.scrollView!)
        })
        
    }
    
    func prevBtnClicked(sender: AnyObject) {
        let pageWidth: CGFloat = scrollView.frame.size.width
        var page = floor((scrollView.contentOffset.x - CGX_ScreenMaxWidth() / 2) / pageWidth) + 1
        page = page - 1
        UIView.animateWithDuration(0.5, animations: {() -> Void in
            self.scrollView.contentOffset = CGPointMake(pageWidth * page, 0)
            }, completion: {(finished: Bool) -> Void in
                self.scrollViewDidEndDecelerating(self.scrollView!)
        })
    }
    
    func scrollViewDidEndDecelerating(scrollView1: UIScrollView) {
        let pageWidth: CGFloat = scrollView.frame.size.width
        let page = Int(floor((scrollView.contentOffset.x - CGX_ScreenMaxWidth() / 2) / pageWidth) + 1)
        
        if page == 0 {
            prevBtn.hidden = true
            nextBtn.hidden = false
        }
        else if page == pagesArray.count - 1 {
            prevBtn.hidden = false
            nextBtn.hidden = true
        }
        else {
            prevBtn.hidden = false
            nextBtn.hidden = false
        }
        
        likeCount.text = "\(page * 5 + page * 3 + 5)"
        commentCount.text = "\(page * 2 + 3)"
        tagLabel.text = String(format: "Wildlife")
        timeLabel.text = "\(page * 2 + page * 3 + 1) hrs"
        photoLabel.text = self.randomStringWithLength(page).capitalizedString
    }
    
    func randomStringWithLength(len: Int) -> String {
        var array = ["Lorem ipsum dolor sit amet, sed elitr lobortis repudiare eu, fugit admodum has eu.", "Id mundi suscipit ullamcorper vix, ferri solet ut nam. Ad his congue tempor referrentur.", "Elit accusam per an, tation option sea cu. Cu tempor elaboraret eos, option propriae qui et."]
        return array[len]
    }
}