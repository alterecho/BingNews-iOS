//
//  MainPageAPIWorker.swift
//  News
//
//  Created by v.a.jayachandran on 15/4/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import Foundation

protocol MainPageAPIWorkerProtocol {
    func fetchLatest(category: Category)
    func search(string: String)
}

class MainPageAPIWorker: MainPageAPIWorkerProtocol {
    func fetchLatest(category: Category) {
        
    }
    
    func search(string: String) {
        
    }
}
