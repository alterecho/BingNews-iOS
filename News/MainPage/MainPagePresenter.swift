//
//  MainPagePresenter.swift
//  News
//
//  Created by v.a.jayachandran on 15/4/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import Foundation

class MainPagePresenter: MainPageUseCase.Presenter {
    var output: MainPageUseCase.View?
    
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
