//
//  NYTNewsItem.swift
//  News
//
//  Created by v.a.jayachandran on 19/4/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import Foundation

protocol NewsItem {
    var title: String { get }
    var content: String { get }
    var url: URL? { get }
    var imageURL: URL? { get }
}

struct NYTResult: Decodable {
    var status: String?
    var copyright: String?
    var section: String?
    var last_updated: String?
    var num_results: Int?
    var results: [Article]
    
    struct Article: Decodable {
        let section: String?
        let title: String?
        let abstract: String?
        let urlString: String?
        let byline: String?
        let updated_date: String?
        let created_date: String?
        let published_date: String?
        let mutlimedia: String?
        let short_url: String?
        
        struct Multimedia: Decodable {
            var url: String?
            var format: String?
            var height: String?
            var width: String?
            var type: String?
            var subtype: String?
            var caption: String?
            var copyright: String?
        }
    }
    
}
