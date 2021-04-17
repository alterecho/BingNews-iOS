//
//  ServiceProviderProtocol.swift
//  News
//
//  Created by Vijaychandran Jayachandran on 10/4/21.
//  Copyright © 2021 v.a.jayachandran. All rights reserved.
//

import Combine

protocol ServiceProviderProtocol {
    func getCategories() -> Future<[String], Error>
    func getLatestNews(category: String?) -> Future<[NewsItem], Error>
}
