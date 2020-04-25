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
    func showAlert(title: String, message: String)
    
    init()
}

protocol MainPagePresenterOutput {
}

class MainPagePresenter: MainPagePresenterInput {
    
    private(set) var vm: MainPageVM
    
    required init() {
        vm = MainPageVM()
    }
    
    func showCategories() {
        vm.showCategories = true
    }
    
    func display(newsItems: [NewsItem]) {
        vm.newsItems = newsItems
    }
    
    func showAlert(title: String, message: String) {
        vm.alertVM.message = message
        vm.alertVM.title = title
        vm.alertVM.primaryButtonTitle = "okk"
        vm.showAlert = true
    }
}
