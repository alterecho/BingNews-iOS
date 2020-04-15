//
//  ContentView.swift
//  News
//
//  Created by v.a.jayachandran on 15/4/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let names = [
        "he1", "ll2", "o3"
    ]
    
    let tableData: [String]
    
    init() {
        if let url = Bundle.main.url(forResource: "names", withExtension: "json"),
            let data = try? Data(contentsOf: url),
            let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String : Any],
            let array = json["names"] as? [String] {
            tableData = array
        } else {
            tableData = names
        }
    }
    
    var body: some View {
        NavigationView {
//            Text("Hello")
                
                
            List (tableData, id: \.self) { dat in
                Text(dat)
            }
                
            .navigationBarTitle(Text("News"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
