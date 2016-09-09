//
//  VideoPostCell.swift
//  Meanwise
//
//  Created by Vishal on 07/09/16.
//  Copyright © 2016 Squelo. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class VideoPostCell: PostCell {

    // MARK: - Variables
    
    let controller = AVPlayerViewController()

    // MARK: - Functions
    
    override func awakeFromNib() {
        super.awakeFromNib()
        controller.showsPlaybackControls = false
        controller.view.frame = CGRectMake(0, 0.0, contentView.frame.size.width, contentView.frame.size.height - 3.0)
        contentView.addSubview(controller.view!)
        contentView.sendSubviewToBack(controller.view!)
    }
    
    func loadVideo() {
        let videoURL = NSBundle.mainBundle().URLForResource("mag_app_reducedvid", withExtension: "mp4")
        setPlayerForUrl(videoURL!)
    }
    
    func setPlayerForUrl(url: NSURL) {

        controller.player = AVPlayer(URL: url)
        controller.player!.play()
        
    }
    
//    func addObserver() {
//        NSNotificationCenter.defaultCenter().addObserverForName(AVPlayerItemDidPlayToEndTimeNotification, object: nil, queue: nil) { notification in
//            self.player!.seekToTime(kCMTimeZero)
//            self.player!.play()
//        }
//    }
//    
//    func playVideo() {
//        player?.play()
//    }
//    
//    func stopVideo() {
//        player?.pause()
//    }
    
    deinit {
        print("Video Post Cell is DeInitialising")
    }

}
