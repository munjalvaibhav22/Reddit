//
//  APIManager.swift
//  RedditApp
//
//  Created by Vaibhav Munjal on 2020-08-09.
//  Copyright © 2020 vm. All rights reserved.
//

import Foundation
import UIKit

class APIManager {
    static func getLatestRedditItems(completion:@escaping (SwiftNewsModel?,GenericError?) -> Void) {
        
        APIProvider.getLatestPosts { (result) in
            switch result {
            case .success(let newsData):
                completion(newsData,nil)
                break
            case .failure(let err):
                completion(nil,err)
                break
            }
        }
    }
}


