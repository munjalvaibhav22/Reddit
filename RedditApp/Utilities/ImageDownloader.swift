//
//  ImageDownloader.swift
//  RedditApp
//
//  Created by Vaibhav Munjal on 2020-08-09.
//  Copyright © 2020 vm. All rights reserved.
//

import Foundation
import UIKit

public class ImageDownloader {
    
    static func downloadArticleImage(_ urlToBeFetched:String, completion:@escaping (UIImage?) -> Void) {
        DispatchQueue.global(qos: .utility).async {
            guard let imageUrl = URL(string: urlToBeFetched) else {return}
            
             if let data = try? Data(contentsOf: imageUrl),
                let articleImage = UIImage(data: data)
                {
                    DispatchQueue.main.async {
                        completion(articleImage)

                    }
                }
            }
        }
    
    
}
