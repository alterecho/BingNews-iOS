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
        guard let url = URL(string: URLs.NYT.base + URLs.NYT.topStories()) else {
            return
        }
        
        var request = URLRequest(url: url)
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data else {
                return
            }
            
            if let error = error {
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let result = try decoder.decode(NYTResult.self, from: data)
                print(result.results)
            } catch {
                print(error)
            }
        }
        dataTask.resume()
    }
    
    func search(string: String) {
        
    }
}
