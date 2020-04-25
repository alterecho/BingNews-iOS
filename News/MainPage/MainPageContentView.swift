//
//  MainPageContentView.swift
//  News
//
//  Created by v.a.jayachandran on 15/4/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import SwiftUI
import Combine

struct MainPageContentView: View {
            
    let output: MainPageInteractorInput
    @ObservedObject private var vm: MainPageVM
        
    init(vm: MainPageVM, output: MainPageInteractorInput) {
        self.vm = vm
        self.output = output
    }
        
    var body: some View {
        return VStack {
            
            Text("Hello \(arc4random() % 10) \(self.vm.showAlert ? "true" : "false")")
                .onAppear {
                    self.output.start()
            }
            
            Button(action: {
                self.vm.alertVM = AlertVM(title: "Hello \(arc4random() % 10)", message: "djsv \(arc4random() % 10)", primaryButtonTitle: "ok")
//                self.output.displayLatest()
            }) {
                HStack {
                    Image(systemName: "repeat")
                    Text("Refresh")
                }
            }

            .alert(isPresented: vm.binding(path: \MainPageVM.showAlert, default: false)) { () -> Alert in
                Alert(vm: vm.alertVM)
            }
        }
        
    }
}
