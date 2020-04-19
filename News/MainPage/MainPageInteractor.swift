//
//  MainPageInteractor.swift
//  News
//
//  Created by v.a.jayachandran on 15/4/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import Foundation

protocol MainPageInteractorInput: MainPageUseCase {
    func start()
}

class MainPageInteractor: MainPageInteractorInput {
    
    
    let apiWorker = MainPageAPIWorker()
    
    func start() {
        apiWorker.fetchLatest(category: .home)
    }
    
    func selected(category: Category) {
        
    }

    
    func displayLatest() {
        
    }
    
    
}
