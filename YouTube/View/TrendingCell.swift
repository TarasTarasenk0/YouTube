//
//  TrendingCell.swift
//  YouTube
//
//  Created by md760 on 27.06.2018.
//  Copyright © 2018 md760. All rights reserved.
//

import UIKit

class TrendingCell: FeedCell {
    override func fetchVideos() {
        ApiService.sharedInstance.fetchTrendingFeed { (videos) in
            
            self.videos = videos
            self.collectionView.reloadData()
        
            
        }
    }
    
}
