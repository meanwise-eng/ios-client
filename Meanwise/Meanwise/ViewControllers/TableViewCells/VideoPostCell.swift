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

    // MARK: - IBOutlets
    
    @IBOutlet weak var videoView: UIView!
    
    // MARK: - Variables
    var playerLayer: AVPlayerLayer?
    var videoUrl: String?

    // MARK: - AWAKE
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }
    
    // MARK: - Functions
    
    func setValueToCell(urlString: String, videoImage: String) {
        videoUrl = urlString
        backgroundImageView.image = UIImage(named: videoImage)
        
        initialiseAndAddAVPlayerLayer()
    }
    
    func initialiseAndAddAVPlayerLayer() {
        if playerLayer == nil {
            playerLayer = AVPlayerLayer()
            playerLayer!.videoGravity = AVLayerVideoGravityResize

            addAvPlayerLayer()
        }
    }
    
    func addAvPlayerLayer() {
        let screenSize = UIScreen.mainScreen().bounds
        
        playerLayer!.frame = CGRectMake(0.0, 0, screenSize.size.width, contentView.frame.size.height - 3.0)
        videoView.layer.addSublayer(playerLayer!)
    }
    
    func loadVideo() {
        let videoURL = NSBundle.mainBundle().URLForResource("mag_app_reducedvid", withExtension: "mp4")
        
        playerLayer!.player = AVPlayer(URL: videoURL!)
    }
    
    func playVideo() {
        if playerLayer!.player != nil {
            playerLayer!.player?.play()
        }
    }
    
    func pauseVideo() {
        if playerLayer!.player != nil {
            playerLayer!.player?.pause()
        }
    }
    
    func unloadVideo() {
        playerLayer!.player = nil
    }
    
    // MARK: - DeInit
    
    deinit {
        print("Video Post Cell is DeInitialising")
    }

}
