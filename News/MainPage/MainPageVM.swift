//
//  MainPageVM.swift
//  News
//
//  Created by v.a.jayachandran on 20/4/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import Combine

struct AlertVM {
    var title: String?
    var message: String?
    var primaryButtonTitle: String?
    var secondaryButtonTitle: String?
}

final class MainPageVM: ObservableObject, Bindable {
    
    @Published var showAlert: Bool = false
    @Published var newsItems: [NewsItem] = []
    @Published var showCategories: Bool = false
    var alertVM: AlertVM = AlertVM() {
        didSet {
            showAlert = true
        }
    }
    
    init() {
    }
    
}
