//
//  URLsProtocols.swift
//  News
//
//  Created by Vijaychandran Jayachandran on 17/4/21.
//  Copyright © 2021 v.a.jayachandran. All rights reserved.
//

import Foundation

protocol URLsProtocol {
    static var baseURLString: String { get }
    static var baseURL: URL { get }
    static var baseURLComponents: URLComponents { get }
    
    static func getBaseURL() -> URL
    static func getBaseURLComponents() -> URLComponents
    
    static var topStoriesURL: URL { get }
}

extension URLsProtocol {
    static func getBaseURL() -> URL {
        let baseURLString = Self.baseURLString
        guard let url = URL(string: baseURLString) else {
            fatalError("invalid base url \(baseURLString)")
        }
        return url
    }

    static func getBaseURLComponents() -> URLComponents {
        let baseURLString = Self.baseURLString
        guard let url = URLComponents(string: baseURLString) else {
            fatalError("invalid base url \(baseURLString)")
        }
        return url
    }
}
