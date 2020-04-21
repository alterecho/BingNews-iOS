//
//  MainPageVM.swift
//  News
//
//  Created by v.a.jayachandran on 20/4/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import Foundation

class MainPageVM {
    var newsItems: [NewsItem]
    var showCategories: Bool = false
    
    init(newsItems: [NewsItem]) {
        self.newsItems = newsItems
    }
}
