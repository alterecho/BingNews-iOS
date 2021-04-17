//
//  URLs+NYT.swift
//  News
//
//  Created by Vijaychandran Jayachandran on 10/4/21.
//  Copyright © 2021 v.a.jayachandran. All rights reserved.
//

import Foundation

extension URLs {
    enum NYT: URLsProtocol {
        
        static var baseURLString: String = {
            guard let urlString = Bundle.main.infoDictionary?[Config.PListKey.baseURL.rawValue] as? String else {
                fatalError("base url not found")
            }
            
            return urlString
        }()

        static var baseURL: URL = getBaseURL()
        static var baseURLComponents: URLComponents = getBaseURLComponents()
        
        
        static var topStoriesURL: URL = {
            var urlComponents = URLs.NYT.baseURLComponents
            urlComponents.path = "/svc/topstories/v2/arts.json"
            urlComponents.queryItems = [
                URLQueryItem(name: "api-key", value: Config.key)
            ]
            guard let url = urlComponents.url else {
                fatalError("unable to form url")
            }
            return url
        }()
    }
}
