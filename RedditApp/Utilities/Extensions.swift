//
//  Extensions.swift
//  RedditApp
//
//  Created by Vaibhav Munjal on 2020-08-09.
//  Copyright © 2020 vm. All rights reserved.
//

import Foundation
import UIKit

extension String {
    var html2AttributedString: String? {
      guard let data = data(using: .utf8) else { return nil }
      do {
          return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil).string

      } catch let error as NSError {
          print(error.localizedDescription)
          return  nil
      }
    }
}


extension UIViewController {
  func showBasicError(title:String,message:String) {
    DispatchQueue.main.async {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        }
    }
}
