//
//  SwiftNewsItemTableViewCell.swift
//  RedditApp
//
//  Created by Vaibhav Munjal on 2020-08-09.
//  Copyright © 2020 vm. All rights reserved.
//

import UIKit

class SwiftNewsItemTableViewCell: UITableViewCell {

    @IBOutlet weak var newsItemTitleLabel: UILabel!
    @IBOutlet weak var newsItemImageView: UIImageView!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func display(image: UIImage?) {
      newsItemImageView.image = image
    }
    
    func hideImageView() {
        newsItemImageView.isHidden = true
    }
}
