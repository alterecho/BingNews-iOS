//
//  MainPageUseCase.swift
//  News
//
//  Created by v.a.jayachandran on 15/4/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import Foundation
import Combine

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
    func displayLatest()
}

protocol MainPagePresenterProtocol {
    var output: MainPageUseCase.View? { get set }
    
    func showCategories()
    func display(newsItems: [NewsItem])
    func showAlert(title: String, message: String)
}

protocol MainPageMappingWorkerProtocol {
    func map(result: NYTResult) -> Future<[NewsItem], Never>
}

protocol MainPageAPIWorkerProtocol {
    func fetchLatest(category: String) -> Future<NYTResult, Error>
    func search(string: String)
}




