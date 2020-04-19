//
//  URLs.swift
//  News
//
//  Created by v.a.jayachandran on 15/4/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import Foundation

enum URLs {
    
}

extension URLs {
    enum NYT {
        static let base = "https://api.nytimes.com/svc/"
        
        static func topStories() -> String {
            return "topstories/v2/arts.json?api-key=\(Config.key)"
        }
    }    
}
