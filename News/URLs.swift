//
//  URLs.swift
//  News
//
//  Created by v.a.jayachandran on 15/4/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import Foundation

enum URLs {
    
}

extension URLs {
    
    static var baseURLString: String = {
        guard let urlString = Bundle.main.infoDictionary?[Config.PListKey.baseURL.rawValue] as? String else {
            fatalError("base url not found")
        }
        
        return urlString
    }()
    
    static var baseURL: URL = {
        guard let url = URL(string: baseURLString) else {
            fatalError("invalid base url \(baseURLString)")
        }
        
        return url
    }()

    static var baseURLComponents: URLComponents = {
        guard let url = URLComponents(string: baseURLString) else {
            fatalError("invalid base url \(baseURLString)")
        }
        
        return url
    }()

    
    enum NYT {
        static var topStoriesURL: URL = {
            var urlComponents = URLs.baseURLComponents
            urlComponents.path = "/svc/topstories/v2/arts.json"
            urlComponents.queryItems = [
                URLQueryItem(name: "api-key", value: Config.key)
            ]
            guard let url = urlComponents.url else {
                fatalError("unable to form url")
            }
            
            return url
        } ()
    }    
}
