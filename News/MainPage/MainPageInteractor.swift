//
//  MainPageInteractor.swift
//  News
//
//  Created by v.a.jayachandran on 15/4/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import Foundation
import Combine

protocol MainPageInteractorInput: MainPageUseCase {
    func start()
}

class MainPageInteractor: MainPageInteractorInput {
    
    
    let apiWorker = MainPageAPIWorker()
    let mappingWorker = MainPageMappingWorker()
    
    private var output: MainPagePresenterInput?
    
    init(output: MainPagePresenterInput) {
        self.output = output
    }
    
    func start() {
        displayLatest()
    }
    
    func selected(category: Category) {
        
    }

    private var cancellable: Cancellable?
    
    func displayLatest() {
        cancellable = apiWorker.fetchLatest(category: .home).receive(on: DispatchQueue.main).sink(receiveCompletion: { (completion) in
            print(completion)
        }) { [weak self] (result) in
            print(result)
            self?.cancellable = self?.mappingWorker.map(result: result).receive(on: DispatchQueue.main).sink(receiveCompletion: { (completion) in
                print(completion)
            }, receiveValue: { (newsItems) in
                self?.output?.display(newsItems: newsItems)
            })
        }
    }
    
    
}
