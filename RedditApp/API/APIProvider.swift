//
//  APIProvider.swift
//  RedditApp
//
//  Created by Vaibhav Munjal on 2020-08-08.
//  Copyright © 2020 vm. All rights reserved.
//

import Foundation

enum GenericError: Error{
    case none
    case genericError
    case httpStatusCodeError
    case emptyData
    case noResponse
    case dataParsingError
}

private let swiftNewsUrl = "https://www.reddit.com/r/swift.json"

public class APIProvider {
    static func getLatestPosts(completionHandler: @escaping (Result<SwiftNewsModel?,GenericError>) -> Void) {
        guard let url = URL.init(string: swiftNewsUrl) else {return}
        _ = URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard err == nil else {
                // handle error
                completionHandler(.failure(.genericError))
                return
            }
          
            guard let httpResponse = response as? HTTPURLResponse else {
                print("HTTP ERROR -> NO RESPONSE")
                completionHandler(.failure(.noResponse))
                return
            }
            
          guard httpResponse.statusCode == 200 else {
            print("HTTPResponse Status ->:",httpResponse.statusCode)
            completionHandler(.failure(.httpStatusCodeError))

              return
          }
            
          guard let newsData = data else {
            print("NO DATA")
            completionHandler(.failure(.emptyData))
            return
          }
            
            let decoder = JSONDecoder()
            do {
                let decodedObject = try decoder.decode(SwiftNewsModel.self, from: newsData)
                completionHandler(.success(decodedObject))
            }catch {
                completionHandler(.failure(.dataParsingError))
            }
        }.resume()
    }
}
