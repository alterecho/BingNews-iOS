//
//  MainPageAPIWorker.swift
//  News
//
//  Created by v.a.jayachandran on 15/4/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import Foundation
import Combine

protocol MainPageAPIWorkerProtocol {
    func fetchLatest(category: Category) -> Future<NYTResult, Error>
    func search(string: String)
}

enum Error: Swift.Error {
    case invalidResponse(Int?)
    case invalidURL(String)
    case common(String)
}

class MainPageAPIWorker: MainPageAPIWorkerProtocol {
    
    private var cancellable: Cancellable?
    
    func fetchLatest(category: Category) -> Future<NYTResult, Error> {
        
        return Future<NYTResult, Error> { [weak self] promise in
            self?.cancellable?.cancel()
            let urlString = URLs.NYT.base + URLs.NYT.topStories()
            guard let url = URL(string: urlString) else {
                promise(.failure(.invalidURL(urlString)))
                return
            }
            let request = URLRequest(url: url)
            self?.cancellable = URLSession.shared.dataTaskPublisher(for: request).tryMap { output throws -> Data in
                if let response = output.response as? HTTPURLResponse, response.statusCode != 200 {
                    throw Error.invalidResponse(response.statusCode)
                }
                return output.data
            }.decode(type: NYTResult.self, decoder: JSONDecoder()).eraseToAnyPublisher()
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    if let error = error as? Error {
                        promise(.failure(error))
                    } else {
                        promise(.failure(.common(error.localizedDescription)))
                    }
                }
            }) { (result) in
                promise(.success(result))
            }
        }
        
    }
    
    func search(string: String) {
        
    }
}
