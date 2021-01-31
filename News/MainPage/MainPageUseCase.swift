//
//  MainPageUseCase.swift
//  News
//
//  Created by v.a.jayachandran on 15/4/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import Foundation

enum MainPageUseCase {
    typealias View = MainPageViewProtocol
    typealias Interactor = MainPageInteractorProtocol
    typealias Presenter = MainPagePresenterProtocol
    
}

protocol MainPageViewProtocol {
    var output: MainPageUseCase.Interactor? { get set }
}


protocol MainPageInteractorProtocol {
    
    var output: MainPageUseCase.Presenter? { get set }
    
    func start()
    
    func selected(category: Category)
    func selected(newsItem: NewsItem)
}

protocol MainPagePresenterProtocol {
    var output: MainPageUseCase.View { get set }
}

protocol MainPageMappingWorkerProtocol {
    func map(result: NYTResult) -> Future<[NewsItem], Never>
}

protocol MainPageAPIWorkerProtocol {
    func fetchLatest(category: Category) -> Future<NYTResult, Error>
    func search(string: String)
}




