//
//  MainPagePresenter.swift
//  News
//
//  Created by v.a.jayachandran on 15/4/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import Foundation

protocol MainPagePresenterInput: class {
    func showCategories()
    func display(newsItems: [NewsItem])
    
    init()
}

protocol MainPagePresenterOutput {
    func update(vm: MainPageVM)
}

class MainPagePresenter: MainPagePresenterInput {
    
    private var vm: MainPageVM
    private var output: MainPagePresenterOutput?
    
    required init() {
        vm = MainPageVM(newsItems: [])
    }
    
    func showCategories() {
        vm.showCategories = true
    }
    
    func display(newsItems: [NewsItem]) {
        vm.newsItems = newsItems
        output?.update(vm: vm)
    }
}
