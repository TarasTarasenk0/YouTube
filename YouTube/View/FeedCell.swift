//
//  FeedCell.swift
//  YouTube
//
//  Created by md760 on 26.06.2018.
//  Copyright © 2018 md760. All rights reserved.
//

import UIKit

class FeedCell: BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
     var videos: [Video]?
    
    let cellId = "cellId"
    
    func fetchVideos() {
        ApiService.sharedInstance.fetchVideos { (videos: [Video]) in
            
            
            self.videos = videos
            self.collectionView.reloadData()
            
        }
    }
    
    
    override func setupViews() {
        super.setupViews()
        
        fetchVideos()
        
        addSubview(collectionView)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: collectionView)
        
        collectionView.register(VideoCell.self, forCellWithReuseIdentifier: cellId)
    }
    
   
    
         func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
            return videos?.count ?? 0
    
        }
        /// MARK: CollectionView 3 parametra!!!! -- - -  -
    
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! VideoCell
    
            cell.video = videos?[indexPath.item]
    
    
    
            return cell
    
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let height = (frame.width - 16 - 16) * 9 / 16
            return CGSize(width: frame.width, height: height + 16 + 80) // 68 = vertical constraint 8 + 44 + 16
        }
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 0
}
}
















