//
//  GetMediaData.swift
//  data
//
//  Created by Vishal on 19/09/16.
//  Copyright © 2016 Squelo. All rights reserved.
//

import Foundation
import Photos

class MediaManager {
    
    var dataArray: NSMutableArray!
    var dataManager: PHImageManager
    var requestOptions: PHImageRequestOptions
    var targetSize: CGSize
    var fetchOptions: PHFetchOptions
    
    init () {
        let screenSize: CGSize = UIScreen.mainScreen().bounds.size
        dataManager = PHImageManager.defaultManager()
        requestOptions = PHImageRequestOptions()
        requestOptions.synchronous = true
        fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key:"creationDate", ascending: true)]
        targetSize = CGSizeMake(screenSize.width, screenSize.height)
        dataArray = NSMutableArray()
    }
}

//MARK: - Methods

private extension MediaManager {
    func fetchDataAtIndexFromEnd(index:Int, type: PHAssetMediaType) {
        let fetchResult: PHFetchResult = PHAsset.fetchAssetsWithMediaType(type, options : fetchOptions)
        if fetchResult.count > 0 {
            dataManager.requestImageForAsset(fetchResult.objectAtIndex(fetchResult.count - 1 - index) as! PHAsset, targetSize : targetSize, contentMode : PHImageContentMode.AspectFill, options : requestOptions, resultHandler: { (data, _) in
                self.dataArray.addObject(data!)
                if index + 1 < fetchResult.count {
                    self.fetchDataAtIndexFromEnd(index + 1, type : type)
                }
            })
        }
    }
}

//MARK: - Getters

extension MediaManager {
    func getImages() -> NSMutableArray {
        self.fetchDataAtIndexFromEnd(0, type : PHAssetMediaType.Image)
        return self.dataArray
    }
    
    func getVideos() -> NSMutableArray {
        self.fetchDataAtIndexFromEnd(0, type : PHAssetMediaType.Video)
        return self.dataArray
    }
    
    func getImagesAndVideos() -> NSMutableArray {
        self.fetchDataAtIndexFromEnd(0, type : PHAssetMediaType.Image)
        self.fetchDataAtIndexFromEnd(0, type : PHAssetMediaType.Video)
        return self.dataArray
    }
}