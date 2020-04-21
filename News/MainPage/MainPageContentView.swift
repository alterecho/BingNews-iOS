//
//  MainPageContentView.swift
//  News
//
//  Created by v.a.jayachandran on 15/4/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import SwiftUI

struct MainPageContentView: View, MainPagePresenterOutput {
    
    struct ViewModel {
        @State var showAlert: Bool = false
    }
    
    func update(vm: MainPageVM) {
        
    }
    
    let output: MainPageInteractorInput
    
    var vm: ViewModel = ViewModel()
    
    var body: some View {
        VStack {
            Text("Hello")
                .onAppear {
                    self.output.start()
            }
            
            Button(action: {
//                self.output.displayLatest()
//                self.vm = ViewModel(showAlert: true)
                self.vm.showAlert = true
            }) {
                HStack {
                    Image(systemName: "repeat")
                    Text("Refresh")
                }
            }
                .alert(isPresented: vm.$showAlert) { () -> Alert in
                Alert(title: Text("Title"), message: Text("message"), dismissButton: .default(Text("label"), action: {
                    print("action")
                }
                    )
                )
            }
            
        }
    }
}
