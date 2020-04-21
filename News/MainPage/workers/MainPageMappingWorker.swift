//
//  MainPageMappingWorker.swift
//  News
//
//  Created by v.a.jayachandran on 20/4/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import Combine

protocol MainPageMappingWorkerProtocol {
    func map(result: NYTResult) -> Future<[NewsItem], Never>
}

class MainPageMappingWorker: MainPageMappingWorkerProtocol {
    func map(result: NYTResult) -> Future<[NewsItem], Never> {
        return Future<[NewsItem], Never> { promise in
            let newsItems = result.toNewsItems()
            promise(.success(newsItems))
        }
    }
}
