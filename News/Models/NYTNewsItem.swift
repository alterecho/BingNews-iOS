//
//  NYTNewsItem.swift
//  News
//
//  Created by v.a.jayachandran on 19/4/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import Foundation

struct NewsItem: Identifiable {
    var id = UUID()
    var title: String
    var content: String
    var url: URL?
    var imageURL: URL?
    var category: String
}

protocol NewsItemConvertible {
    func toNewsItem() -> NewsItem
}

protocol NewsItemsConvertible {
    func toNewsItems() -> [NewsItem]
}


struct NYTResult: Decodable, NewsItemsConvertible {
    
    var status: String?
    var copyright: String?
    var section: String?
    var last_updated: String?
    var num_results: Int?
    var results: [Article]

    func toNewsItems() -> [NewsItem] {
        return results.map { $0.toNewsItem() }
    }
    
    struct Article: Decodable, NewsItemConvertible {
        func toNewsItem() -> NewsItem {
            let imageURL = URL(string: mutlimedia?.first?.url ?? "")
            let newsItem = NewsItem(
                title: title ?? "",
                content: "",
                url: URL(string: url ?? ""),
                imageURL: imageURL,
                category: "category"
            )
            return newsItem
        }
        
        let section: String?
        let title: String?
        let abstract: String?
        let url: String?
        let byline: String?
        let updated_date: String?
        let created_date: String?
        let published_date: String?
        let mutlimedia: [Multimedia]?
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
