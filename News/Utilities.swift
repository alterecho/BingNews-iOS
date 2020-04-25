//
//  Utilities.swift
//  News
//
//  Created by v.a.jayachandran on 24/4/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import SwiftUI

protocol Bindable: AnyObject {
    func binding<T>(path: ReferenceWritableKeyPath<Self, T>, default: T) -> Binding<T>
}

extension Bindable {
    
    func binding<T>(path: ReferenceWritableKeyPath<Self, T>, default: T) -> Binding<T> {
        
        let b = Binding<T>(get: { [weak self]() -> T in
            return self?[keyPath: path] ?? `default`
        }) { [weak self] (obj) in
            self?[keyPath: path] = obj
        }
        
        return b
    }
}
