//
//  SwiftNewsItemsViewController.swift
//  RedditApp
//
//  Created by Vaibhav Munjal on 2020-08-09.
//  Copyright © 2020 vm. All rights reserved.
//

import UIKit

private let swiftNewsItemCellId = "swiftNewsItemCellId"
class SwiftNewsItemsViewController: UIViewController {
    
    @IBOutlet weak var swiftNewsTableView: UITableView!
    
    var swiftNewsModel:SwiftNewsModel? {
        didSet {
            DispatchQueue.main.async {
                self.swiftNewsTableView.reloadData()
            }
        }
    }
    
    var selectedArticle:ChildData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Swift News"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        swiftNewsTableView.estimatedRowHeight = 145.0
        swiftNewsTableView.rowHeight = UITableView.automaticDimension
        
        getLatestSwiftNews()
    }
    
    func getLatestSwiftNews() {
        APIManager.getLatestRedditItems { [weak self] (newsData, err) in
            guard let self = self else {
                return
            }
            guard err == nil else {
                self.showBasicError(title: "Error", message: "There was an error getting Reddit items.")
                return
            }
            self.swiftNewsModel = newsData
        }
    }
}

extension SwiftNewsItemsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let _ = self.swiftNewsModel?.data.children[indexPath.row].data.secure_media?.oembed.thumbnail_url {
            return 145.0
        }
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let swiftNewsItemCell = tableView.dequeueReusableCell(withIdentifier: swiftNewsItemCellId, for: indexPath) as! SwiftNewsItemTableViewCell
        swiftNewsItemCell.display(image: nil)
        
        if let newsItem = self.swiftNewsModel?.data.children[indexPath.row].data{
            swiftNewsItemCell.newsItemTitleLabel.text = newsItem.title
            
            if let imgUrl = newsItem.thumbnail {
                ImageDownloader.downloadArticleImage(imgUrl) { (articleImage) in
                    swiftNewsItemCell.display(image: articleImage)
                }
            }
        }
        return swiftNewsItemCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let swiftNewsModelData = swiftNewsModel?.data {
            if swiftNewsModelData.children.count > 0 {
                return swiftNewsModelData.children.count
            }
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsNewsView = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "newsDetailsVC") as! SwiftNewsDetailsViewController
        detailsNewsView.detailsData = self.swiftNewsModel?.data.children[indexPath.row].data
        self.navigationController?.pushViewController(detailsNewsView, animated: true)
    }
}

