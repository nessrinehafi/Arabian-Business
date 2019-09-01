//
//  VideoModel.swift
//  Arabian Business
//
//  Created by Nessrine on 9/1/19.
//  Copyright © 2019 com.NessrineHafi. All rights reserved.
//

import UIKit
import Alamofire


protocol VideoModelDelegate {
    func dataReady()
}

class VideoModel: NSObject
{
    var arrayVideos = [Video]()

    var delegate :VideoModelDelegate?

  func  getFeedVideo()
  {
    
    Alamofire.request("https://www.googleapis.com/youtube/v3/search", method: .get, parameters: ["part":"snippet","type":"video","key":"AIzaSyC2kFaEAuiX7fetWysdhGpZZlGEStOsvVk","q":"News"], encoding: URLEncoding.default, headers: nil).responseJSON { (response) -> Void in
        if let JSON = response.result.value as? [String:Any] {
            
            var arrayOfVideos = [Video]()
            
            if let videos = JSON["items"] as? [[String:Any]] {
                
                for video in videos {
                    
                    let videoObj = Video()
                    
                    if let videoId = video["snippet.resourceId.videoId"] as? String {
                        
                        videoObj.videoId = videoId
                    }
                    if let videoTitle = video["snippet.title"] as? String {
                        
                        videoObj.videoTitle = videoTitle
                    }
                    if let videoDescription = video["snippet.description"] as? String {
                        
                        videoObj.videoDescription = videoDescription
                    }
                    if let videoThumbnailUrl = video["snippet.thumbnails.maxres.url"] as? String {
                        
                        videoObj.videoThumbnailUrl = videoThumbnailUrl
                    }
                    
                    arrayOfVideos.append(videoObj)
                }
            }
        }
            if self.delegate != nil {
                self.delegate?.dataReady()
            }
            else
            {
                print("nothing")
            }
        }
    
    
    }
    
    
    
    func getVideos() ->[Video]
    {
        var videos = [Video]()
        let video1 = Video()
        video1.videoId = "1"
        video1.videoTitle = "tutp"
        video1.videoDescription = "ok"
        
        videos.append(video1)
        return videos
    }
    
    
}
