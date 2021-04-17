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
    
    /// defined at https://developer.nytimes.com/docs/top-stories-product/1/routes/%7Bsection%7D.json/get
    enum Sections: String, CaseIterable {
        case arts, automobiles, books, business, fashion, food, health
        case home, insider, magazine, movies, nyregion, obituaries, opinion
        case politics, realestate, science, sports, sundayreview, technology
        case theater, tmagazine, travel, upshot, us, world
        case miscelleneous
    }

//    https://api.nytimes.com/svc/topstories/v2/{section}.json
    func getCategories() -> Future<[String], Error> {
        return Future<[String], Error> { (promise) in
            promise(.success(Sections.allCases.map { $0.rawValue }))
        }
    }
    
    func getLatestNews(category: String?) -> Future<[NewsItem], Error> {
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
