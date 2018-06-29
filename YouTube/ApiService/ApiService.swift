//
//  ApiService.swift
//  YouTube
//
//  Created by md760 on 25.06.2018.
//  Copyright © 2018 md760. All rights reserved.
//

import UIKit

class ApiService: NSObject {
    
    static let sharedInstance = ApiService()
    
    let baseUrl = "https://s3-us-west-2.amazonaws.com/youtubeassets"
    
    func fetchVideos(completion: @escaping ([Video]) -> ()) {
        fetchFeedForUrlString(urlString: "\(baseUrl)/home.json" , completion: { (videos) in
            completion(videos)
        })
    }
    
    //    func fetchVideos(completion: @escaping ([Video]) -> ()) {
    //        let url = URL(string: "https://s3-us-west-2.amazonaws.com/youtubeassets/home.json")
    //        URLSession.shared.dataTask(with: url!) { (data, response, error) in
    //
    //            if error != nil {
    //                print(error!) //MARK: NEZSBUTT PRO ANWRAPP
    //                return
    //            }
    //
    //            do {
    //
    //                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
    //
    //                var videos = [Video]()
    //
    //                for dictionary in json as! [[String: AnyObject]] {
    //
    //                    let video = Video()
    //                    video.title = (dictionary["title"]) as? String
    //                    video.thumbnailImageName = dictionary["thumbnail_image_name"] as? String
    //
    //                    let channelDictionary = dictionary["channel"] as! [String: AnyObject]
    //
    //                    let channel = Channel()
    //                    channel.name = channelDictionary["channel"] as? String
    //                    channel.profileImageName = channelDictionary["profile_image_name"] as? String
    //
    //                    video.channel = channel
    //
    //                    videos.append(video)
    //
    //                }
    //                /// ----
    //                DispatchQueue.main.async {
    //                    completion(videos)
    //                }
    //                /// -- -- - -
    //            } catch let jsonError {
    //                print(jsonError)
    //            }
    //
    //            let str = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
    //            print(str!)
    //
    //            }.resume()
    //    }
    ///------
    func fetchTrendingFeed(completion: @escaping ([Video]) -> ()) {
        fetchFeedForUrlString(urlString: "\(baseUrl)/trending.json" , completion: { (videos) in
            completion(videos)
        })
    }
    
    ///STEP TWO
    func fetchSubscriptionFeed(completion: @escaping ([Video]) -> ()) {
        fetchFeedForUrlString(urlString: "\(baseUrl)/subscriptions.json" , completion: { (videos) in
            completion(videos)
        })
    }
    
    
    func fetchFeedForUrlString(urlString: String, completion: @escaping ([Video]) -> ()) {
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if error != nil {
                print(error!)
                return
            }
            
            do {
                if let unwrappedData = data, let jsonDictionaries = try JSONSerialization.jsonObject(with: unwrappedData, options: .mutableContainers) as? [[String: AnyObject]] {
                   
                    DispatchQueue.main.async {
                        completion(jsonDictionaries.map { return Video($0) }) //[Video]
                    }
                    
                }
                
            
            } catch let jsonError {
                print(jsonError)
            }
            
            let str = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print(str!)
            
            }.resume()
    }
    
}

//let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
//
//var videos = [Video]()
//
//for dictionary in json as! [[String: AnyObject]] {
//
//    let video = Video()
//    video.title = (dictionary["title"]) as? String
//    video.thumbnailImageName = dictionary["thumbnail_image_name"] as? String
//
//    let channelDictionary = dictionary["channel"] as! [String: AnyObject]
//
//    let channel = Channel()
//    channel.name = channelDictionary["channel"] as? String
//    channel.profileImageName = channelDictionary["profile_image_name"] as? String
//
//    video.channel = channel
//
//    videos.append(video)
//
//}
///// ----
//DispatchQueue.main.async {
//    completion(videos)





