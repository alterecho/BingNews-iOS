//
//  MainPageInteractor.swift
//  News
//
//  Created by v.a.jayachandran on 15/4/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import Foundation
import Combine

class MainPageInteractor: MainPageUseCase.Interactor {
    var output: MainPageUseCase.Presenter?
    let apiWorker = MainPageAPIWorker()
    let mappingWorker = MainPageMappingWorker()
    
    init(output: MainPageUseCase.Presenter) {
        self.output = output
    }
    
    func start() {
        displayLatest()
    }
    
    func selected(category: Category) {
        
    }
    
    func selected(newsItem: NewsItem) {
        
    }

    private var cancellable: Cancellable?
    
    func displayLatest() {
        cancellable = apiWorker.fetchLatest(category: .home).receive(on: DispatchQueue.main).sink(receiveCompletion: { [weak self] (completion) in
            print(completion)
            
            switch completion {
            case .failure(let error):
                self?.output?.showAlert(title: "error", message: error.localizedDescription)
            case .finished:
                break
            }
        }) { [weak self] (result) in
            self?.cancellable = self?.mappingWorker.map(result: result).receive(on: DispatchQueue.main).sink(receiveCompletion: { (completion) in
                print(completion)
                switch completion {
                case .finished:
                    break
                }
            }, receiveValue: { (newsItems) in
                self?.output?.display(newsItems: newsItems)
            })
        }
    }
    
    
}
