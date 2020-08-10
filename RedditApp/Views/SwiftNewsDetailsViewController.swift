//
//  SwiftNewsDetailsViewController.swift
//  RedditApp
//
//  Created by Vaibhav Munjal on 2020-08-09.
//  Copyright © 2020 vm. All rights reserved.
//

import UIKit

class SwiftNewsDetailsViewController: UIViewController {

    @IBOutlet weak var newsDetailsTopContstraint: NSLayoutConstraint!
    @IBOutlet weak var articleImageView: UIImageView!
    var detailsData:ChildData?
    @IBOutlet weak var newsDetailsTxtView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let detailsData = detailsData else {return}
        self.title = detailsData.title
        self.newsDetailsTxtView.text = detailsData.selftext
        if !(detailsData.thumbnail?.contains(".jpg") ?? false) {
            self.articleImageView.isHidden = true
            newsDetailsTopContstraint.constant = 8.0
        }else {
            if let imageUrl = detailsData.thumbnail {
                ImageDownloader.downloadArticleImage(imageUrl) { (articleImage) in
                        self.articleImageView.image = articleImage
                   }
            }
        }

    }
}


