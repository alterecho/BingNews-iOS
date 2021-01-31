//
//  MainPageContentView.swift
//  News
//
//  Created by v.a.jayachandran on 15/4/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import SwiftUI
import Combine

struct NewsItemCell: View {
    
    var newsItem: NewsItem
    
    var body: some View {
        return Text("\(newsItem.title)").lineLimit(1)
    }
}

struct MainPageContentView: View {
            
    let output: MainPageInteractorInput
    @ObservedObject private var vm: MainPageVM
        
    init(vm: MainPageVM, output: MainPageInteractorInput) {
        self.vm = vm
        self.output = output
    }
        
    var body: some View {
        return VStack {
            
            NavigationView {
                
                List(vm.newsItems) { item in
                    NewsItemCell(newsItem: item).onTapGesture {
                        output.
                    }
                }
                .navigationBarTitle("Main Page")

            }
            
            
            Button(action: {
                self.output.displayLatest()
            }) {
                HStack {
                    Image(systemName: "repeat")
                    Text("Refresh")
                }
            }
                
                
            .alert(isPresented: vm.binding(path: \MainPageVM.showAlert, default: false)) { () -> Alert in
                Alert(vm: vm.alertVM, primaryAction: {
                    self.vm.showAlert = false
                })
            }
                
            .onAppear {
                self.output.start()
            }
            
            
        }
        
    }
}
