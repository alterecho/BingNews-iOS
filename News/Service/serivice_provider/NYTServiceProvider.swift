//
//  NYTServiceProvider.swift
//  News
//
//  Created by Vijaychandran Jayachandran on 17/4/21.
//  Copyright © 2021 v.a.jayachandran. All rights reserved.
//

import Foundation
import Combine

class NYTServiceProvider: ServiceProviderProtocol {
//    https://api.nytimes.com/svc/topstories/v2/{section}.json
    func getCategories() -> Future<Category, Error> {
        return Future<Category, Error> { (promise) in
            guard let url = URLs.NYT.baseURLComponents.url else {
                return
            }
        }
    }
    
    func getLatestNews(category: Category?) -> Future<[NewsItem], Error> {
        return Future<[NewsItem], Error> { (promise) in
            guard let url = URLs.NYT.baseURLComponents.url else {
                return
            }
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { (data, url, error) in
            }
        }

    }
    
    
}
